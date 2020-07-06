@echo off
set /p size="Enter size:"
set /p name="Enter name:"
set /a MB=  "size * 1048576 "
fsutil file createnew %name%.txt %MB%
exit