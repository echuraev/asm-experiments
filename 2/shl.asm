    org 0x0100
@@start:
    mov al, 0x02
    shl al, 1 ; Shift left on one bit

    add al, 0x30 ; Convert to ASCII

    call display_letter

%include "library.asm"
