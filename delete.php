
<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

session_start();
$myusername = $_SESSION['username'];
//$email = $_GET["Email"];
$email = $myusername;
if($email==$myusername)
{

    $query  = "SELECT COUNT(*) AS count FROM User WHERE Email = '$email'";
    $result= $mysqli->query($query);
    $num = $result->fetch_assoc()['count'];
    
    if($num != 0)
    {
        echo 'Found and deleted '.$num.' record with email id: '.$email;
        $result->free();
        $query = "DELETE FROM User WHERE Email =  '$email'";
        $result= $mysqli->query($query);
    }
    else 
    {echo 'Could not find a record with email id: '.$email;}
}
else
{
    echo "You can not delete any other user's account! The email ".$email. " and the username ".$myusername. " do not match!";
}

$mysqli->close();
?>