    org 0x0100
@@start:
    mov al, 0x04 ; load 4 in AL register
    add al, 0x03 ; Add 3

    add al, 0x30 ; Convert to ASCII

    call display_letter

%include "library.asm"

