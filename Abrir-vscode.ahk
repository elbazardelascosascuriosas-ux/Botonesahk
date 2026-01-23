targetPath := "C:\Microsoft VS Code\Code.exe"

WinGet, idList, List
found := 0

Loop, %idList%
{
    thisID := idList%A_Index%
    WinGet, procPath, ProcessPath, ahk_id %thisID%
    if (procPath = targetPath)
    {
        found := thisID
        break
    }
}

if (found)
{
    WinRestore, ahk_id %found%
    WinActivate, ahk_id %found%
}
else
{
    ; LANZAR DESDE EXPLORER PARA MANTENER CONTEXTO CORRECTO
    Run, explorer.exe "%targetPath%"
}
