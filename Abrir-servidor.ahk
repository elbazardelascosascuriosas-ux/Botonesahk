targetPath := "\\VALHALLA"  ; SIN barra final

foundHwnd := 0
shell := ComObjCreate("Shell.Application")

for window in shell.Windows
{
    try
    {
        path := window.Document.Folder.Self.Path

        ; Normalizar
        StringLower, path, path
        StringLower, targetPathLower, targetPath

        ; Comparación flexible
        if (SubStr(path, 1, StrLen(targetPathLower)) = targetPathLower)
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
