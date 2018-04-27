<?php
//CITATIONS : A THE CLASS HAS BEEN REFERENCED FROM THIS TUTORIAL 
//LINK: https://medium.com/@BeingJayDesai/learn-web-scraping-using-php-1306d3c79ecb

$mysqli = new mysqli("localhost","foobarcs411_rohan2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

function get_course_info($course) {
    global $mysqli;
    
    $course = $_GET["Course"];

    $query = "SELECT Workload, Usefulness, Difficulty, Opinion_Count
              FROM Course
              WHERE Code = '$course'";
    $result = $mysqli->query($query);
    
    return $result;
}

function get_avg_semester($course) {
  global $mysqli;
  
  $query = "SELECT AVG(Semester) AS sem_avg
            FROM Hastaken
            WHERE Code = '$course'";
  $result = $mysqli->query($query);
 
  $semester_row = $result->fetch_assoc();
  $semester = $semester_row["sem_avg"];
  //echo "<br>Commonly taken in semester: $semester";
  //echo "<br>";
}

function analyze_wades_dataset($course) {
    global $mysqli;
    
    $query = "SELECT WadeAvgGPA
              FROM CoursesWithWadeAvgGpa
              WHERE Code = '$course'";
    
    $result = $mysqli->query($query);
    $row = $result->fetch_assoc();
    return $row["WadeAvgGPA"];
}

function analyze_koofers_gpa($course) {
    global $mysqli;
    
    $query = "SELECT KoofersAvggpa
              FROM CoursesWithKoofersAvgGpa
              WHERE Code = '$course'";
    $result = $mysqli->query($query);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row["KoofersAvggpa"];
    } else {
        return "Not on Koofer's website.";
    }
        
}
function predict_avg_gpa($avggpatotal,$avggpalevel,$avggpafield){
  if($avggpafield>0){
      if($avggpalevel>0){
          return ($avggpafield+$avggpalevel)/2;
      }
      else{
          return $avggpafield;
      }
  }
  else if($avggpalevel>0){
      return $avggpalevel;
  }
  else{
      return $avggpatotal;
  }

}

function GPA_by_prof($course) {
    global $mysqli;
    
    $query = "SELECT PrimaryInstructor,  (4.0 * SUM(Aplus) + 4.0 * Sum(A) + 3.67 * Sum(Aminus) + 3.33 * Sum(Bplus) + 3 * Sum(B) + 2.67 * Sum(Bminus) + 2.33 * SUM(Cplus) + 2 * SUM(C) + 1.67 * SUM(Cminus) + 1.33 * SUM(Dplus) + SUM(D) + 0.67 * SUM(Dminus) + 0 * SUM(F)) / (SUM(Aplus) +  Sum(A) + Sum(Aminus) + Sum(Bplus) + Sum(B) + Sum(Bminus) + SUM(Cplus) + SUM(C) + SUM(Cminus) + SUM(Dplus) + SUM(D) + SUM(Dminus) + SUM(F)) AS GPA
              FROM WadeCourseInfo
              WHERE Number = '$course'
              GROUP BY PrimaryInstructor";
    $result = $mysqli->query($query);
    
    echo "<h3>Professor Info</h3>";
    echo "<table>";
    echo "<tr>";
    echo "<th>Professor</th>";
    echo "<th>Average GPA</th>";
    echo "</tr>";
    
    $profs = array();
    $i = 0;

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        $prof = $row["PrimaryInstructor"];
        $profs[$i] = $prof;
        $i += 1;
        echo "<td>$prof</td>";
        $a = $row["GPA"];
        echo "<td>$a</td>";
        echo "</tr>";
    }
    echo "</table>";
    
    echo "<h3> Other Courses These Instructors Teach </h3>";
    echo "<table>";
    echo "<tr>";
    echo "<th>Instructor</th>";
    echo "<th>Course</th>";
    echo "<th>GPA</th>";
    echo "</tr>";
    
    $i--;
    while ($i >= 0) {
        $query2 = "SELECT PrimaryInstructor, Number,  (4.0 * SUM(Aplus) + 4.0 * Sum(A) + 3.67 * Sum(Aminus) + 3.33 * Sum(Bplus) + 3 * Sum(B) + 2.67 * Sum(Bminus) + 2.33 * SUM(Cplus) + 2 * SUM(C) + 1.67 * SUM(Cminus) + 1.33 * SUM(Dplus) + SUM(D) + 0.67 * SUM(Dminus) + 0 * SUM(F)) / (SUM(Aplus) +  Sum(A) + Sum(Aminus) + Sum(Bplus) + Sum(B) + Sum(Bminus) + SUM(Cplus) + SUM(C) + SUM(Cminus) + SUM(Dplus) + SUM(D) + SUM(Dminus) + SUM(F)) AS GPA
              FROM WadeCourseInfo
              WHERE PrimaryInstructor = '$profs[$i]'
              AND Number <> $course
              GROUP BY PrimaryInstructor";
        $result2 = $mysqli->query($query2);
        
        while ($row = $result2->fetch_assoc()) {
            echo "<tr>";
            $prof2 = $row["PrimaryInstructor"];
            echo "<td>$prof2</td>";
            $course2 = $row["Number"];
            echo "<td>$course2</td>";
            $gpa2 = $row["GPA"];
            echo "<td>$gpa2</td>";
            echo "</tr>";
        }
        $i--;
    }
    echo "</table>";
}
session_start();
$myusername = $_SESSION['username'];

