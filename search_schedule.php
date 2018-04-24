<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
$semester = $_GET["search_semester"];
$query = " SELECT Schedules.Email, GROUP_CONCAT(Hastaken.Code) as Courses, Schedules.Credits as Credits, Schedules.GPA as GPA
FROM Hastaken, Schedules
WHERE Hastaken.Email = Schedules.Email AND Hastaken.Semester = Schedules.Semester AND Schedules.Semester = '$semester'
GROUP BY Hastaken.Email";
$result= $mysqli->query($query);

//$query  = "SELECT * FROM Schedule WHERE Semester = '$semester'";
//$result= $mysqli->query($query);

$num_rows = $result->num_rows;
if ($num_rows > 0)
 {
            print("<p>There are " . $num_rows. " schedule result(s) available for semester: ".$semester." </p>");
            while ($row = $result->fetch_assoc())
            {
                 print("<p><b> Schedule: {$row['Courses']} , Credits: {$row['Credits']}, GPA obtained: {$row['GPA']}  </b>");
            }
            $result->free();
}
else
{
            print("There are no schedules in our database for this semester.");
}
$mysqli->close();
?>