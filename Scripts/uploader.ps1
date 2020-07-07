#the following is a idea a got while sitting in a cafe. at the end it should upload a file to anonfiles.com and echo the url to access it.

$Token = ?token=6e578f0f3525bf07
$datapath = "C:\temp\testforapi\test.txt"
$uri = https://api.anonfiles.com/upload

 Invoke-WebRequest -uri $uri -Method Put -Infile $datapath -Token $Token
 
 print "$r.Content"