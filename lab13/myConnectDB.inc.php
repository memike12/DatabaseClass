<?php
/*This class extends the mysqli class, 
so it has all functionality expected from the mysqli;
Additionally, it provides default values for the parameters in the constructor,
so they don't need to be specified every time we connect to a db*/
/*TODO: modify the default values to match your credentials*/
class myConnectDB extends mysqli{
	
	public function __construct($hostname="zee.academy.usna.edu",
			$user="m164488", 
			$password="9502116", 
			$dbname="m164488"){
		parent::__construct($hostname, $user, $password, $dbname);
	}
}
?>
