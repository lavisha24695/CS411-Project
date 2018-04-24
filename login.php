<?php

$mysqli = new mysqli("localhost","foobarcs411_rohan2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

      $myusername = $_POST["username"];
      $mypassword = $_POST["password"];
      $sql = "SELECT Username FROM Login WHERE Username = '$myusername' AND Password = '$mypassword'";
      $result = $mysqli->query($sql);
      $count = $result->fetch_assoc()['count'];
      $num_rows = $result->num_rows;
      
   	  if($num_rows == 1) 
      {
         session_start();
         $_SESSION['username'] = $myusername;
         header( 'Location: index3.html' );
      }
      else 
      {
         echo "Sorry, your username or password is incorrect";
      }
     
$mysqli->close();
?>