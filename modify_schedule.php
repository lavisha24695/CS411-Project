<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

session_start();
$myusername = $_SESSION['username'];

$email = $_GET["modify_email"];
$courses = $_GET["modify_courses"];
$GPA = $_GET["modify_GPA"];
$semester = $_GET["modify_semester"];
$credit = $_GET["modify_credit"];

if($email==$myusername)
{
    $query  = "SELECT COUNT(*) AS count FROM Schedule WHERE Email = '$email' AND Semester = '$semester'";
    $result= $mysqli->query($query);
    $num = $result->fetch_assoc()['count'];
    if($num != 0)
    {
        $result->free();
        $query = "UPDATE Schedule
              SET GPA = '$GPA'
              WHERE Email = '$email' AND Semester = '$semester'";
        $result= $mysqli->query($query);
        $query = "UPDATE Schedule
              SET Courses = '$courses'
              WHERE Email = '$email' AND Semester = '$semester'";
        $result= $mysqli->query($query);
        $query = "UPDATE Schedule 
              SET Credit_Hours = '$credit'
              WHERE Email = '$email' AND Semester = '$semester'";
        $result= $mysqli->query($query);
        echo 'Found and modified '.$num.' record with email id: '.$email;
    }
    else 
    {
        echo 'Could not find a record with email id: '.$email. ' and semester '.$semester;
    }
}
else
{
    echo "You can only modify schedule data for your username. The email ".$email. " and the username ".$myusername. " do not match!";
}
?>