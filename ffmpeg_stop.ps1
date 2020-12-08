# ----------------
# Send-Keys の定義
# ----------------
Add-Type -AssemblyName Microsoft.VisualBasic
Add-Type -AssemblyName System.Windows.Forms
function Send-Keys {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$false,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [string]
        $KeyStroke,

        [Parameter(Mandatory=$false,
                   ValueFromPipelineByPropertyName=$true)]
        [string]
        $ProcessName,

        [Parameter(Mandatory=$false,
                   ValueFromPipelineByPropertyName=$true)]
        [int]
        $Wait = 0
    )
    Process {
        $Process = ps | ? {$_.Name -eq $ProcessName} | sort -Property CPU -Descending | select -First 1
        Write-Verbose $Process", KeyStroke = "$KeyStroke", Wait = "$Wait" ms."
        sleep -Milliseconds $Wait
        if ($Process -ne $null) {
            [Microsoft.VisualBasic.Interaction]::AppActivate($Process.ID)
        }
        [System.Windows.Forms.SendKeys]::SendWait($KeyStroke)
    }
}

# ---------------
# "ffmpeg" の終了
# ---------------
$name      = "ffmpeg"

$processes = (Get-Process)
foreach($process in $processes) {
    if($process.Name -eq   $name) {
	Send-Keys "q" -ProcessName $name
    }
}

$processes = (Get-Process)
foreach($process in $processes) {
    if($process.Name -eq   $name) {
        Wait-Process -Name $name -Timeout 5
        Stop-Process -Name $name
    }
}

# --------
# 一時停止
# --------
# Read-Host -Prompt "Press Enter to continue"



