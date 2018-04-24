<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");

if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
session_start();
$myusername = $_SESSION['username'];

$coursestaken = $_GET["coursestaken"];
$numberofcourses =$_GET["numberofcourses"];
$courses = explode(" ",$coursestaken);
$email = $_GET["Email"];
if($email==$myusername)
{
    while ( $numberofcourses >=0){
        $query2="INSERT INTO HasTaken VALUES('$email','$courses[$numberofcourses]')";
        $result2= $mysqli->query($query2);
        $numberofcourses =$numberofcourses -1;
    }
    echo "Added ".$_GET["numberofcourses"]." courses for the user: ".$email;
}
else
{
    echo "You can only add data for your username. The email ".$email. " and the username ".$myusername. " do not match!";
}
?>

