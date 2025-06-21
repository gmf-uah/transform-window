i := 50 ; Movement/resizing increment in pixels

; Move Window: Win + Arrow Keys

#Right:: {
    WinGetPos(&x, &y, , , "A")
    WinMove(x + i, y, , , "A")
}

#Left:: {
    WinGetPos(&x, &y, , , "A")
    WinMove(x - i, y, , , "A")
}

#Up:: {
    WinGetPos(&x, &y, , , "A")
    WinMove(x, y - i, , , "A")
}

#Down:: {
    WinGetPos(&x, &y, , , "A")
    WinMove(x, y + i, , , "A")
}

; Resize Window: Ctrl + Win + Arrow Keys

^#Right:: {
    WinGetPos(&x, &y, &w, &h, "A")
    WinMove( , , w + i, h, "A")
}

^#Left:: {
    WinGetPos(&x, &y, &w, &h, "A")
    WinMove( , , w - i, h, "A")
}

^#Down:: {
    WinGetPos(&x, &y, &w, &h, "A")
    WinMove( , , w, h + i, "A")
}

^#Up:: {
    WinGetPos(&x, &y, &w, &h, "A")
    WinMove( , , w, h - i, "A")
}