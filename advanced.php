<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if($mysqli->connect_errno)
{
    echo "Failed to connect to MySql: ( " .$mysqli->connect_errno . ")".
        $mysqli->connect_error;
}

// Get's a tech elective based on priority
// If their priority is learning, it picks one from their field of study
function get_tech_elective($myusername, $priority, $fos) {
    global $mysqli;
    
    $query = "";
    if ($priority == "HighGPA") {
        $query = "SELECT Code 
                  FROM Course 
                  WHERE Code NOT IN ( 
                    SELECT Code 
                    FROM Hastaken 
                    WHERE Email = '$myusername') 
                  ORDER BY GPA DESC, Difficulty ASC 
                  LIMIT 6";
    } else { // learning
        $query = "SELECT Code 
                  FROM Course 
                  WHERE Code NOT IN ( 
                    SELECT Code 
                    FROM Hastaken 
                    WHERE Email = '$myusername') AND 
                  Field = '$fos' 
                  ORDER BY Usefulness DESC 
                  LIMIT 6";
    }
    $result = $mysqli->query($query);
    
    return $result;
}

// Get's the user's field of study
function get_fos($myusername) {
    global $mysqli;
    
    $query = "SELECT Field_of_study 
              FROM User 
              WHERE Email = '$myusername'";
    $result = $mysqli->query($query);
    $row = $result->fetch_assoc();
    $fos = $row["Field_of_study"];
    return $fos;
}

// Get the user's semester
function get_semester($myusername) {
    global $mysqli;
    
    $query = "SELECT Current_Semester 
              FROM User 
              WHERE Email = '$myusername'";
    $result = $mysqli->query($query);
    $row = $result->fetch_assoc();
    $semester = $row["Current_Semester"];
    return $semester;
}

// Assumes in Course, the Field = "G" if the class
// fulfills the group project requirement
// Returns 1 for true if fulfilled
// Returns 0 for false if not
function get_group_project_fulfilled($myusername) {
    global $mysqli;
    
    $query = "SELECT Code 
              FROM Hastaken 
              WHERE Email = '$myusername' AND 
              Code IN ( 
                SELECT Code 
                From Course 
                WHERE Field = 'Group')";
    $result = $mysqli->query($query);
    
    if ($result->num_rows > 0) {
        return 1;
    } else {
        return 0;
    }
}

// Get the group project course based on their priority
function get_group_project($myusername, $priority) {
    global $mysqli;
    
    $query = "";
    if ($priority == "HighGPA") {
        $query = "SELECT Code 
                  FROM Course 
                  WHERE Field = 'Group' AND 
                  Code NOT IN ( 
                    SELECT Code 
                    FROM Hastaken 
                    WHERE Email = '$myusername') 
                  ORDER BY GPA DESC, Difficulty ASC 
                  LIMIT 1";
    } else { // Learning
        $query = "SELECT Code 
                  FROM Course 
                  WHERE Field = 'Group' AND 
                  WHERE Code NOT IN ( 
                    SELECT Code 
                    FROM Hastaken 
                    WHERE Email = '$myusername') 
                  ORDER BY Usefulness DESC
                  LIMIT 1";
    }
    $result = $mysqli->query($query);
    
    if (mysqli_num_rows($result) > 0) {
        $row = $result->fetch_assoc();
        $course = $row["Code"];
        
    } else {
        $course = "nothing";
    }
    
    return $course;
}

