#Requires AutoHotkey v1.1
#NoEnv
#SingleInstance Ignore
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

; ============================================================
;  Pulsar "Copiar enlace" en MEGA - Streamdock Ajazz (AHK v1)
; ============================================================

imagePath := A_ScriptDir . "\copiar_enlace.png"

if !FileExist(imagePath)
{
    MsgBox, 16, Error, No se encontro 'copiar_enlace.png' en:`n%A_ScriptDir%
    ExitApp
}

; Obtener dimensiones de la pantalla virtual (soporta varios monitores)
SysGet, vL, 76
SysGet, vT, 77
SysGet, vW, 78
SysGet, vH, 79

MouseGetPos, origX, origY

found := false
Loop, 2
{
    ImageSearch, fx, fy, %vL%, %vT%, % vL+vW, % vT+vH, *40 %imagePath%
    if (ErrorLevel = 0)
    {
        targetX := fx + 77
        targetY := fy + 22
        MouseClick, Left, %targetX%, %targetY%
        found := true
        break
    }
    Sleep, 80
}

MouseMove, %origX%, %origY%, 0

if (!found)
{
    TrayTip, MEGA, No se encontro el boton 'Copiar enlace', , 2
}

ExitApp
