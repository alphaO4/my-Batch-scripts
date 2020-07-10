@echo off
set /p size="Enter size in MB:"
set /p name="Enter name:"
set /a MB=  "%size% * 1048576 "
fsutil file createnew %name%.txt %MB%
echo Done
Timeout 10 > NUL
exit