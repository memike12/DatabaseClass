<?php
        include 'mysql.config.php';

        $query = "SELECT midn.alpha, concat(midn.first, ' ',
        midn.last) AS Name, grades.Course, grades.CourseGrade From
        midn LEFT JOIN grades USING(alpha) WHERE alpha=?";


        $alpha = $_GET['alpha'];


        $stmt = $db->stmt_init();
        $stmt->prepare($query);
        $stmt->bind_param('s', $alpha);
        $stmt->execute();

                 
        $stmt->bind_result($alpha, $Name, $Course, $grade);
        while($stmt->fetch()) {
           echo "$alpha $Name $Course $grade <br>";
           }
        $stmt->close();
?>
