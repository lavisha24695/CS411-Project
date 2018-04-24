<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");

if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
session_start();
$myusername = $_SESSION['username'];

   /* $query = "SELECT Code, GROUP_CONCAT(Code)
              FROM HasTaken
              WHERE Email = '$myusername'
              ORDER BY Code
              GROUP BY Email";
    $result = $mysqli->query($query);
    $query2 = "UPDATE User
               SET ScheduleKey = '$result'
               WHERE Email = '$myusername'";
    $result2 = $mysqli->query($query2);
    $query3 = "SELECT Courses
               FROM User, Schedule
               WHERE User.Email = Schedule.Email AND 
                    User.ScheduleKey LIKE CONCAT('%', '$result', '%') AND
                    User.Semester = 
                        (SELECT Semester
                         FROM User
                         WHERE User.Email = '$myusername')";
    $result3 = $mysqli->query($query3); */
    
    $query = "UPDATE User
               SET ScheduleKey = (
                    SELECT GROUP_CONCAT(Code)
                    FROM Hastaken
                    WHERE Email = '$myusername'
                    ORDER BY Code
               )
               WHERE Email = '$myusername'";
    $result = $mysqli->query($query);
               
    $query2 = "SELECT Courses
               FROM User, Schedule
               WHERE User.Email = Schedule.Email AND 
                    User.ScheduleKey LIKE CONCAT('%', (
                        SELECT GROUP_CONCAT(Code)
                        FROM HasTaken
                        WHERE Email = '$myusername'
                        ORDER BY Code
                        ), '%') AND
                    User.Current_Semester = 
                        (SELECT Semester
                         FROM User
                         WHERE User.Email = '$myusername')";
    $result2 = $mysqli->query($query2);
    
    echo "<table>";
    echo "<tr>";
    echo "<th>Courses</th>";
    echo "</tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        $courses = $row["Courses"];
        echo "<td>$courses</td>";
        echo "</tr>";
    }
    echo "<table/>";

?>
