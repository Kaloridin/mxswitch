#Requires AutoHotkey v2.0
#SingleInstance Force

Mx(ch) => Run('powershell.exe -NoProfile -ExecutionPolicy Bypass -File "' A_ScriptDir '\mxswitch.ps1" -Channel ' ch, , "Hide")

F13::Mx(1)   ; Fn+Q
F14::Mx(2)   ; Fn+W
F15::Mx(3)   ; Fn+E
