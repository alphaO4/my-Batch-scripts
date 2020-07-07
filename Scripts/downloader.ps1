$source = "Http link"; $destination = "File name. (doesn’t necessarily need the same name as the file getting downloaded)"; Invoke-WebRequest $source -OutFile $destination; 

#example: $source = "https://www.dropbox.com/File.exe?dl=1"; $destination = "Test.exe"; Invoke-WebRequest $source -OutFile $destination; 
#the "?dl=1" at the end means that if you go on that url the file will be automaticly downloaded.