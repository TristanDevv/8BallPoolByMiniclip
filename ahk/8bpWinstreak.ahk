#Requires AutoHotKey v2.0
SetTitleMatchMode 2

x_dir := A_WorkingDir

WaitForImage(imagePath, &outX, &outY, timeoutMs := 5000, tolerance := 70) {
    start := A_TickCount
    Loop {
        result := ImageSearch(&outX, &outY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*" tolerance " " imagePath)
        if (result = 1)
            return true
        if ((A_TickCount - start) > timeoutMs)
            return false
        Sleep(1)
    }
}

midori_hwnd := "ahk_exe midori.exe"
firefox_hwnd := "ahk_exe firefox.exe"

img_folder := x_dir . "\img\game"

seefreinds := img_folder . "\see_freinds.png"
challange := img_folder . "\challenge.png"
table := img_folder . "\table.png"
playnow := img_folder . "\playnow_sending_button.png"
playnow_ff := img_folder . "\playnow_sending_button_firefox.png"
game_menu := img_folder . "\ingame_menu.png"
leave_menu := img_folder . "\leave_menu.png"
leave_button := img_folder . "\leave_button.png"
back_button := img_folder . "\back_button.png"

WinActivate(midori_hwnd)
;WinMove(100, 100, 500, 500, midori_hwnd)

Send("^0")

WinActivate(firefox_hwnd)

Send("^0")

res := WaitForImage(seefreinds, &foundX, &foundY, 2000, 3)
if (res = true) {
     Sleep(100)
    ControlClick("x" foundX " y" foundY, firefox_hwnd)
     Sleep(50)
}

res := WaitForImage(challange, &foundX, &foundY, 2000, 3)
if (res = true) {
     Sleep(100)
    ControlClick("x" foundX " y" foundY, firefox_hwnd)
     Sleep(50)
}

res := WaitForImage(table, &foundX, &foundY, 3000, 3)
if (res = true) {
     Sleep(100)
    ControlClick("x" foundX " y" foundY, firefox_hwnd)
     Sleep(50)
}

;;;;;;;;accepting

WinActivate(midori_hwnd)

res := WaitForImage(playnow, &foundX, &foundY, 5000, 3)

if (res = true) {
    Sleep(100)
    ControlClick("x" foundX " y" foundY, midori_hwnd)
    Sleep(50)
}

WinActivate(firefox_hwnd)

resx := WaitForImage(playnow_ff, &foundX, &foundY, 5000, 3)
if (resx = true) {
     Sleep(50)
    ControlClick("x" foundX " y" foundY, firefox_hwnd)
    Sleep(50)
}

WinActivate(midori_hwnd)
;click menu

res := WaitForImage(game_menu, &foundX, &foundY, 15000, 3)
if (res = true) {
     Sleep(100)
    ControlClick("x" foundX " y" foundY, midori_hwnd)
    Sleep(100)
} 

res := WaitForImage(leave_menu, &foundX, &foundY, 3000, 3)
if (res = true) {
     Sleep(100)
    ControlClick("x" foundX " y" foundY, midori_hwnd)
    Sleep(100)
} 

res := WaitForImage(leave_button, &foundX, &foundY, 3000, 3)
if (res = true) {
    Sleep(50)
    ControlClick("x" foundX " y" foundY, midori_hwnd)
    Sleep(50)
}

WinActivate(firefox_hwnd)

res := WaitForImage(back_button, &foundX, &foundY, 10000, 3)
if (res = true) {
     Sleep(100)
    ControlClick("x" foundX " y" foundY, firefox_hwnd)
}