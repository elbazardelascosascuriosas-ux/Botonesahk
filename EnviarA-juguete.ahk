; CONFIGURACIÓN
tera := "C:\Program Files\TeraCopy\TeraCopy.exe"
dest := "D:\juguetes"

; Copiar selección
Send, ^c
ClipWait, 1
if !Clipboard
    return

; Construir lista de archivos para la línea de comandos
files := ""

Loop, Parse, Clipboard, `n, `r
{
    src := A_LoopField
    if (src = "")
        continue

    files .= """" src """ "
}

; Lanzar TeraCopy con progreso
Run, "%tera%" Copy %files% "%dest%"
