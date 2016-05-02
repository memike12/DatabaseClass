<?php
        include 'mysql.config.php';
        $query = "SELECT alpha, Course, Title, CourseGrade from
        grades";

        $result = $db->query($query);

        if(!result) {   
                    echo "<hr> There was an error with the
                    cyber</hr>";
        }

        $myrows = $result->num_rows;

        while ($row = result->fetch_object())
              $alpha = $row->alpha;
        }

        while(list($alpha, $course) = $result->fetch_row()) {
              printf("(%s) %s", $alpha, $course);
        }
?>
