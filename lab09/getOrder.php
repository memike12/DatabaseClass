<?php
//Michael Moore
//164488
//Page to order products

require_once('page.inc.php');
require_once('product.inc.php');
 
//create a page object
$page = new Page("Order Products");
//set the page content

$page->content = Product::getAllProductsAsHTML();
//display page
$page->display();

?>
