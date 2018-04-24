<?php

$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
      $myusername = $_POST["username"];
      $mypassword1 = $_POST["password1"];
      $mypassword2 = $_POST["password2"];
      
      $sql = "SELECT Username FROM Login WHERE Username = '$myusername'";
      $result = $mysqli->query($sql);
      $count = $result->fetch_assoc()['count'];
      $num_rows = $result->num_rows;

      if($num_rows == 1) 
      {
        echo "Sorry, username ". $myusername." already exists! Please refresh and enter another username.";
      }
      else
      {
        if($mypassword1 == $mypassword2)
        {
           $sql = "INSERT INTO Login VALUES ('$myusername', '$mypassword1')";
           $result = $mysqli->query($sql);
           echo "Created new user account with id: ".$myusername." .Please refresh and login with the new account details.";
        }
        else
        {
          echo "The passwords do not match! Please refresh and enter the details again.";
        }
      }
      
$mysqli->close();
?>