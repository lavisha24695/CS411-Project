<?php

$mysqli = new mysqli("localhost","foobarcs411_rohan2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

session_start();
$myusername = $_SESSION['username'];

//$coursestaken = $_GET["coursestaken"];
//$numberofcourses =$_GET["numberofcourses"];
$courses = explode(" ",$coursestaken);
echo ($courses[0]-23);
$email = $_GET["email"];
$currentsem = $_GET["currentsem"];
$credits = $_GET["Credits"];
$FOS = $_GET["FOS"];
$Priority= $_GET["Priority"];
$genedhours=$_GET["genedhours"];
$electivehours=$_GET["electivehours"];

$query = "INSERT INTO User VALUES ('$email', $currentsem, $credits, '$FOS', '$Priority','$genedhours','$electivehours')";
    $result= $mysqli->query($query);
   /* while ( $numberofcourses >=0)
    {
        $query2="INSERT INTO HasTaken VALUES('$email','$courses[$numberofcourses]')";
        $result2= $mysqli->query($query2);
        $numberofcourses =$numberofcourses -1;
    }
    echo "Added a User record and ".$_GET["numberofcourses"]. " courses for the user: ". $email. ".";*/
    echo "Added a User record for the user: ". $email. ".";




$mysqli->close();

?>
