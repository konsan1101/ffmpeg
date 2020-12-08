# ------------------
# 録画ファイルの削除
# ------------------
if (Test-Path   "recorder.mp4") {
    Remove-Item "recorder.mp4"
}
if (Test-Path   "recorder.flv") {
    Remove-Item "recorder.flv"
}

# ---------------
# "ffmpeg" の開始
# ---------------
# Start-Process -FilePath "ffmpeg" -ArgumentList "-threads 2 -init_hw_device qsv:hw -f gdigrab -i desktop -vf scale=1920:-2 -vcodec h264_qsv -r 5 recorder.mp4" -WindowStyle Minimized
  Start-Process -FilePath "ffmpeg" -ArgumentList "-threads 2                        -f gdigrab -i desktop                   -vcodec flv1     -r 5 recorder.flv" -WindowStyle Minimized

# --------
# 一時停止
# --------
# Read-Host -Prompt "Press Enter to continue"

