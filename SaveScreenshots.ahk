; Define the screenshot save path
ScreenshotPath := "C:\Users\Kasutaja\Desktop"

; Initialize a counter for filenames
global ScreenshotCounter := 1

; Function to create a simple filename
createFileName() {
    global ScreenshotCounter
    FileName := ScreenshotPath "\Screenshot_" ScreenshotCounter ".png"
    ScreenshotCounter++
    return FileName
}

; Hotkey for Win + Shift + S
#+s:: {
    ; Trigger the snipping tool
    Send("#+s")
    Sleep(1000)  ; Adjust if necessary for the snipping tool

    ; Open Paint
    Run("mspaint.exe")
    WinWaitActive("ahk_class MSPaintApp")

    ; Paste the screenshot into Paint
    Send("^v")
    Sleep(500)  ; Adjust if necessary for pasting

    ; Save the screenshot
    FileName := createFileName()
    Send("^s")
    Sleep(500)
    SendText(FileName)
    Sleep(500)
    Send("{Enter}")
    Sleep(500)

    ; Close Paint
    WinClose("ahk_class MSPaintApp")
}