<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

session_start();
$myusername = $_SESSION['username'];

$name = $_GET["course_name"];
$usefulness = $_GET["course_usefulness"];
$difficulty = $_GET["course_difficulty"];
$workload = $_GET["course_difficulty"];

/*$query = "UPDATE Course
          SET
          Usefulness = ('$usefulness' + 
            ((SELECT c2.Usefulness
             FROM Course c2
             WHERE c2.Code = '$name') 
            * 
            (SELECT c3.Opinion_Count
             FROM Course c3
             WHERE c3.Code = '$name')))
            / 
            ((SELECT c4.Opinion_Count
             FROM Course c4
             WHERE c4.Code = '$name')
            + 1)
          WHERE Code = '$name'";
$result = $mysqli->query($query);
echo $result;

 $query2 = "UPDATE Course
            SET
            Course.Difficulty = ($difficulty + 
            ((SELECT c2.Difficulty
             FROM Course c2
             WHERE c2.Code = $name) 
            * 
            (SELECT c3.Opinion_Count
             FROM Course c3
             WHERE c3.Code = $name)))
            / 
            ((SELECT c4.Opinion_Count
             FROM Course c4
             WHERE c4.Code = $name)
            + 1)
            WHERE Code = $name";
$result2 = $mysqli->query($query);
echo $result2;

$query3 = "UPDATE Course
          SET
          Course.Workload = ($workload + 
            ((SELECT c2.Workload
             FROM Course c2
             WHERE c2.Code = $name) 
            * 
            (SELECT c3.Opinion_Count
             FROM Course c3
             WHERE c3.Code = $name)))
            / 
            ((SELECT c4.Opinion_Count
             FROM Course c4
             WHERE c4.Code = $name)
            + 1)
          WHERE Code = $name";
$result3 = $mysqli->query($query);
echo $result3;

$query4 = "UPDATE Course
           SET Opinion_Count = 
             ((SELECT Opinion_Count
              FROM Course c2
              WHERE c2.Code = '$name')
              + 1)
           WHERE Code = '$name'";
$result4 = $mysqli->query($query4);
echo $result2;
*/

$query = "UPDATE Course
          SET Usefulness = ('$usefulness' + (Opinion_Count * Usefulness)) / (Opinion_Count + 1),
              Difficulty = ('$difficulty' + (Opinion_Count * Difficulty)) /
              (Opinion_Count + 1),
              Workload = ('$workload' + (Opinion_Count * Workload)) /
              (Opinion_Count + 1)
          WHERE Code = '$name'";
$result = $mysqli->query($query);

$query5 = "UPDATE Course
           SET Opinion_Count = Opinion_Count + 1
           WHERE Code = '$name'";
$result5 = $mysqli->query($query5);
echo $result5;
$mysqli->close();

?>