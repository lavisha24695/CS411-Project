<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

session_start();
$myusername = $_SESSION['username'];
$email = $_GET["delete_email"];
$semester = $_GET["delete_semester"];
if($email==$myusername)
{
    $query  = "SELECT COUNT(*) AS count FROM Schedules WHERE Email = '$email' AND Semester = '$semester'";
    $result= $mysqli->query($query);
    $num = $result->fetch_assoc()['count'];
    
    if($num != 0)
    {
        
        $result->free();
        $query = "DELETE FROM Schedules WHERE Email =  '$email' AND Semester = '$semester'";
        $result= $mysqli->query($query); 
        $query = "DELETE FROM Hastaken WHERE Email =  '$email' AND Semester = '$semester'";
        $result= $mysqli->query($query);
        echo 'Found and deleted '.$num.' record with email id: '.$email;
    }
    else 
    {
        echo 'Could not find a record with email id: '.$email. ' and semester '.$semester;
    }
}
else
{
    echo "You can only delete a schedule for your username. The email ".$email. " and the username ".$myusername. " do not match!";
}

$mysqli->close();
?>