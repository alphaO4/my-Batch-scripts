#the following is a idea a got while sitting in a cafe. at the end it should upload a file to anonfiles.com and echo the url to access it.


$datapath = "C:\temp\testforapi\test.txt"
$url = https://api.anonfiles.com/upload?token=6e578f0f3525bf07

$r = Invoke-WebRequest -url $url -Method Put -Infile $datapath
 
 print "$r.Content"