function courseinschedule($course,$schedule)
{
    $i=0;
    while($i<count($schedule))
    {
        if($schedule[$i]==$course)
        {
            return 1;
        }
        $i++;
    }
    return 0;
}
function done225($Email)
{
    global $mysqli;
    $query= "SELECT * FROM Hastaken WHERE Email = '$Email' AND Code=225"; 
    $result = $mysqli->query($query);
    $numrows = $result->num_rows;
    if($numrows != 0)   
    { 
       // print("<br> Yes you have done 225");
        return 1;
    }
    else  
    { 
      //  print("<br> No you have not done 225");
        return 0;
    }

}
function requiredcourses(&$finishedallrequiredcourses,&$credithours,&$codes,$Email,$schedule) //lavisha version
{
    global $mysqli;
    $query= "SELECT Code FROM Course WHERE Required='r' AND Code NOT IN (SELECT Code from Hastaken WHERE Email='$Email') ORDER BY Code ASC"; 
    $result = $mysqli->query($query);
    $numrows = $result->num_rows;
    $course = Dataanalysis($numrows, $result, 'Code');
    while(courseinschedule($course,$schedule)) 
    {
        print("<br> Predicted req course {$course} already scheduled ");
        $course = Dataanalysis($numrows, $result, 'Code');   
    }
    if ($course != 0  )
    {
        $credithours = $credithours - 3;
        $query4 = "SELECT AVG(GPA) FROM Course GROUP BY Code HAVING Code='$course'";
        $result4 = $mysqli->query($query4);
        $numrows = $result4->num_rows;
        $codes[count($codes)] = Dataanalysis($numrows, $result4, 'AVG(GPA)'); 
        print ("<br>Giving you {$course}..");  
    }
    else 
    {
        $finishedallrequiredcourses = 1; 
        print('<br>Congrats! You seem to have completed all required courses!');//yes all required courses have been finished. no required courses left  possibly have to query the tech electives table ?
    }
    return $course;
}
function geneds($Email,&$codes,$avggpagened,&$credithours,&$genedhoursleft)
{
    global $mysqli;
    $query2= "SELECT genedhours FROM User WHERE Email='$Email'";
    $result2 =$mysqli->query($query2);
    $numrows = $result2->num_rows;

    $genedhours_left = 18-Dataanalysis($numrows,$result2,'genedhours');
    if($genedhoursleft==0) // if its the first time coming to this fn geneds
        $genedhoursleft=$genedhours_left;

    if($genedhoursleft>0) // lavisha changed from genedhours_left
    {
        //$course= 'Take One GenEd Course. ( We have linked a list of gened courses along with their information on the webpage. That data Analysis was done by Professor Wade Fagen';
        $course= 'GenEd';
        $codes[count($codes)] =$avggpagened; // lavisha- index of codes
        $credithours =$credithours-3;
        $genedhoursleft=$genedhoursleft-3; //lavisha changed from $genedhoursleft=$genedhours_left-3;
        print ("<br>Giving you {$course}.."); 
    }
    else
    {
        $course ='nothing'; 
        print('<br>Congrats! You seem to have completed all Gened hours!');// no genedhours left;
    }
    return $course;
}

