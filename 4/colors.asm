    org 0x0100
        mov ax, 0x0002   ; AX = 0x00 - set mode
                         ; AL = 0x02 - text mode 80x25x16
        int 0x10
        mov ax, 0xB800
        mov ds, ax
        mov es, ax
        cld
        xor di, di
        mov ax, 0x1348
        stosw
        mov ax, 0x1B45
        stosw
        mov ax, 0x1C4C
        stosw
        mov ax, 0x1D4C
        stosw
        mov ax, 0x1E4F
        stosw
        int 0x20

