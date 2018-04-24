<?php
$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

session_start();
$myusername = $_SESSION['username'];

$email = $_GET['email'];
echo $email;
$coursestaken = $_GET["add_courses"];
$courses = explode(" ",$coursestaken);
$GPA = $_GET["add_GPA"];
$semester = $_GET["add_semester"];
$credit = $_GET["add_credit"];
$numberofcourses =$_GET["numberofcourses"];
$genedhours=$_GET["genedhours"];

$electivehours=$_GET["electivehours"];
$credit=$credit+$genedhours+$electivehours;
echo $genedhours;
echo $electivehours;
echo $credit;

$query3="UPDATE User SET genedhours=genedhours+'$genedhours', electivehours=electivehours+'$electivehours' WHERE User.Email='$email'";
$result3=$mysqli->query($query3);

 $query2 = "INSERT INTO Schedules VALUES ('$email', $semester,$credit,$GPA)";
    $result2 = $mysqli->query($query2);
    while ( $numberofcourses >=0)
    {
        $query2="INSERT INTO Hastaken VALUES('$email','$courses[$numberofcourses]', $semester)";
        $result2= $mysqli->query($query2);
        $numberofcourses =$numberofcourses -1;
    }
    echo "Added a schedule for semester ".$semester. " for the user: ".$email;

$mysqli->close();

?>