function scienceelectives($Email,&$codes,$avggpascienceelective,&$credithours,&$scienceelectivesleft)
{
    global $mysqli;
    $query3 = "SELECT electivehours FROM User WHERE Email='$Email'";
    $result3 = $mysqli->query($query3);
    $numrows = $result3->num_rows;
    $scienceelectives_left =18- Dataanalysis($numrows,$result3,'electivehours');
    if($scienceelectivesleft==0)
        $scienceelectivesleft= $scienceelectives_left;
    if($scienceelectivesleft>0) // lavisha changed from scienceelectives_left
    {
        //$course='Continue in the Math Sequence. If you are Done with the Math Sequence Continue with the Physics Sequence';
        $course = 'SciElective';
        $codes[count($codes)] =$avggpascienceelective;
        $credithours =$credithours-3;
        $scienceelectivesleft=$scienceelectivesleft-3; //lavisha changed from $scienceelectivesleft=$scienceelectives_left-3;
        print ("<br>Giving you {$course}.."); 
    }
    else
    {
        $course = 'nothing'; 
        print("<br>Congrats! You seem to have completed all Science elective hours!");  // no $science electives left;
    }
    return $course;
}
function Dataanalysis($numrows,$result,$key)
{
    if($numrows>0)
    {
          if(  $row = $result->fetch_assoc() )
          { 
            return $row[$key]; //  there are multiple records but we need the top one currently
          }
          else
              return 0;
    }
    else
    {
        return 0;
    }
}
function calculateAVGGPA($codes,$n)
{
    $i=0;
    $sum=0;
    while($i<$n)
    {
        $sum = $sum+$codes[$i];
        $i=$i+1;
    }
    return $sum/$n ;
}
function techelectives($prio, $total, $Email, &$credithours, &$schedule,&$codes, &$i)
{
    print("<br> Now we will give you a techelective in your FOS");
    $flag = 0;
    global $mysqli;
    while($credithours>0 && $flag<$total)
    {
        $query = "SELECT Code FROM Course WHERE Field = (SELECT Field_of_study FROM User WHERE Email = '$Email') AND Code NOT IN (SELECT Code from Hastaken WHERE Email='$Email') ORDER BY $prio DESC ";
        $result = $mysqli->query($query);
        $numrows = $result->num_rows;
        $course = Dataanalysis($numrows, $result, 'Code');
        if($course == '0')
        {
            print("<br> We can't find a techelective in your FOS!");
            $query = "SELECT Code FROM Course WHERE Code NOT IN (SELECT Code from Hastaken WHERE Email='$Email') ORDER BY $prio DESC ";
            $result = $mysqli->query($query);
            $numrows = $result->num_rows;
            $course = Dataanalysis($numrows, $result, 'Code');
        }
        while(courseinschedule($course,$schedule)) 
        {
            print("<br> Predicted tech elective course {$course} already scheduled ");
            $course = Dataanalysis($numrows, $result, 'Code');   
        }
        print ("<br>Giving you {$course}.."); 
        $schedule[] = $course;
        $i = $i+1;
        $credithours = $credithours - 3;
        $query4 = "SELECT AVG(GPA) FROM Course GROUP BY Code HAVING Code='$course'";
        $result4 = $mysqli->query($query4);
        $numrows = $result4->num_rows;
        $codes[] = Dataanalysis($numrows, $result4, 'AVG(GPA)'); 
        $flag = $flag + 1;
    }
    return;
}
function extraelectives(&$credithours,&$scienceelectivesleft,&$genedhoursleft,$Email,&$codes,&$schedule,$avggpascienceelective,$avggpagened,&$i)
{  
    while($credithours>0)
    {
        if($scienceelectivesleft > 0) 
        {
            $schedule[] = scienceelectives($Email, $codes, $avggpascienceelective, $credithours, $scienceelectivesleft);
            $i =$i +1;
        }
        else if ($genedhoursleft>0)
        {
            $schedule[] = geneds($Email, $codes, $avggpagened, $credithours, $genedhoursleft);
            $i =$i +1;
        }
    }   
    return;    
}

function get_gpa($course) {
    global $mysqli;
    
    $query = "SELECT GPA
              FROM Course
              WHERE Code = $course";
              
    $result = $mysqli->query($query);
    $row = $result->fetch_assoc();
    return $row["GPA"];
}

// User just needs to finish all their tech electives
// Returns the array of courses for the schedule
function part3(&$credithours, $myusername, $priority, &$genedhoursleft, $avggpagened, &$schedule, &$codes, $gpasciencee, &$i) {
    //$courses = array();
    
    $i = 0;
    $fos = get_fos($myusername);
    $semester = get_semester($myusername);
    $group_project_fulfilled = get_group_project_fulfilled($myusername);
    
    // If the group project isn't fulfilled, pick that
    if ($semester >= 7 and $group_project_fulfilled == 0) {
        //array_push($courses, get_group_project());
        $schedule[$i] = get_group_project();
        $codes[$i] = get_gpa($schedule[$i]);
        $i += 1;
        $group_project_fulfilled = 1;
        $credithours = $credithours - 3;
    }
    
    $electives = get_tech_elective($myusername, $priority, $fos);
    
    $tech_class_count = 0;
    while ($tech_class_count < 6 and $credithours > 0) {
        $row = $electives->fetch_assoc();
        $schedule[$i] = $row["Code"];
        $codes[$i] = get_gpa($schedule[$i]);
        $i += 1;
        //array_push_back($courses, $row["Code"]);
        $credithours = $credithours - 3;
        $tech_class_count++;
        
        // If they are already taking 3 tech electives and
        // and they want a good GPA, give them a gen-ed
        if ($tech_class_count >= 3 and $priority == "GPA") {
            $gened = geneds($myusername, $codes, $avggpagened, $credithours, $genedhoursleft);
            //array_push_back($courses, $gened);
            $schedule[$i] = $gened;
            $i += 1;
        }
            
    }
}

$schedule = [];
$Email = $_GET["Email"];
$codes =[];
$credithours = $_GET["credithours"];
$priority =$_GET["Priority"];
$avggpagened=4.0;
$avggpascienceelective= 3.1;
$finishedallrequiredcourses=0;
$genedhoursleft=0;
$scienceelectivesleft=0;


