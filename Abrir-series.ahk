targetPath := "\\VALHALLA\series"

foundHwnd := 0

shell := ComObjCreate("Shell.Application")

for window in shell.Windows
{
    try
    {
        path := window.Document.Folder.Self.Path
        if (path = targetPath)
        {
            foundHwnd := window.HWND
            break
        }
    }
    catch
    {
    }
}

if (foundHwnd)
{
    WinRestore, ahk_id %foundHwnd%
    WinActivate, ahk_id %foundHwnd%
}
else
{
    Run, explorer.exe "%targetPath%"
}
