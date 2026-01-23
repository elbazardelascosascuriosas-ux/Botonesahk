exeName := "StreamingCloner.exe"   ; <-- cambia esto
exePath := "C:\Program Files\OpenCloner\Streaming-Cloner\StreamingCloner.exe"

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
