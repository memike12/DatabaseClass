<?php
/*Michael Moore
164488
fetches products objects*/

class Product{

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
</form>
";

}


}

?>
