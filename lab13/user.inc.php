<?php

class User {
	// This class is used to create and maintain authentication
	
	public $userID;
	public $password;	
	
	//This is the constructor 
	public function __construct($userID, $pass) {
		$this->userID = $userID;
		$this->password = $pass;
	}
	
	
	//add a new user to the database
	public function addUser($db){	
		//This adds a user object to the AppUsers table
		$userID = $this->userID;
		$password = sha1($this->password);
		$query = "INSERT INTO users12 (UserID,Password,Type) VALUES ('$userID','$password','u');";
        $result = $db->query($query);
		if (!$result || $db->affected_rows == 0){
			return false;
		}
		else{
			return true;
		}
			
    }	

	
	//check whether a user is in the database
    public function validate($db) {
            $userID = $this->userID;
            $password = sha1($this->password);
            $query = "SELECT Type FROM users12 WHERE UserID = '$userID' and Password = '$password'";
			//echo "<p>*$query*</p>";
            $result = $db->query($query);
			if (!$result){
				echo "<h2>ERROR executing query *$query*. Error message: ". $db->errno ." ". $db->error ."</h2>";
				return false;
			}
            $num_rows = $result->num_rows;
			//if query returned something, the user is valid
         	if ($num_rows >= 1){
	         	//I could get the type of user and store it in a session variable for later use
               $row = $result->fetch_array();
               $type = $row['Type'];
			   //not doing anything with type for now
			   return true;				
            }
			//else, invalid username/password combination
			return false;
			
	}
}
?>