//$email = $_GET["email"];
$email = $myusername;
$course = $_GET["Course"];

$course_opinion = get_course_info($course);
$opinion_row = $course_opinion->fetch_assoc();
$workload = $opinion_row['Workload'];
$usefulness = $opinion_row['Usefulness'];
$difficulty = $opinion_row['Difficulty'];
$opinion_count = $opinion_row['Opinion_Count'];

if ($opinion_count > 0) {
    echo "<table>";
    echo "<tr>";
    echo "<th>Number of Opinions</th>";
    echo "<th>Workload</th>";
    echo "<th>Usefulness</th>";
    echo "<th>Difficulty</th>";
    echo "</tr>";
    echo "<tr>";
    echo "<td>$opinion_count</td>";
    echo "<td>$workload</td>";
    echo "<td>$usefulness</td>";
    echo "<td>$difficulty</td>";
    echo "</tr>";
    echo "</table>";
}

get_avg_semester($course);

$query2='';
if($course<200){
$query2="SELECT DISTINCT AVG(GPA) FROM Hastaken WHERE Email='$email' AND Code<200";

}
else if($course<300){
   $query2="SELECT DISTINCT AVG(GPA) FROM Hastaken WHERE Email='$email' AND Code<300"; 
}
else if($course<400){
    $query2="SELECT DISTINCT AVG(GPA) FROM Hastaken WHERE Email='$email' AND Code<400";
}
else {
    $query2="SELECT DISTINCT AVG(GPA) FROM Hastaken WHERE Email='$email' AND Code<500";
}

$result2= $mysqli->query($query2);
$numrows=$result2->num_rows;
$avggpalevel=0;
if($numrows>0){
    $row=$result2->fetch_assoc();
    $avggpalevel=$row['AVG(GPA)'];
}


$avggpatotal=0;

$query = "SELECT AVG(GPA) FROM Hastaken WHERE Email='$email'";
$result= $mysqli->query($query);
$numrows = $result->num_rows;
if($numrows>0){
    $row=$result->fetch_assoc();
    $avggpatotal= $row['AVG(GPA)'];
}

$avggpafield=0;
$query3 ="SELECT AVG(GPA) FROM Hastaken WHERE Email='$email' AND Code IN ( SELECT Code FROM Course WHERE Field IN (SELECT DISTINCT Field FROM Course WHERE Code='$course'))";
$result3= $mysqli->query($query);
$numrows = $result3->num_rows;
if($numrows>0){
$row=$result3->fetch_assoc();
$avggpafield= $row['AVG(GPA)'];
    
}

$indicator=0;

