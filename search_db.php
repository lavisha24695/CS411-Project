<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$word = $_GET["search_word"];

$query = " SELECT * FROM Course WHERE Professor = '$word' OR Code='$word' OR Name = '$word' OR Field = '$word' OR Prerequisite = '$word'  ";
$result= $mysqli->query($query);
$num_rows = $result->num_rows;
$flag = 0;
if ($num_rows > 0)
 {
            print("<p>There are " . $num_rows . " course result(s) available</p>");
            while ($row = $result->fetch_assoc())
            {
                print"<p><b> Course: {$row['Code']}</b>, Name: {$row['Name']}, Professor: {$row['Professor']}, Semester: {$row['Semester']}, Field: {$row['Field']}, GPA: {$row['GPA']}, Workload: {$row['Workload']}, Difficulty: {$row['Difficulty']}, Usefulness: {$row['Usefulness']}, Prerequisites: {$row['Prerequisite']}";
            }
            $result->free();
            $flag = 1;
}
printf("\n\n");
$query = " SELECT * FROM User WHERE Field_of_study ='$word' ";
$result= $mysqli->query($query);
$num_rows = $result->num_rows;
if ($num_rows > 0)
 {
            print("<p>There are ".$num_rows." user result(s) available</p>");
            while ($row = $result->fetch_assoc())
            {
                print"<p><b> User: {$row['Email']}</b>, Semester: {$row['Current_Semester']}, Field of study: {$row['Field_of_study']}";
            }
            $result->free();
            $flag =1;
}


$query = " SELECT * FROM Hastaken WHERE Code ='$word' ";
$result= $mysqli->query($query);
$num_rows = $result->num_rows;
if ($num_rows > 0)
 {
            print("<p>There are ".$num_rows." taken courses result(s) available</p>");
            while ($row = $result->fetch_assoc())
            {
                print"<p><b> User: {$row['Email']}</b>, Course: {$row['Code']}, Semester: {$row['Semester']}";
            }
            $result->free();
            $flag =1;
}
if(!$flag)
{print("There are no user records in the database for the keyword: ".$word);
}

$mysqli->close();
?>