$i=0;
while($credithours>0) 
{
    print('Starting Analysis:');
    $schedule[$i]= requiredcourses($finishedallrequiredcourses,$credithours,$codes,$Email,$schedule);
    if(!$finishedallrequiredcourses)
    {
        $i=$i+1; //print ("<br>Giving you {$schedule[$i-1]}..");
    }
    else 
    {
        unset($schedule[$i]);
    }
    $schedule[$i]= geneds($Email,$codes,$avggpagened,$credithours,$genedhoursleft);
    if($schedule[$i]=='nothing')
    {
        unset($schedule[$i]);
    }
    else
    {
        $i=$i+1; //print("<br>Giving you {$schedule[$i-1]}..");
    }
    $schedule[$i]= scienceelectives($Email,$codes,$avggpascienceelective,$credithours,$sciencelectiveleft);
    if($schedule[$i]=='nothing')
    {
        unset($schedule[$i]); 
    }
    else
    {
        $i=$i+1;//print("<br>Giving you {$schedule[$i-1]}..");
    }
    $currentavg = calculateAVGGPA($codes,count($codes));
    //print ("<br> Avg GPA of the proposed schedule till now {$currentavg}");
    if(! done225($Email) )
    {
        //Part 1
        $flag1previous=0;
        $flag2previous=0;
        $flag3previous=0;
        $flag1next=0;
        $flag2next=0;
        $flag3next=0;
        do 
        {
            $flag1next=$flag1previous;
            $flag2next=$flag2previous;
            $flag3next=$flag3previous;
            if ($currentavg > 3.6 and $finishedallrequiredcourses != 1)
            {
                $schedule[$i] = requiredcourses($finishedallrequiredcourses, $credithours, $codes, $Email,$schedule); 
                $i = $i + 1;
               //$flag1previous=$flag1next; //lavisha commented this
                $flag1next = 1;
            }
            else if ($currentavg > 3.3 && $currentavg < 3.6 and $scienceelectivesleft > 0)
            {
                $schedule[$i] = scienceelectives($Email, $codes, $avggpascienceelective, $credithours, $scienceelectivesleft);
                //$flag2prvious=$flag2next;
                $flag2next = 1;
                $i =$i +1;
            }
            else if ($genedhoursleft>0)
            {
                $schedule[$i] = geneds($Email, $codes, $avggpagened, $credithours, $genedhoursleft);
                $i =$i +1;
                //$flag3previous=$flag3next; //lavisha commented this
                $flag3next = 1;
            }
            if($credithours<=0)
            {
                break;
            }
            $currentavg = calculateAVGGPA($codes,count($codes));
        }while($flag1next!=$flag1previous || $flag2next!=$flag2previous || $flag3next!=$flag3previous);

        if($credithours<=0)
            break;
    }
    else if (done225($Email) && ($scienceelectivesleft>0 || $genedhoursleft>0) )
    {
        //Part 2
        print("<br> Congrats! You have done CS225 and can take Techelectives!");
        if ($priority =='HighGpa')
        {
            $prio = "GPA";
            $total = 2;
            techelectives($prio, $total, $Email, $credithours, $schedule, $codes, $i);
            extraelectives($credithours,$scienceelectivesleft,$genedhoursleft,$Email,$codes,$schedule,$avggpascienceelective,$avggpagened, $i);
        }
        else // priority = Learning
        {     
            
            $prio = "Usefulness";
            $total = 2;
            techelectives($prio, $total, $Email, $credithours, $schedule, $codes, $i); 
            extraelectives($credithours,$scienceelectivesleft,$genedhoursleft,$Email,$codes,$schedule,$avggpascienceelective,$avggpagened, $i);
        }
    }
    else //done 225 and also done with both scielective and genedelective
    {
        //part 3
        part3($credithours, $Email, $priority, $genedhoursleft, $avggpagened, $schedule, $codes, $avggpascienceelective, $i);
    }

}
$currentavg = calculateAVGGPA($codes,count($codes));
print ("<br> Avg GPA of the proposed schedule till now {$currentavg}");
$i--;
print("<br> <br>We propose the following schedule for you next semester : <br>");
while($i>=0)
{
    print(" {$schedule[$i]} <br>");
    print("\n");
    $i--;
}
$mysqli->close();
?>