exeName := "AudioExtractor64.exe"   ; <-- cambia esto
exePath := "D:/herramientas/Pazera_Free_Audio_Extractor_64bit_PORTABLE/AudioExtractor64.exe"

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
