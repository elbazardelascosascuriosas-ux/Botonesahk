exeName := "brave.exe"   ; <-- cambia esto
exePath := "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"

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
