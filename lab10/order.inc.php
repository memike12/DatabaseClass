<?php
//Michael Moore
//164488
//info on all products ordered

class Order{
     public $first;
     public $second;

      public function processOrder($quantity_1, $quantity_2){
             
             /*Sorry I had to hard code this because $this->first or $this->second  doesn't work for some reason when I try to call it here*/
               //$first = 3;
		//print "$quantity_1 $quantity_2";
                //$this->second = $quantity_1
		//$this->first = $quantity_2
	      
                $a = $quantity_1;
		$b = $quantity_2;
             
               $string = "<div class=\"container\">
  <div class=\"jumbotron\"><h1>Your Order</h1></div>
  <div class=\"row\">
    <div class=\"col-sm-4\">";
               if($a > 0){
       			$string .= "<p> $a Tee Shirts </p>";
               }
                if($b > 0){
                   	$string .= "<p> $b Patches </p>";
               }

               $firstnum = number_format($a);
               $secondnum = number_format($b);
               $totalquant = $firstnum+$secondnum;
               $firstcost = $firstnum*15;
               $secondcost = $secondnum*10;
               $totalcost = ($firstcost + $secondcost)*1.05 ;
               $string .= "<p> Total Quantity: $totalquant <br>
               Total Amount(with 5% sales tax): $totalcost 
               <h3> Thank you for your order!</h3></div>";
               $this->insertOrderToFile($a, $b, $totalcost);
               return $string;
      }

      public function insertOrderToFile($tshirtquant, $patchquant, $total){
             $string = "Order: Tshirts=$tshirtquant, patches=$patchquant total cost=$total \n";
             $fp = fopen('orders.txt', 'a');
             fwrite($fp, $string);
             fclose($fp);
     }

     public function __construct(){ }

     public function __get($varName){
            $this->$name = $value;
      }

      public function __set($name, $value){
             $this->$name = $value;
      }

}
?>
