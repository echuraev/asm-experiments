    org 0x0100
@@start:
    mov ax, 0x64
    mov cl, 0x21

    div cl

    add al, 0x30 ; Convert to ASCII

    call display_letter

    mov al, 0x2e ; '.'
    call display_letter

    mov al, ah

    add al, 0x30 ; Convert to ASCII

    call display_letter

%include "library.asm"
