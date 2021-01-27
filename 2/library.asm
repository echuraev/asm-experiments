; library.asm
; Helper for display symbols and read keyboard

    int 0x20

display_letter:
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov ah, 0x0E ; 0x0E - is a function which display symbol
    mov bx, 0x000F ; 00 - zero page, BL
    int 0x10 ; BIOS should draw the letter

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax

    ret

read_keyboard:
    push bx
    push cx
    push dx
    push si
    push di

    mov ah, 0x00 ; 0x00 - function read symbols from keyboard
    int 0x16 ; Ask BIOS to execut 0x00 function

    pop di
    pop si
    pop dx
    pop cx
    pop bx

    ret

