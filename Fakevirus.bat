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
color 0a
echo Cleaning
timeout 30 > NUL
echo Still Cleaning
timeout 30 > NUL
echo Still Cleaning
timeout 30 > NUL
echo Done
//set load=
//set/a loadnum=0
//:Cleaning
//set load=%load%ÛÛ
//cls
//echo.
//echo Cleaning... Please Wait...
//echo ----------------------------------------
//echo %load%
//echo ----------------------------------------
//ping localhost -n 2 >nul

//set/a loadnum=%loadnum% +1
//if %loadnum%==10 goto Done

//goto Cleaning
//:Done
//echo.
//echo Done 
echo Thank you for waiting
timeout 2 > NUL
cls
echo THIS WAS JUST A JOKE
echo YOU DIDN'T HAD A VIRUS AT ANY POINT, BUT BEWARE THAT THERE ARE MALICIOUS PEOPLE OUT THERE WICH WANT YOUR DATA
echo STAY SAFE
pause
echo bye
timeout 1 > NUL
exit