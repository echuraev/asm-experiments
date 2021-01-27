    org 0x0100
        mov ax, 0x0002
        int 0x10

        mov ax, 0xB800
        mov ds, ax
        mov es, ax

@@main_loop:
        mov ah, 0x00 ; Service for reading internal clocks
        int 0x1A
        mov al, dl
        test al, 0x40 ; 6th bit is equal to 1?
        je @@increase
        not al
@@increase:
        and al, 0x3F
        sub al, 0x20
        cbw
        mov cx, ax

        mov di, 0x0000 ; Position on the screen
        mov dh, 0 ; Row number
@@next_row:
        mov dl, 0 ; Column number
@@next_col:
        push dx ; push current position on stack
        mov bx, sin_table

        mov al, dh ; Get row number
        shl al, 1 ; << 1
        and al, 0x3F ; Restrict range 0...63
     cs xlat ; Take sin value
        cbw ; fill till 16 bit
        push ax ; push value on stack

        mov al, dl ; Get column
        and al, 0x3F ; range 0...63
     cs xlat ; Take sin value
        cbw
        pop dx
        add ax, dx ; Add with prev sin
        add ax, cx ; Add current ticks number
        mov ah, al ; Put color to ah
        mov al, 0x2A ; Draw circles by *
        mov [di], ax
        add di, 2 ; Go on the next position

        pop dx ; Get number of row and column
        inc dl ; Go to the next col
        cmp dl, 80 ; 80 - maximum number of columns
        jne @@next_col
        inc dh ; Go to the next row
        cmp dh, 25
        jne @@next_row

        mov ah, 0x1 ; Check keyboard condition
        int 0x16
        jne @@key_pressed ; finish program if key was pressed
        jmp @@main_loop
@@key_pressed:
        int 0x20

; Sin table for 360 degree
sin_table:
        db 0, 6, 12, 19, 24, 30, 36, 41
        db 45, 49, 53, 56, 59, 61, 63, 64
        db 64, 64, 63, 61, 59, 56, 53, 49
        db 45, 41, 36, 30, 24, 19, 12, 6
        db 0, -6, -12, -19, -24, -30, -36, -41
        db -45, -49, -53, -56, -59, -61, -63, -64
        db -64, -64, -63, -61, -59, -56, -53, -49
        db -45, -41, -36, -30, -24, -19, -12, -6

