# Overview / 概要

A PowerShell script which sends an email when the pixel pointed by the mouse pointer turn the specified color.  
This script could be used, for example, to send an email to your smartphone when the progress bar value reaches about 100% during building an app in a game engine.

マウスポインターが指すピクセルが指定された色に変わったときにメールを送信するPowerShellスクリプト。  
このスクリプトは、例えば、ゲームエンジンでアプリをビルドする際にプログレスバーの値が100%程度になったら、スマートフォンにメールを送信するような使い方ができるかもしれません。

# How to use / 使用方法

1. Assign values to variables in config.ps1.  
    - The color to detect
    - SMTP server and its credential
    - Mail message
1. Run the main script.  
1. Move the mouse pointer to the target position within 3 seconds.  

<br>

1. config.ps1の変数に値を割り当てる。
    - 検知する色
    - SMTPサーバーと認証情報
    - メールのメッセージ
1. メインスクリプトを実行する。
1. 3秒以内にマウスポインターを目的の位置に移動させる。

# References / 参考
- [PowerShellでスクリーン上の任意の位置のRGB値を取得する（カラーピッカー）](https://qiita.com/saggie/items/37c7f2e257d69f237585)

# LICENSE / ライセンス

Copyright (C) 2022, cubic9com All rights reserved.

This code is licensed under the MIT license.

See file LICENSE for more information.
