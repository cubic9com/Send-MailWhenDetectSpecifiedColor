<#
.SYNOPSIS
Sends an email when the pixel pointed by the mouse pointer turn the specified color.
マウスポインターが指すピクセルが指定された色に変わったときにメールを送信する。

.DESCRIPTION
Sends an email when the pixel pointed by the mouse pointer turn the specified color.
Make sure you first assign values to variables in config.ps1 before you run this script.
マウスポインターが指すピクセルが指定された色に変わったときにメールを送信する。
このスクリプトを実行する前に、まずconfig.ps1の変数に値を割り当ててください。

.LINK
https://github.com/cubic9com/Send-MailWhenPixelColorTurnSpecifiedColor

.LINK
References:
- "PowerShellでスクリーン上の任意の位置のRGB値を取得する（カラーピッカー）"
  https://qiita.com/saggie/items/37c7f2e257d69f237585
#>

# Load configuration file
.".\Config.ps1"

# Take measures against misalignment due to DPI scaling
$signature = @"
using System;
using System.Runtime.InteropServices;

public static class Win32 {
    [DllImport("user32.dll")]
    public static extern bool SetProcessDPIAware();
}
"@
Add-Type -TypeDefinition $signature
[void][Win32]::SetProcessDPIAware()

# Prepare bitmap and graphics
Add-Type -AssemblyName System.Drawing, System.Windows.Forms

$bitmap = New-Object System.Drawing.Bitmap(1, 1)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

Write-Host "Move the cursor to the target position in 3 seconds..."
Start-Sleep 3

while ($true) {
    # get the pixel pointed by the mouse pointer
    $positionX = [System.Windows.Forms.Cursor]::Position.X
    $positionY = [System.Windows.Forms.Cursor]::Position.Y
    $graphics.CopyFromScreen($positionX, $positionY, 0, 0, $bitmap.Size)
    $currentColor = $bitmap.GetPixel(0, 0)

    $decValue = "current color: {0}, {1}, {2}" -f $currentColor.R, $currentColor.G, $currentColor.B
    Write-Host "$decValue"

    if ($currentColor -eq $expectedColor) {
        # If the current color matches the specified color, then send an email
        Write-Host "Sending an email..."

        $client = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
        $client.EnableSsl = $true
        $client.Credentials = New-Object Net.NetworkCredential($smtpUsername, $smtpPassword)

        $message = New-Object Net.Mail.MailMessage($mailFrom, $mailTo, $mailSubject, $mailBody)
        $client.Send($message)

        Write-Host "done."

        $bitmap.Dispose()
        $graphics.Dispose()
        break
    }

    Start-Sleep 10
}
