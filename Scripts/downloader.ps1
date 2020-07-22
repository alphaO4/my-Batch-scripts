$source = "Http link"; $destination = "File name"; Invoke-WebRequest $source -OutFile $destination; 

#example: $source = "https://www.dropbox.com/File12.exe?dl=1"; $destination = "Test.exe"; Invoke-WebRequest $source -OutFile $destination; 
#the "?dl=1" at the end means that if you go on that url the file will be automaticly downloaded.
#The destination file name doesn’t necessarily need to match the name of the file getting downloadet