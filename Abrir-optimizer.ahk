exeName := "MKV Optimizer v3.exe"   ; <-- cambia esto
exePath := "D:/herramientas/MKV-Optimizer-v3-3.10.105/MKV Optimizer v3.exe"

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
