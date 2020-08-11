@echo off
if not DEFINED IS_MAXIMIZED set IS_MAXIMIZED=1 && start "" /max "%~dpnx0" %* && exit
title Windows Defender
cd C:\
color A
echo Scan has started
timeout 2 > NUL
tree 
timeout 3 > NUL
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
echo No Virus found
echo No Cleaning necessary
timeout 3 > NUL
pause
timeout 1 > NUL
exit