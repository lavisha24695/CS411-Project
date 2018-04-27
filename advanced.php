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
function noofcredits($schedule)
{
    global $mysqli;
    $i=0;
    $ans = 0;
    while($i<count($schedule))
    {
        $query= "SELECT Code FROM Course WHERE Required='r' AND Code = '$schedule[$i]'"; 
        $result = $mysqli->query($query);
        $numrows = $result->num_rows;
        if ($numrows > 0)
        {
            $ans = $ans+4;
        }
        else
        {
            $ans = $ans+3;
        }
        $i = $i + 1;
    }
    return $ans;
}
function addtoproposed($proposed, $schedule)
{
    $i=0;
    $ans = 0;
    while($i<count($schedule))
    {
        $proposed[] = $schedule[$i];
        $i = $i + 1;
    }
    return $proposed;
}

// Get's the user's field of study
function get_fos($myusername) 
{
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
function get_semester($myusername) 
{
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

function done225($Email, $schedule, $proposed)
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
    $i=0;
    while($i<count($schedule))
    {
        if($schedule[$i]==225)
        {
            return 1;
        }
        $i++;
    }
    $i=0;
    while($i<count($proposed))
    {
        if($proposed[$i]==225)
        {
            return 1;
        }
        $i++;
    }
    return 0;
}

function calculateAVGGPA($codes,$n)
{
    if($n==0) return 0;
    $i=0;
    $sum=0;
    while($i<$n)
    {
        $sum = $sum+$codes[$i];
        $i=$i+1;
    }
    return $sum/$n ;
}
function altpr($pr)
{
     if($pr =="HighGpa") $pr = "Learning";
        else $pr = "HighGpa";
    return $pr;
}
function requiredcourses(&$finishedallrequiredcourses,&$credithours,&$codes,$Email,$schedule,$proposed) //lavisha version
{
    global $mysqli;
    $query= "SELECT DISTINCT Code FROM Course WHERE Required='r' AND Code NOT IN (SELECT Code from Hastaken WHERE Email='$Email') ORDER BY Code ASC"; 
    $result = $mysqli->query($query);
    $numrows = $result->num_rows;
    $course = Dataanalysis($numrows, $result, 'Code');
    while(courseinschedule($course,$schedule,$proposed)) 
    {
   //     print("<br> Predicted req course {$course} already scheduled ");
        $course = Dataanalysis($numrows, $result, 'Code');   
    }
    if ($course != 0  )
    {
        $credithours = $credithours - 3;
        $query4 = "SELECT AVG(GPA) FROM Course GROUP BY Code HAVING Code='$course'";
        $result4 = $mysqli->query($query4);
        $numrows = $result4->num_rows;
        $codes[count($codes)] = Dataanalysis($numrows, $result4, 'AVG(GPA)'); 
    //    print ("<br>Giving you {$course}..");  
    }
    else 
    {
        $finishedallrequiredcourses = 1; 
        print('<br>Congrats! You seem to have completed all required courses!');//yes all required courses have been finished. no required courses left  possibly have to query the tech electives table ?
    }
    return $course;
}
function geneds($Email,&$codes,&$credithours,&$genedhoursleft)
{
    global $mysqli;
    $avggpagened=4.0;
    $query2= "SELECT genedhours FROM User WHERE Email='$Email'";
    $result2 =$mysqli->query($query2);
    $numrows = $result2->num_rows;

    $genedhours_left = 18-Dataanalysis($numrows,$result2,'genedhours');
    if($genedhoursleft==-1) // if its the first time coming to this fn geneds
        $genedhoursleft=$genedhours_left;

    if($genedhoursleft>0) // lavisha changed from genedhours_left
    {
        $course= 'GenEd';
        $codes[count($codes)] =$avggpagened; // lavisha- index of codes
        $credithours =$credithours-3;
        $genedhoursleft=$genedhoursleft-3; 
        if($genedhoursleft<0) $genedhoursleft=0;
        print ("<br>Giving you {$course}.."); 
    }
    else
    {
        $course ='nothing'; 
      //  print('<br>Congrats! You seem to have completed all Gened hours!');// no genedhours left;
    }
    return $course;
}

function science($Email,&$codes,&$credithours,&$sel)
{
    global $mysqli;
    $avggpascienceelective= 3.1;
    $query3 = "SELECT electivehours FROM User WHERE Email='$Email'";
    $result3 = $mysqli->query($query3);
    $numrows = $result3->num_rows;
     $scienceelectives_left =24-Dataanalysis($numrows,$result3,'electivehours');
    if($sel==-1)
        {$sel= $scienceelectives_left;
        //print("<br> ONE TIME");
            
        }
        
    if($sel>0) // lavisha changed from scienceelectives_left
    {
        $course = 'SciElective';
        $codes[count($codes)] =$avggpascienceelective;
        $credithours =$credithours-3;
        $sel=$sel-3;
      //  if($sel<0) $sel=0;
        print ("<br>Giving you {$course}.."); 
    }
    else
    {
        $course = 'nothing'; 
      //  print("<br>Congrats! You seem to have completed all Science elective hours!");  // no $science electives left;
    }
    return $course;
}

function techelectives($prio, $total, $Email, &$credithours, &$schedule,&$codes, &$i, $proposed)
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
        while(courseinschedule($course,$schedule, $proposed)) 
        {
          //  print("<br> Predicted tech elective course {$course} already scheduled ");
            $course = Dataanalysis($numrows, $result, 'Code');   
        }
      //  print ("<br>Giving you {$course}.."); 
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
function extraelectives(&$credithours,&$scienceelectivesleft,&$genedhoursleft,$Email,&$codes,&$schedule,&$i)
{  
    while($credithours>0)
    {
        if($scienceelectivesleft > 0) 
        {
            $schedule[] = science($Email, $codes, $credithours, $scienceelectivesleft);
            $i =$i +1;
        }
        else if ($genedhoursleft>0)
        {
            $schedule[] = geneds($Email, $codes, $credithours, $genedhoursleft);
            $i =$i +1;
        }
    }   
    return;    
}
function get_group_project_fulfilled($myusername) 
{
    global $mysqli;
    $query = "SELECT Code 
              FROM Hastaken 
              WHERE Email = '$myusername' AND 
              Code IN ( 
                SELECT Code 
                From Course 
                WHERE Field = 'Group')";
    $result = $mysqli->query($query);
    if ($result->num_rows > 0) 
    {
        return 1;
    } 
    else 
    {
        return 0;
    }
}

// Get the group project course based on their priority
function get_group_project($myusername, $priority) 
{
    global $mysqli;
    $query = "";
    if ($priority == "HighGPA") 
    {
        $query = "SELECT Code 
                  FROM Course 
                  WHERE Field = 'Group' AND 
                  Code NOT IN ( 
                    SELECT Code 
                    FROM Hastaken 
                    WHERE Email = '$myusername') 
                  ORDER BY GPA DESC, Difficulty ASC 
                  LIMIT 1";
    } 
    else 
    { // Learning
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
    if (mysqli_num_rows($result) > 0) 
    {
        $row = $result->fetch_assoc();
        $course = $row["Code"];
    } 
    else 
    {
        $course = "nothing";
    }
    return $course;
}
function get_gpa($course) 
{
    global $mysqli;
    $query = "SELECT GPA
              FROM Course
              WHERE Code = $course";
    $result = $mysqli->query($query);
    $row = $result->fetch_assoc();
    return $row["GPA"];
}
function courseinschedule($course,$schedule,$proposed)
{
    if(!$course) return 0;
    $i=0;
    while($i<count($schedule))
    {
        if($schedule[$i]==$course)
        {
           return 1;
        }
        $i++;
    }
    $i=0;
    while($i<count($proposed))
    {
        if($proposed[$i]==$course)
        {
            return 1;
        }
        $i++;
    }
    return 0; 
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
function get_tech_elective($myusername, $priority, $fos, $schedule, $proposed) 
{
    global $mysqli;
    if ($priority == "HighGPA") 
    {
        $query= "SELECT DISTINCT Code FROM Course WHERE Code NOT IN (SELECT Code from Hastaken WHERE Email='$myusername') AND Required='TE' ORDER BY GPA DESC, Difficulty ASC "; 
    }
    else
    {
        $query= "SELECT DISTINCT Code FROM Course WHERE Code NOT IN (SELECT Code from Hastaken WHERE Email='$myusername') AND Required='TE' AND Field = '$fos' ORDER BY Usefulness DESC  "; 
    }
    $result = $mysqli->query($query);
    $numrows = $result->num_rows;
    $course = Dataanalysis($numrows, $result, 'Code');
    while(courseinschedule($course,$schedule,$proposed)) 
    {
        $course = Dataanalysis($numrows, $result, 'Code');   
    }
    if(!$course)
    {
        $query= "SELECT DISTINCT Code FROM Course WHERE Code NOT IN (SELECT Code from Hastaken WHERE Email='$myusername') AND Required='TE' ORDER BY Usefulness DESC  "; 
        $result = $mysqli->query($query);
        $numrows = $result->num_rows;
        $course = Dataanalysis($numrows, $result, 'Code');
        while(courseinschedule($course,$schedule,$proposed)) 
        {
            $course = Dataanalysis($numrows, $result, 'Code');   
        }
        
        
        
    }
    return $course;
    
}

function part3(&$credithours, $myusername, $priority, &$genedhoursleft, &$schedule, &$codes, &$i, $proposed,&$finishedallrequiredcourses) 
{
   // $i = 0;
    $fos = get_fos($myusername);
    $semester = get_semester($myusername);
    $tech_class_count = 0;
    $temp=0;
    while ( $credithours > 0) 
    {
        $electives = get_tech_elective($myusername, $priority, $fos, $schedule, $proposed);
        $schedule[$i] = $electives;
        $i=$i+1;
        ++$temp;
       // $schedule[] = $course;
       // print ("<br>Part 3Giving you {$electives}..");  
        $codes[count($codes)] = get_gpa($electives);
        
        $credithours = $credithours - 3;
        $tech_class_count++;
        if($credithours>0 && $finishedallrequiredcourses==0)
        {
                $schedule[$i]= requiredcourses($finishedallrequiredcourses,$credithours,$codes,$myusername,$schedule,$proposed);
                if(!$finishedallrequiredcourses)
        {
            $i=$i+1; //print ("<br>Giving you {$schedule[$i-1]}..");
            ++$temp;
        }
        else 
        {
            unset($schedule[$i]);
        }
              //  $i=$i+1;
        }
    }
    
}
function gpalearning($Email,$credithours,$priority,$proposed,&$genedhoursleft,
    &$sel)
{
    $schedule = [];
    $codes =[];
    $finishedallrequiredcourses=0;
    $i=0;
    
    print('STARTING ANALYSIS..');
    while($credithours>0) 
    {
        
        $schedule[$i]= requiredcourses($finishedallrequiredcourses,$credithours,$codes,$Email,$schedule,$proposed);
        if(!$finishedallrequiredcourses)
        {
            $i=$i+1; //print ("<br>Giving you {$schedule[$i-1]}..");
        }
        else 
        {
            unset($schedule[$i]);
        }
        
        if($credithours<=0)
                {
                    break;
                }
        
        $schedule[$i]= geneds($Email,$codes,$credithours,$genedhoursleft);
        if($schedule[$i]=='nothing')
        {
            unset($schedule[$i]);
        }
        else
        {
            $i=$i+1; //print("<br>Giving you {$schedule[$i-1]}..");
        }
        
        if($credithours<=0)
                {
                    break;
                }
        
        $schedule[$i]= science($Email,$codes,$credithours,$sel);
      //  print("<br> INITIA");
        if($schedule[$i]=='nothing')
        {
            unset($schedule[$i]); 
        }
        else
        {
            $i=$i+1;//print("<br>Giving you {$schedule[$i-1]}..");
        }
        $currentavg = calculateAVGGPA($codes,count($codes));
        if(! done225($Email, $schedule, $proposed) )
        {
           /// print("<br> NOTDONE 225");
            //Part 1
          /*  $flag1previous=0;
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
                if ($currentavg > 3.3 && $finishedallrequiredcourses != 1)
                {
                    $schedule[$i] = requiredcourses($finishedallrequiredcourses, $credithours, $codes, $Email,$schedule,$proposed); 
                    $i = $i + 1;
                    $flag1next = 1;
                }
                else if ($currentavg > 3.0 && $currentavg < 3.3 && $sel > 0)
                {
                    print("<br>MIDLOOP");
                    $schedule[$i] = science($Email, $codes, $credithours, $sel);
                    $flag2next = 1;
                    $i =$i +1;
                    
                }
                else if ($genedhoursleft>0)
                {
                    $schedule[$i] = geneds($Email, $codes, $credithours, $genedhoursleft);
                    $i =$i +1;
                    $flag3next = 1;
                }
                if($credithours<=0)
                {
                    break;
                }
                $currentavg = calculateAVGGPA($codes,count($codes));
            }while($flag1next!=$flag1previous || $flag2next!=$flag2previous || $flag3next!=$flag3previous);
    */
            if($credithours<=0)
                break;
        }
        else if (done225($Email, $schedule, $proposed) && ($sel>0 || $genedhoursleft>0) )
        {
            //Part 2
            print("<br> Congrats! You have done CS225 and can take Techelectives!");
            if ($priority =='HighGpa')
            {
                $prio = "GPA";
            }
            else // priority = Learning
            {     
                $prio = "Usefulness";
            }
            $total = 2;
            techelectives($prio, $total, $Email, $credithours, $schedule, $codes, $i, $proposed);
            extraelectives($credithours,$sel,$genedhoursleft,$Email,$codes,$schedule, $i);
        }
        else //done 225 and also done with both scielective and genedelective
        {
            //part 3
            part3($credithours, $Email, $priority, $genedhoursleft, $schedule, $codes, $i, $proposed,$finishedallrequiredcourses);

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
    return $schedule;
}

       

function graduation($Email,$credithours,$priority)
{
    global $mysqli;
    
    $query = " SELECT * FROM User WHERE Email = '$Email' ";
    $result= $mysqli->query($query);
    $num_rows = $result->num_rows;
    if ($num_rows > 0)
     {
                print("<p>We have the following user information for you. </p>");
                while ($row = $result->fetch_assoc())
                {
                    print"<p><b> User: {$row['Email']}</b>, Current Semester: {$row['Current_Semester']}, Credits: {$row['Credits']}, Field of study: {$row['Field_of_study']}, Priority: {$row['Priority']}, Gened Hours: {$row['genedhours']}, Science elective Hours: {$row['electivehours']}";
                }
                $result->free();
                $flag = 1;
    }
    else
    {print("We don't have your user information.");}
    
    print("<br><br>We propose you to take the following courses in the upcoming semesters in order to graduate as quickly as possible!");
    
    $query3 = "SELECT Credits FROM User WHERE Email='$Email'";
    $result3 = $mysqli->query($query3);
    $numrows = $result3->num_rows;
    $creditsdone = Dataanalysis($numrows,$result3,'Credits');
    
    $query3 = "SELECT Current_Semester FROM User WHERE Email='$Email'";
    $result3 = $mysqli->query($query3);
    $numrows = $result3->num_rows;
    $semester = Dataanalysis($numrows,$result3,'Current_Semester');
    
    $genedhoursleft=-1;
    $sel=-1;
    
    $proposed = [];
    $pr = "Learning";
    for ($x = $semester+1; $x <= 8; $x++) 
    {
        if($x==7) $credithours = 14;
        print("<br><br><br> <b>SEMESTER {$x}</b><br>");
        $pr = altpr($pr);
        $schedule = gpalearning($Email,$credithours,$pr,$proposed,$genedhoursleft,$sel);
        $n = count($schedule);
        $credinsem = noofcredits($schedule);
        $creditsdone = $creditsdone + $credinsem;
        echo "For semester ".$x. " we proposed you a schedule of ".$n. " courses and ".$credinsem. " credits and now you are done with ".$creditsdone. " total credit hours. You are left with ".$genedhoursleft." gened hours and ".$sel. " science elective hours.";
        $proposed = addtoproposed($proposed, $schedule);
       
        if($creditsdone>=128) break;
    }
    print("<br><br><b>Congrats you can graduate after this !!</b>");
}
session_start();
$myusername = $_SESSION['username'];
$Email = $myusername;
$credithours = $_GET["credithours"];
$priority =$_GET["Priority"];
//print("<h4> SCHEDULE PREDICTOR </h4>");
echo '<span style="color: DodgerBlue ; font-size: 30px;">   SCHEDULE PREDICTOR <br> </span>'; 
if ($priority =='HighGpa' || $priority =='Learning')
{
    $proposed = [];
    $genedhoursleft=-1;
    $sel=-1;
    print("<br>");
    gpalearning($Email,$credithours,$priority,$proposed,$genedhoursleft,$sel);
    
}
else
{
    $credithours = 15;
    graduation($Email,$credithours,$priority);
}

$mysqli->close();
  /*  $group_project_fulfilled = get_group_project_fulfilled($myusername);
    // If the group project isn't fulfilled, pick that
    if ($semester >= 4 and $group_project_fulfilled == 0) 
    {
        //array_push($courses, get_group_project());
        $schedule[$i] = get_group_project($myusername, $priority);
        print("<br> LAVISHA assigned group project {$schedule[$i]}");
        $codes[$i] = get_gpa($schedule[$i]);
        $i += 1;
        $group_project_fulfilled = 1;
        $credithours = $credithours - 3;
    }
    */
?>
