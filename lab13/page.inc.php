<?php
class Page
{
  // class Page's attributes
  public $content;
  private $title = 'IT360 Applied Database Systems';
  private $keywords = 'IT360 Applied Database Systems, PHP, 
                   SQL, Fun, United States Naval Academy';
	
	private $xmlheader = "<!DOCTYPE html>
		<html>";
  

  //constructor 
  public function __construct($title){
	$this->__set("title", $title);
  }
  
  //set private attributes
  	public function __set($varName, $varValue)
	{	
		$varValue = trim($varValue);
		$varValue = strip_tags($varValue);
		if (!get_magic_quotes_gpc()){
			$varValue = addslashes($varValue);
		}
		$this->$varName = $varValue;
	}
	
	//get function - nothing special for now
	public function __get($varName)
	{
		return $this->$varName;
	}
  
  //output the page
  public function display()
  {
	echo $this->xmlheader;
	echo "<head>\n";
    $this -> displayTitle();
    $this -> displayKeywords();
    $this -> displayStyles();
    echo "</head>\n<body>\n";
    $this -> displayContentHeader();
    echo $this->content;
    $this -> displayContentFooter();
    echo "</body>\n</html>\n";
  }

  //output the title 
  public function displayTitle()
  {
    echo '<title> '.$this->title.' </title>';
  }

  public function displayKeywords()
  {
    echo "<meta name=\"keywords\" content=\"$this->keywords\" />";
  }

  //display the embedded stylesheet
  public function displayStyles()
  { 
?>   
  <style>
    h1.header {color:yellow; background-color: blue; font-size:24pt; 			
		text-align:center; 
        font-family:arial,sans-serif}
    p {font-size:12pt; text-align:justify; 
       font-family:arial,sans-serif}
    p.footer {color:yellow; background-color: blue; font-size:9pt; 		
			text-align:center; 
            font-family:arial,sans-serif; font-weight:bold}
  </style>
<?php
  }

  //display the header part of the visible page
  public function displayContentHeader()
  { 
?>   

    <h1 class = "header"> <br /> IT360 Applied Database Systems <br /> <br /></h1>
<?php
  }

  //display the footer part of the visible page
  public function displayContentFooter()
  {
?>
    <p class="footer"> <br />&copy; IT360 Applied Database Systems <br /> <br /></p>

<?php
  }
}
?>
