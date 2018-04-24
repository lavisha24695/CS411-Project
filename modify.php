<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

session_start();
$myusername = $_SESSION['username'];

$modify_email = $_GET["modify_email"];
$modify_priority= $_GET["modify_priority"];
$modify_sem = $_GET["modify_sem"];
$modify_FOS = $_GET["modify_FOS"];
$modify_credits = $_GET["modify_credits"];

if($modify_email==$myusername)
{
    $query  = "SELECT COUNT(*) AS count FROM User WHERE Email = '$modify_email'";
    $result= $mysqli->query($query);
    $num = $result->fetch_assoc()['count'];
    if($num != 0)
    {
        $result->free();
        $query = "UPDATE User 
              SET Priority = '$modify_priority'
              WHERE Email = '$modify_email'";
        $result= $mysqli->query($query);
        $query = "UPDATE User 
              SET Current_Semester = '$modify_sem'
              WHERE Email = '$modify_email'";
        $result= $mysqli->query($query);
        $query = "UPDATE User 
              SET Field_of_study = '$modify_FOS'
              WHERE Email = '$modify_email'";
        $result= $mysqli->query($query);
        $query = "UPDATE User 
              SET Credits = '$modify_credits'
              WHERE Email = '$modify_email'";
        $result= $mysqli->query($query);
        echo 'Found and modified '.$num.' record with email id: '.$modify_email;
    }
    else 
    {echo 'Could not find a record with email id: '.$modify_email;}
}
else
{
    echo "You can only modify data for your username. The email ".$modify_email. " and the username ".$myusername. " do not match!";
}

$mysqli->close();
?>