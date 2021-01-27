    org 0x0100

    in al, 0x40 ; Read number from timer
    and al, 0x07 ; Mask, the number in the following range 0..7

    add al, 0x30 ; To ASCII
    mov cl, al ; Save number

@@game_loop:
    mov al, '?'
    call display_letter
    call read_keyboard
    cmp al, cl
    jne @@game_loop ; No: jump to the begin
    call display_letter ; Print right number
    mov al, ':'
    call display_letter
    mov al, ')'
    call display_letter

%include "library.asm"
