<?php
//Michael Moore
//164488
//php script to handle orders

require_once('order.inc.php');
require_once('page.inc.php');

//create a page object
$page = new Page("Order Recieved");
//set the page content
$order = new Order();

$quant1 = $_POST["quantity_1"];
$quant2 = $_POST["quantity_2"];

$page->content = $order->processOrder($quant1, $quant2);
//echo "quant1: $quant1  quant2: $quant2";
$page->display();
?>
