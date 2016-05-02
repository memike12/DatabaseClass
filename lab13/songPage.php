<?php
require_once('page.inc.php');
require_once('song.inc.php');
require_once('myConnectDB.inc.php');


session_start();  // start the session

//create a page object
$page = new Page("IT360 songs form");

$page->content = '';

//connect to the database
@ $db = new myConnectDB();

//check if logged in
if (isset($_SESSION['name'])){
	}
else {header("Location: userPage.php");}


///check for errors
$errno = mysqli_connect_errno();
if ($errno){
	$page->content = "<p>Error $errno while connecting to the database. 
	Try back later or contact your system admin. Error message: "
	. mysqli_connect_error() ."</p>";
	$page->display();
	return;
}

if (isset($_POST['insert']))
{
	//process the insert
	$song = new Song($_POST['artist'],$_POST['title']);
	$result = $song->addSong($db);	
	if ($result){
		//print confirmation
		$page->content .= "<p>Song inserted into the database</p>";
	}
	else{
		//print error messahe
		$page->content .= "<p>Error: Song was not inserted into the database</p>";
	}
	//
	unset($_POST['insert']);
}

//process add to cart if form submitted
if (isset($_POST['addToCart']))
{
	//process the add to cart
	if (!isset($_POST['songID']) || empty($_POST['songID'])){
		$page->content .= "<p>Error: please select a song to add to cart</p>";
	}
	else{
		$result = Song::addToCart($_POST['songID']);	
		if ($result){
			//print confirmation
			$page->content .= "<p>Song added to cart</p>";
		}
		else{
			//print error messahe
			$page->content .= "<p>Error: Song was not added to the cart</p>";
		}
	}
	//
	unset($_POST['addToCart']);
}

//process view cart if form submitted
if (isset($_POST['viewCart'])){
	
	//TODO: call the function to display the cart
	$page->content .= Song::viewCart();
	
	unset($_POST['viewCart']);
}


//create the page content
$table = Song::printSongs($db);
if (!$table){
	$page->content = $page->content . "<p>Error printing songs</p>";
	$table = '';
}

//create the content for the page
//it displays all songs
//the action for the form is songPage.php (this program)

$page->content = $page->content. '<h2>Favorite Songs</h2>';

//add the form tag
$page->content = $page->content . 
'<form action="songPage.php" method="post">';

//add the list of current songs
$page->content = $page->content . $table;

//add the input fields and buttons to allow shopping
$page->content = $page->content .
'<p><label>Enter the artist: <input type="text" name="artist" /></label></p>
 <p><label>Enter the title: <input type="text" name="title"/></label></p>
 <p><input type="submit" name = "insert" value = "Insert"/>
 <input type="submit" name = "addToCart" value = "Add Selected Song To Cart"/>
 <input type="submit" name = "viewCart" value = "View Cart"/></p>
 </form>';

//display the page to the browser
$page->display();

//close db connection
$db->close();

?>
