section .data
    prompt_x db "Masukkan x: ", 0
    prompt_y db "Masukkan y: ", 0
    result_mul db "x * y = ", 0
    result_div db "x / y = ", 0
    result_mod db "Sisa x / y = ", 0

section .bss
    x resd 1
    y resd 1
    result resd 1

section .text
    global _start

_start:
    ; Meminta masukan x
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

    ; Meminta masukan y
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

    ; Menghitung x * y
    mov eax, [x]
    imul eax, [y]
    mov [result], eax

    ; Menampilkan hasil x * y
    mov eax, 4
    mov ebx, 1
    mov ecx, result_mul
    mov edx, 12
    int 0x80

    ; Menghitung x / y
    mov eax, [x]
    cdq
    idiv dword [y]
    mov [result], eax

    ; Menampilkan hasil x / y
    mov eax, 4
    mov ebx, 1
    mov ecx, result_div
    mov edx, 12
    int 0x80

    ; Menghitung sisa x / y
    mov eax, [x]
    cdq
    idiv dword [y]
    mov [result], edx

    ; Menampilkan sisa x / y
    mov eax, 4
    mov ebx, 1
    mov ecx, result_mod
    mov edx, 14
    int 0x80

    ; Mengulangi program
    jmp _start

    ; Mengakhiri program
    mov eax, 1
    int 0x80
