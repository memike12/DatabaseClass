<?php


session_start();

if (isset($_SESSION['ses'])) {
	echo "You were last here "; 
	echo $_SESSION['ses'];
}
else {
	echo "Welcome noob";
}
$_SESSION['ses'] = date("M d Y H:i:s");








?>