$indicator=predict_avg_gpa($avggpatotal,$avggpalevel,$avggpafield);
if ($indicator > 0) {
echo "<h3> How your previous data predicts you will perform in this course </h3>";
echo $indicator;
}

echo "<h3>GPA From Websites</h3>";
$WadeGPA = analyze_wades_dataset($course);
echo "GPA analysis from Wade Fagan's FOIA request: $WadeGPA <br>";
$KoofersGPA = analyze_koofers_gpa($course);
echo "GPA from Koofers website: $KoofersGPA<br>";

GPA_by_prof($course);

class webscraping{
   public $url;
public $source;

function __construct($url) {
$this->url = $url;

$this->source = $this->getCurl($this->url);

$this->pathObj= $this->getXPathObj($this->source);

    
}

public function getCurl($url) {

$ch = curl_init();


curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);

curl_setopt($ch, CURLOPT_URL, $url);

$results = curl_exec($ch);

curl_close($ch);

return $results;
    
}
// Method to get XPath object
public function getXPathObj($item) {
    $xmlPageDom = new DomDocument();

    @$xmlPageDom->loadHTML($item);
    $xmlPageXPath = new DOMXPath($xmlPageDom);
    return $xmlPageXPath; 
}
}


$code=$course;
$url="http://ws.engr.illinois.edu/courses/item.asp?n=3&course=CS{$course}";
$html = file_get_contents($url); //get the html returned from the following url

$html = str_replace(["document.write('","');"], "", $html);
$html = str_replace('\"', '"', $html);
$doc = new DOMDocument();

libxml_use_internal_errors(TRUE); //disable libxml errors

if(!empty($html)){ //if any html is actually returned

	$doc->loadHTML($html);
	libxml_clear_errors(); //remove errors for yucky html
	
	$xpath = new DOMXPath($doc);

	//get all the h2's with an id
  
	$drow = $xpath->query('//div[@class="extCoursesProfileContent"]');
	
	if($drow->length > 0){
        echo "<br>";
        echo "<h3>Course Description</h3>";
	    $i=0;
			echo "<h4 span style=\"font-weight:normal;\">" . $drow[0]->textContent . "</h4>";
			if($i>4){
			    break;
			}
			$i=$i+1;
				if($drow[1]->nodeValue){
			echo "<h3>Prerequisites</h3>";
			echo "<h4 span style=\"font-weight:normal;\">" . $drow[1]->textContent . "</h4>";
			}
			if($drow[2]->nodeValue){
			echo "<h3>Course Director</h3>";
		    echo "<h4 span style=\"font-weight:normal;\">" . $drow[2]->textContent . "</h4>";
			}
			if($drow[3]->nodeValue){
			echo "<h3>Learning Goals</h3>";
			echo "<h4 span style=\"font-weight:normal;\">" . $drow[3]->textContent . "</h4>";
			}
			
			if($drow[4]->nodeValue){
			echo "<h3>Topic List</h3>";
			echo "<h4 span style=\"font-weight:normal;\">" . $drow[0]->textContent . "</h4>";
			}
	}
	
	$titles = $xpath->query('//td[@class="extCoursesTTtitle"]');
	$sections = $xpath->query('//td[@class="extCoursesTTsect"]');
	$times = $xpath->query('//td[@class="extCoursesTTtime"]');
	$days = $xpath->query('//td[@class="extCoursesTTdays"]');
	
	echo "<h3>Times Offered</h3>";
	
	echo "<table>";
    echo "<tr>";
    echo "<th>Course</th>";
    echo "<th>Section</th>";
    echo "<th>Time</th>";
    echo "<th>Days</th>";
    echo "</tr>";
    
    $i = 0;
    while ($i < $titles->length) {
        $title = $titles->item($i)->textContent;
        $section = $sections->item($i)->textContent;
        $time = $times->item($i)->textContent;
        $day = $days->item($i)->textContent;

        echo "<tr>";
        echo "<td>CS$course</td>";
        echo "<td>$section</td>";
        echo "<td>$time</td>";
        echo "<td>$day</td>";
        echo "</tr>";
        $i++;
    }
    
    echo "</table>";
}



$mysqli->close();
?>