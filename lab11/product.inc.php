<?php
/*Michael Moore
164488
fetches products objects*/

class Product{
public $barcode = '';
public $pname = '';
public $price ='';
public $quantinstock;

	public static function getAllProductsAsHTML(){
		return "
       			<form action=\"receiveOrder.php\">
       			<table border=\"1\">
             		<tr>
                	<td>Item</td>
                	<td>Quantity</td>
              		</tr>

              		<tr>
                	<td>Tee Shirts</td>
                	<td><input type=\"text\" name=\"quantity_1\" size=\"3\" maxlength=\"3\" /></td>
              		</tr>

              		<tr>
                	<td>Patches</td>
                	<td><input type=\"text\" name=\"quantity_2\" size=\"3\" maxlength=\"3\" /></td>
              		</tr>
      			</table>
      			<p><input type=\"submit\" value=\"Submit Order\" /></p>
			</form>";

	}
	public function __construct(){
	}
	public function __get($varName){
            	$this->$name = $value;
      	}

     	public function __set($name, $value){
             	$this->$name = $value;
	}
	public function addProduct($db){
		$barcode = $_POST["barcode"];
		$pname = $_POST["pname"];
		$price = $_POST["price"];
		$quantinstock = $_POST["quant"];

		$query = "INSERT INTO Product (BarCode, PName, Price, QuantityInStock)
			Values('$barcode', '$pname', '$price', '$quantinstock')";

		$result = $db->query($query);
		if (!$result || $db->affected_rows == 0){
			//For debugging purposes, display the error - not nice, but effective
			echo '<h1>ERROR: '. $db->error . " for query *$query*</h1>";
			return false;
		}
		else{
			return true;
		}
	}
	public function printProductsWithDelete($db){
		$query = "SELECT BarCode, PName, Price, QuantityInStock 
			FROM Product ORDER BY BarCode"; 
		$result = $db->query($query);
		if (!$result){
			return false;
		}
		$num_results = $result->num_rows;
	    	$table = '';
		if ($num_results > 0){
		
		   $table = $table . 
		   "<table border = '1'><tr><th>BarCode</th><th>Product</th><th>Price</th><th>Quantity</th><th>Delete</th></tr>";
		
		   for ($i=0; $i<$num_results; $i++){
            	  	$row = $result->fetch_assoc(); 
			$BarCode = $row['BarCode'];
			$name = $row['PName'];
			$table = $table 
				.'<tr>'
				. '<td>'. $row['BarCode'] . '</td>'
				. '<td>'. $row['PName'] . '</td>'
				. '<td>'. $row['Price'] . '</td>'
				. '<td>'. $row['QuantityInStock'] . '</td>'
				. '<td>'. '<input type="Radio" value="' 
					. $BarCode . '" Name="Item">' . '</td>'
				.'</tr>';
		   }
		$table = $table . '</table>';
		}	
		$result->free(); //free memory
        return $table;
	}

	public function printProducts($db){
		$query = "SELECT BarCode, PName, Price, QuantityInStock 
			FROM Product ORDER BY BarCode"; 
		$result = $db->query($query);
		if (!$result){
			return false;
		}
		$num_results = $result->num_rows;
	    	$table = '';
		if ($num_results > 0){
		
		   $table = $table . 
		   "<table border = '1'><tr><th>BarCode</th><th>Product</th><th>Price</th><th>Quantity</th><th>Add to Cart</th></tr>";
		
		   for ($i=0; $i<$num_results; $i++){
            	  	$row = $result->fetch_assoc(); 
			$BarCode = $row['BarCode'];
			$name = $row['PName'];
			$table = $table 
				.'<tr>'
				. '<td>'. $row['BarCode'] . '</td>'
				. '<td>'. $row['PName'] . '</td>'
				. '<td>'. $row['Price'] . '</td>'
				. '<td>'. $row['QuantityInStock'] . '</td>'
				. '<td>'. '<input type="checkbox" value="' 
					. $BarCode . '" Name="addToCart">' . '</td>'
				.'</tr>';
		   }
		$table = $table . '</table>';
		}	
		$result->free(); //free memory
        return $table;
	}

	public function deleteProduct($db){	
		//This adds a song object to the song table
		//Song_ID is auto_increment, and Votes has a default of 0 
		$barcode = $_POST["Item"];

		//create the SQL query
		//use single quotes for strings
		//no quotes for numbers
		
		$query = "DELETE FROM Product 
			WHERE BarCode = $barcode";

		$result = $db->query($query);
		//check for errors
		if (!$result || $db->affected_rows == 0){
			echo '<h1>ERROR: '. $db->error . " for query *$query*</h1>";
			return false;
		}
		else{
			return true;
		}
    	}












}
?>
