

;C:\Program Files\Mozilla Firefox
;firefox.exe ; firefox private
;private_browsing.exe ;firefox private
;C:\Program Files\Midori Browser
;midori.exe
;private_browsing.exe
#Requires AutoHotKey v2.0
SetTitleMatchMode 2

dir := A_ScriptDir ;ahk folder
top_icon := dir . "\icon.png"

mygui := Gui()
mygui.Title := "TristanDevs"
mygui.BackColor := ""
mygui.SetIcon := top_icon



mygui.Add("Text", ,"Select Browsers:")

mygui.Add("Checkbox", "w300", "Firefox").OnEvent("Click", (*) => (
    mygui.Destroy()
))

mygui.Add("Checkbox", "w300", "FirefoxPrivate").OnEvent("Click", (*) => (
    mygui.Destroy()
))

mygui.Add("Checkbox", "w300", "Midori").OnEvent("Click", (*) => (
    mygui.Destroy()
))

mygui.Add("Checkbox", "w300", "MidoriPrivate").OnEvent("Click", (*) => (
    mygui.Destroy()
))

mygui.Show("AutoSize Center")



WINDOW_TITLES := {
    FirefoxPriavte: "Mozilla Firefox Private Browsing",
    Firefox: "Mozilla Firefox"
}



