#Requires AutoHotkey v2.0

; Rewind 5 seconds with Shift + Left Arrow
+Left:: {
    ControlSendToFirefox("{Left}")
}

; Fast forward 5 seconds with Shift + Right Arrow
+Right:: {
    ControlSendToFirefox("{Right}")
}

ControlSendToFirefox(keys) {
    ; Activate the Firefox window
    if WinExist("ahk_exe firefox.exe") {
        ; Send the keys to the active window in Firefox
        WinActivate
        Send(keys)
    }
}
