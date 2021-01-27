; Sieve of Eratosthenes
; https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

    org 0x0100

table: equ 0x8000
table_size: equ 1000

@@start:
    mov bx, table
    mov cx, table_size
    mov al, 0
@@next_cell:
    mov [bx], al
    inc bx
    loop @@next_cell

    mov ax, 2
@@next_number:
    mov bx, table
    add bx, ax
    cmp byte [bx], 0
    jne @@already_marked
    push ax
    call display_number
    mov al, ','
    call display_letter
    pop ax

    mov bx, table
    add bx, ax
@@next_ne_prostoe:
    add bx, ax
    cmp bx, table+table_size
    jnc @@already_marked
    mov byte[bx], 1
    jmp @@next_ne_prostoe

@@already_marked:
    inc ax
    cmp ax, table_size
    jne @@next_number

%include "../library.asm"

