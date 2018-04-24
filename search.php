
<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$FOS = $_GET["FOS"];

$query  = "SELECT Email FROM User WHERE Field_of_study = '$FOS'";

$result= $mysqli->query($query);



$num_rows = $result->num_rows;
if ($num_rows > 0)
 {
            print("<p>There are " . $num_rows . " result(s) available</p>");
            while ($row = $result->fetch_assoc())
            {
                print("<p><b> Contact  Email: {$row['Email']} </b>");

               
            }
            $result->free();
        }
        else
        {
            print("There are no Users on our database that are part of the Field of Study '$FOS' <br> </br>  Become the first user ! Insert yourself into our database on the homepage");
        }


$mysqli->close();
?>