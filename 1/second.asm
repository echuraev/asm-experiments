    org 0x0100
@@start:
    mov ah, 0x00 ; Number of function which works with keyboard
    int 0x16 ; Get symbol
    cmp al, 0x1B ; Is it <Esc>?
    je @@exit

    mov ah, 0x0E
    mov bx, 0x000F
    int 0x10

    jmp @@start
@@exit:
    int 0x20
