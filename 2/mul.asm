    org 0x0100
@@start:
    mov al, 0x03
    mov cl, 0x02

    mul cl

    add al, 0x30 ; Convert to ASCII

    call display_letter

%include "library.asm"
