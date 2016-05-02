<?php
require_once('page.inc.php');

//create the page
$myPage = new Page('Array examples');

//set the content
$myPage->content = '<p>Working with Arrays</p>';

$arrayOfYears = array('1900', '2000', '2004', '2005');

foreach($arrayOfYears as $year){
	if($year%4 == 0){
                if($year %100 == 0){
                         if($year%400 == 0){
                                       echo "$year is a leap year <br>";
                                    }
                                    else{
                                        echo "$year is not a leap year<br>";
                                    }
                           }
                           else{
                           echo "$year is a leap year <br>";
                           }
                }
	}
        else{
        echo "$year is not a leap year<br>";
        }

?>
