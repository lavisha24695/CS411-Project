
// Just gets the email from the login page
session_start();
$myusername = $_SESSION['username'];

// Get's a tech elective based on priority
// If their priority is learning, it picks one from their field of study
function get_tech_elective($myusername, $priority, $fos) {
    global $mysqli;
    
    $query = "";
    if ($priority == "GPA") {
        $query = "SELECT Code \
                  FROM Course \
                  WHERE Code NOT IN ( \
                    SELECT Code \
                    FROM Hastaken \
                    WHERE Email = '$myusername') \
                  ORDER BY GPA DESC, Difficulty ASC \
                  LIMIT 6";
    } elseif ($priority == "Learning") {
        $query = "SELECT Code \
                  FROM Course \
                  WHERE Code NOT IN ( \
                    SELECT Code \
                    FROM Hastaken \
                    WHERE Email = '$myusername') AND \
                  Field = '$fos' \
                  ORDER BY Usefulness DESC \
                  LIMIT 6";
    }
    $result = $mysqli->query($query);
    
    return $result
}

// Get's the user's field of study
function get_fos($myusername) {
    global $mysqli;
    
    $query = "SELECT Field_of_study \
              FROM User \
              WHERE Email = '$myusername'";
    $result = $mysqli->query($query);
    $row = mysqli_fetch_assoc($result);
    $fos = $row["Field_of_study"];
    return $fos;
}

// Get the user's semester
function get_semester($myusername) {
    global $mysqli;
    
    $query = "SELECT Current_Semester \
              FROM User \
              WHERE Email = '$musername'";
    $result = $mysqli->query($query);
    $row = mysqli_fetch_assoc($result);
    $semester = $row["Current_Semester"];
    return $semester;
}

// Assumes in Course, the Field = "G" if the class
// fulfills the group project requirement
// Returns 1 for true if fulfilled
// Returns 0 for false if not
function get_group_project_fulfilled($my_username) {
    global $mysqli;
    
    $query = "SELECT Code \
              FROM Hastaken \
              WHERE Email = '$myusername' AND \
              Code IN ( \
                SELECT Code \
                From Course \
                WHERE Field = 'Group')";
    $result = $mysqli->query($query);
    
    if ($result->num_rows > 0) {
        return 1;
    } else {
        return 0;
    }
}

// Get the group project course based on their priority
function get_group_project($myusername, $priority) {
    global $mysqli;
    
    $query = "";
    if ($priority == "GPA") {
        $query = "SELECT Code \
                  FROM Course \
                  WHERE Field = 'Group' AND \
                  Code NOT IN ( \
                    SELECT Code \
                    FROM Hastaken \
                    WHERE Email = '$myusername') \
                  ORDER BY GPA DESC, Difficulty ASC \
                  LIMIT 1";
    } elseif ($priority == "Learning") {
        $query = "SELECT Code \
                  FROM Course \
                  WHERE Field = 'Group' AND \
                  WHERE Code NOT IN ( \
                    SELECT Code \
                    FROM Hastaken \
                    WHERE Email = '$myusername') \
                  ORDER BY Usefulness DESC \
                  LIMIT 1";
    }
    $result = $mysqli->query($query);
    
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $course = $row["Code"];
        
    } else {
        $course = "nothing";
    }
    
    return $course;
}

// User just needs to finish all their tech electives
// Returns the array of courses for the schedule
function part3($credithours, $myusername, $priority) {
    $courses = array();
    
    $fos = get_fos($myusername);
    $semester = get_semester($myusername);
    $group_project_fulfilled = get_group_project_fulfilled();
    
    // If the group project isn't fulfilled, pick that
    if ($semester >= 7 and $group_project_fulfilled == 0) {
        array_push($courses, get_group_project());
        $group_project_fulfilled = 1;
        $credithours = $credithours - 3;
    }
    
    $electives = get_tech_elective($credithours, $myusername, $priority, $fos);
    
    $tech_class_count = 0;
    while ($row = $electives->fetch_assoc() and $credithours > 0) {
        array_push_back($courses, $row["Code"]);
        $credithours = $credithours - 3;
        $tech_class_count++;
        
        // If they are already taking 3 tech electives and
        // and they want a good GPA, give them a gen-ed
        if ($tech_class_count >= 3 and $priority == "GPA") {
            array_push($courses, geneds($myusername, $codes, $avggpagened, &$credithours, &genedhoursleft));
        }
            
    }
    
    return $courses;
}







