exeName := "GeneradorPostSeries.exe"   ; <-- cambia esto
exePath := "D:/herramientas/GeneradorPostSeries.exe"

Process, Exist, %exeName%
pid := ErrorLevel

if (pid)
{
    WinGet, hwnd, ID, ahk_pid %pid%
    WinRestore, ahk_id %hwnd%
    WinActivate, ahk_id %hwnd%
}
else
{
    Run, "%exePath%"
}
