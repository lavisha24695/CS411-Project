<?php


//CITATIONS : A THE CLASS HAS BEEN REFERENCED FROM THIS TUTORIAL 
//LINK: https://medium.com/@BeingJayDesai/learn-web-scraping-using-php-1306d3c79ecb



//display errors if any
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



// webscraping class
class webscraping{
   public $url;
public $source;

function __construct($url) {
$this->url = $url;

$this->source = $this->getCurl($this->url);

$this->pathObj= $this->getXPathObj($this->source);

    
}

public function getCurl($url) {

$ch = curl_init();


curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);

curl_setopt($ch, CURLOPT_URL, $url);

$results = curl_exec($ch);

curl_close($ch);

return $results;
    
}
// Method to get XPath object
public function getXPathObj($item) {
$xmlPageDom = new DomDocument();

@$xmlPageDom->loadHTML($item);
$xmlPageXPath = new DOMXPath($xmlPageDom);
return $xmlPageXPath; 
}
}

// set up the sql servers 

$mysqli = new mysqli("localhost","foobarcs411_gwehner2","password123","foobarcs411_scheduler");

if($mysqli->connect_errno)
{
    echo "Failed to connect to MySql: ( " .$mysqli->connect_errno . ")".
        $mysqli->connect_error;
}



$query= "SELECT * FROM Course";

$result = $mysqli->query($query);
$numrows= $result->num_rows;
$code =0;
$topic='';
if($numrows>0){
    
// querying koofers for avg gpa 
while($row=$result->fetch_assoc()){
    

$code=$row['Code'];
$topic=$row['Name'];
$topic=strtolower($topic);
$topic= str_replace(' ', '-', $topic);

$url="https://www.koofers.com/university-of-illinois-urbana-champaign-uiuc/cs/{$code}-{$topic}/";
print("{$url} <br>");
$webscraper= new webscraping($url);

$gpa = $webscraper->pathObj->query("//div[@style='float:right;text-align:center;width:75px;']");
var_dump($gpa);

$coursedata = array();

if($gpa->length > 0){
  
	foreach($gpa as $row1){
	    $coursedata[]=$row1->nodeValue;
	
	}
}

if(count($coursedata)<=0){
    print("No data on Koofers <br>");
}
else{
     if($coursedata[0]>1){
    
    $query2 = "SELECT Code FROM CoursesWithKoofersAvgGpa WHERE Code={$code}";
    $result2= $mysqli->query($query2);
    if($result2->num_rows>0){
    
    $query2= "UPDATE CoursesWithKoofersAvgGpa SET KoofersAvggpa ={$coursedata[0]} WHERE Code={$code}";
     $result2=$mysqli->query($query2);
     }
     
     else{
         $query2="INSERT INTO CoursesWithKoofersAvgGpa VALUES({$code},{$coursedata[0]})";
         $result2= $mysqli->query($query2);
     }
     }
print("{$coursedata[0]} <br> ");

}

}

//querying wade fagen ulmenscheinder's data for avg gpa 


function calculateavggpa($Aplus,$A,$Aminus,$Bplus,$B,$Bminus,$Cplus,$C,$Cminus,$DPlus,$D,$Dminus,$F)
{
    $sum=$Aplus+$A+$A-+$Bplus+$B+$Bminus+$Cplus+$C+$Cminus+$DPlus+$D+$Dminus+$F;
    $result = $Aplus*4.0+$A*4+$Aminus*3.67+$Bplus*3.33+$B*3.0+$Bminus*2.67+$Cplus*2.33+$C*2.0+$Cminus*1.67+$DPlus*1.33+$D*1.0+$Dminus*0.0+$F*0;
    $result= $result/$sum;
    return $result;
}
$query= "SELECT Number,SUM(Aplus),SUM(A),SUM(Aminus),SUM(Bplus),Sum(B),SUM(Bminus),SUM(Cplus),SUM(C),SUM(Cminus),SUM(Dplus),SUM(D),SUM(Dminus),SUM(F) FROM WadeCourseInfo,Course WHERE WadeCourseInfo.Number=Course.Code GROUP BY Number";
$result = $mysqli->query($query);

if($result->num_rows>0){
    while($row=$result->fetch_assoc()){
        $code = $row['Number'];
        $Aplus=$row['SUM(Aplus)'];
        $A=$row['SUM(A)'];
        $Aminus=$row['SUM(Aminus)'];
        $Bplus=$row['SUM(Bplus)'];
       
       
        $Bminus=$row['SUM(Bminus)'];
        $Cplus=$row['SUM(Cplus)'];
        $C=$row['SUM(C)'];
        $Cminus=$row['SUM(Cminus)'];
        $DPlus=$row['SUM(Dplus)'];
        $D=$row['SUM(D)'];
        $Dminus=$row['SUM(Dminus)'];
        $F=$row['SUM(F)'];
           $B=$row['Sum(B)'];
      $avggpa=calculateavggpa($Aplus,$A,$Aminus,$Bplus,$B,$Bminus,$Cplus,$C,$Cminus,$DPlus,$D,$Dminus,$F);
      
      if($avggpa>4.0){
          if($code<200){
              $avggpa=$avggpa-1.0;
          }
          else 
          {
              $avggpa=$avggpa/2;
          }
      }
    $query2 = "SELECT Code FROM CoursesWithWadeAvgGpa WHERE Code={$code}";
    $result2= $mysqli->query($query2);
    if($result2->num_rows>0){
    
    $query2= "UPDATE CoursesWithWadeAvgGpa SET WadeAvggpa ={$avggpa} WHERE Code={$code}";
     $result2=$mysqli->query($query2);
     }
     
     else{
         $query2="INSERT INTO CoursesWithWadeAvgGpa VALUES({$code},{$avggpa})";
         $result2= $mysqli->query($query2);
     }
        
    }
    
    
}


}
?>