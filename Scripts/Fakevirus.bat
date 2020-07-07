@echo off
if not DEFINED IS_MAXIMIZED set IS_MAXIMIZED=1 && start "" /max "%~dpnx0" %* && exit
title Windows Defender
cd C:\
color A
echo Scan has started
timeout 2 > NUL
tree 
timeout 1 > NUL
cls
color 7
echo !   !- - - - - - - - - - - - - - - - - - -!   !
echo ! O !                                     ! O !
echo !   !         .----------------.          !   ! 
echo ! O !        !          _       !         ! O !
echo !   !        !      _.-'!'-._   !         !   !
echo ! O !        ! .__.!    !    !  !         ! O !
echo !   !        !     !_.-'!'-._!  !         !   !
echo ! O !        ! '--'!    !    !  !         ! O !
echo !   !        ! '--'!_.-'`'-._!  !         !   !
echo ! O !        ! '--'          `  !         ! O !
echo !   !         '----------------'          !   !
echo ! O !                                     ! O !
echo !   !                                     !   !
echo ! O !                                     ! O !
echo !   !          C O M P U T E R            !   !
echo ! O !                                     ! O !
echo !   !            R E P O R T              !   !
echo ! O !                                     ! O !
echo !   !- - - - - - - - - - - - - - - - - - -!   !
echo Virus found
timeout 1 > NUL
echo Cleaning immediately necessary
timeout 1 > NUL
pause
title Cleaning...
color A
echo Cleaning
timeout 30 > NUL
echo Still Cleaning
timeout 30 > NUL
echo Still Cleaning
timeout 30 > NUL
echo Done
rem set load=   
rem set/a loadnum=0
rem :Cleaning
rem set load=%load%ÛÛ
rem cls
rem echo.
rem echo Cleaning... Please Wait...
rem echo ----------------------------------------
rem echo %load%
rem echo ----------------------------------------
rem ping localhost -n 2 >nul

rem set/a loadnum=%loadnum% +1
rem if %loadnum%==10 goto Done

rem goto Cleaning
rem :Done
rem echo.
echo Thank you for waiting
timeout 2 > NUL
cls
echo THIS WAS JUST A JOKE
echo YOU DIDN'T HAD A VIRUS AT ANY POINT, BUT BEWARE THAT THERE ARE MALICIOUS PEOPLE OUT THERE WICH WANT YOUR DATA
echo STAY SAFE
pause
echo bye
timeout 3 > NUL
exit