<?php
require_once('page.inc.php');
require_once('product.inc.php');
 
//create a page object and set the title
$page = new Page("Sweet Shirts");
//$getHTML = new Product();


$table = Product::getAllProductsAsHTML();
//set the page content
$page->content = "<div class=\"container\">
  <div class=\"jumbotron\">
    <h1>Buy patches and shirts</h1>
  </div>
  <div class=\"row\">
    <div class=\"col-sm-4\">
	<h3>Online Store Order Form</h3>
		<form action=\"receiveOrder.php\" method=\"post\">
      		$table
     		</form>
    </div>
    <div class=\"col-sm-4\">
      <h3></h3>
      <p></p> 
    </div>
    <div class=\"col-sm-4\">
      <h3></h3>        
    </div>
  </div>
</div>";
//display page
$page->display();


?>
