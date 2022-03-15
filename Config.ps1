<#
.SYNOPSIS
Defines variables for the main script.

.DESCRIPTION
Defines variables for the main script.
#>

# The color to detect
# 検知する色
$expectedColor = [System.Drawing.Color]::FromArgb(0, 255, 0)

# SMTP server and its credential
# For Gmail, you must create an app password first.
# SMTPサーバと認証情報
# Gmailの場合は、アプリパスワードを発行しておく必要があります。
$smtpServer = "smtp.gmail.com"
$smtpPort = "587"
$smtpUsername = "foo@example.com"
$smtpPassword = "password"

# Mail message
# メールのメッセージ
$mailSubject = "Detected specified color"
$mailBody = "It's time to get back to do something."
$mailFrom = $smtpUsername
$mailTo = "bar@example.com"
