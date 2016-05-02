<?php
require_once('page.inc.php');
require_once('myConnectDB.inc.php');
require_once('product.inc.php');
 
//create a page object
$page = new Page("OnlineStore - Manage Products");
 
//create a connection
@ $db = new myConnectDB();
 
//check connection
if (mysqli_connect_errno()) {
    $page->content =  '<p>Connect failed: '. mysqli_connect_error(). '</p>';
    $page->display();
    exit; 
}

 
$product = new Product();

if(!empty($_POST['barcode'])){
	$product->addProduct($db);
	print '<script>alert("Thank you for your submission")</script>';
}

if(!empty($_POST['Item'])){
	$product->deleteProduct($db);
	print '<script>alert("Product #' . $_POST['Item'] . ' was deleted")</script>';
}

$table = $product->printProducts($db);

//everything OK
 $page->content = "<div class='container'>
  <div class='jumbotron'>
    <h1>Product Management</h1>
  </div>
  <div class='row'>
    <div class='col-sm-4'>
	<h3>Current Inventory</h3> 
	<form method='post' action='ProductPage.php'>".
	$table . "
	<input type='submit' value='Delete'></form>
    </div>
    <div class='col-sm-4'>
	<h3>Enter Inventory</h3> 
    	<form method='post' action='ProductPage.php'>
	<p><label>Barcode: <input type='text' name='barcode'/></label></p>
  	<p><label>Product name: <input type='text' name='pname' /></label></p>
	<p><label>Quantity: <input type='text' name='quant' /></label></p>
	<p><label>Price: <input type='text' name='price' /></label></p>
  	<input type='submit' name='submitDelete' value='submit'></form>
    </div>
    <div class='col-sm-4'>
      <h3></h3>        
    </div>
  </div>
</div>";
 
//display page
$page->display();

?>
 
