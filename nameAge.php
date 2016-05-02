<?php 
      class MyNewClass{
            public $name;
            public $age;
            
            public unction __construct() {}

            public function __set($name, $value) {
                   this ->$name = $value;
            }

            public function __get($varName) {
             return $this->$varName;
            }
            
            public static function getPersonAttributesAsHTMLInput() {
             $myString = '<p><label>Enter your name: <input type="text" name="name"/></label></p>
  <p><label>Enter your age: <input type="text" name="age" /></label></p>
  <input type = "submit" value = "submit">';
  return $myString;
            }
     }


     $title = "Person";
     $content = "Hello World";

     echo "<!DOCTYPE html>";
     echo "<head><title> $title </title></head>";
     echo "<body>";

     echo "Here is my $content <-- Double Quoted <br>";
     echo 'What happenned here - my $content <-- Single Quoted <br><br>';

     echo "</body></html>";

     // Show the source code with the page!
     echo "<hr>";



?>
