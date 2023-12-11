section .data
    prompt_x db "Masukkan x: ", 0
    prompt_y db "Masukkan y: ", 0
    result_add db "x + y = ", 0
    result_sub db "x - y = ", 0

section .bss
    x resd 1
    y resd 1
    result resd 1

section .text
    global _start

_start:
    ; Meminta masukkan x
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_x
    mov edx, 12
    int 0x80

    ; Membaca input x
    mov eax, 3
    mov ebx, 0
    lea ecx, [x]
    mov edx, 4
    int 0x80

    ; Meminta masukkan y
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_y
    mov edx, 12
    int 0x80

    ; Membaca input y
    mov eax, 3
    mov ebx, 0
    lea ecx, [y]
    mov edx, 4
    int 0x80

    ; Menghitung x + y
    mov eax, [x]
    add eax, [y]
    mov [result], eax

    ; Menampilkan hasil x + y
    mov eax, 4
    mov ebx, 1
    mov ecx, result_add
    mov edx, 8
    int 0x80

    ; Menghitung x - y
    mov eax, [x]
    sub eax, [y]
    mov [result], eax

    ; Menampilkan hasil x - y
    mov eax, 4
    mov ebx, 1
    mov ecx, result_sub
    mov edx, 8
    int 0x80

    ; Mengulangi program
    jmp _start

    ; Mengakhiri program
    mov eax, 1
    int 0x80
