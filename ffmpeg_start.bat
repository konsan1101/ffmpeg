rem 恒久的スクリプト実行許可
rem PowerShell Set-ExecutionPolicy RemoteSigned

rem 一時的スクリプト実行許可
PowerShell -ExecutionPolicy RemoteSigned -File ffmpeg_stop.ps1
PowerShell -ExecutionPolicy RemoteSigned -File ffmpeg_start.ps1

rem pause
