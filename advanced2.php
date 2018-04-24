<?php
// CITATION: uses the simple_html_dom.php library
// documentation here: http://simplehtmldom.sourceforge.net/manual.htm

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
  $semseter_row = $result->fetch_assoc();
  $semester = $semester_row["sem_avg"];
  //echo "<br>Commonly taken in semester: $semester";
  //echo "<br>";
}

function scrape_cs_page($course) {
    // Uses this library to aid in web scraping
    require("simple_html_dom.php");
    
    // The link on the webpage will always default to the semester of the
    // current registration period.
    $url = "https://cs.illinois.edu/courses/profile/CS$course";
    //echo "$url";
    $html = file_get_html($url);
    
    // For course times and section names, go through tbody tag
    $times_list = $html->find("tbody");
    
    echo "<table>";
    echo "<tr>";
    echo "<th>Course</th>";
    echo "<th>Section</th>";
    echo "<th>Time</th>";
    echo "<th>Days</th>";
    echo "</tr>";
    
    $i = 0;
    while ($times_list->children($i) != $times_list->last_child) {
        $one_course = $times_list->children($i);
        $section = $one_course->children(1);
        $time = $one_course->children(5);
        $days = $one_course->children(6);

        echo "<tr>";
        echo "<td>CS$course</td>";
        echo "<td>$section</td>";
        echo "<td>$time</td>";
        echo "<td>$days</td>";
        echo "</tr>";
        $i++;
    }
    
    // Add last child
    $one_course = $times_list->children($i);
    $section = $one_course->children(1);
    $time = $one_course->children(5);
    $days = $one_course->children(6);

    echo "<tr>";
    echo "<td>CS$course</td>";
    echo "<td>$section</td>";
    echo "<td>$time</td>";
    echo "<td>$days</td>";
    echo "</tr>";
    
    echo "</table>";
    
    // Find first element which class=extCoursesProfileContent
    $description = $html->find(".extCoursesProfileContent", 0)->innertext;
    echo $description;
    
    $learning_objectives = $html->find(".extCoursesProfileContent", 1)->first_child->innertext;
    echo $learning_objectives;
    
    $topic_list = $html->find(".extCoursesProfileContent", 2)->first_child->innertext;
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
              FROM KoofersAvggpa
              WHERE Code = '$course'";
    $result = $mysqli->query($query);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row["KoofersAvggpa"];
    } else {
        return "Not on Koofer's website.";
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
    
    echo "<h3> Other Courses These Instructors Teach";
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
$course = $_GET["Course"];

$course_opinion = get_course_info($course);
$opinion_row = $course_opinion->fetch_assoc();
$workload = $opinion_row['Workload'];
$usefulness = $opinion_row['Usefulness'];
$difficulty = $opinion_row['Difficulty'];
$opinion_count = $opinion_row['Opinion_Count'];

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
echo "<td>$GPA</td>";
echo "</tr>";
echo "</table>";

get_avg_semester($course);

echo "<h3>GPA From Websites</h3>";
$WadeGPA = analyze_wades_dataset($course);
echo "GPA analysis from Wade Fagan's FOIA request: $WadeGPA <br>";
$KoofersGPA = analyze_koofers_gpa($course);
echo "GPA from Koofers website: $KoofersGPA<br>";

GPA_by_prof($course);

scrape_cs_page($course);

$mysqli->close();
?>