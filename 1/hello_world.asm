    org 0x100      ; Reserve first 100 bytes
@@start:
    mov bx, string ; Move in BX address of variable 'string'
@@repeat:
    mov al, [bx]   ; Move to AL next symbol from 'string'
    cmp al, 0      ; AL == 0 ?
    je @@end       ; Jump to the end when AL == 0
    push bx        ; Keep pointer on the current symbol

    ; Print symbol on the screen by using BIOS interrupt: 0x10
    mov ah, 0x0E   ; 0E - function which print symbol on the display
    mov bx, 0x0FF0
    int 0x10
    ; ---

    pop bx         ; Restore stack pointer
    inc bx         ; Increment pointer to the next symbol
    jmp @@repeat
@@end:
    int 0x20       ; Print in to the cmd

string:
    db "Hello, world!", 0
