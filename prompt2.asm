section .data
    angka1 db "Masukkan angka 1: ", 0
    angka2 db "Masukkan angka 2: ", 0
    pesan_angka1 db "Angka pertama yang Anda masukkan: ", 0
    pesan_angka2 db "Angka kedua yang Anda masukkan: ", 0

section .bss
    input1 resb 5  ; Untuk menyimpan angka pertama yang dimasukkan pengguna
    input2 resb 5  ; Untuk menyimpan angka kedua yang dimasukkan pengguna

section .text
    global _start

_start:
    ; Menampilkan pesan "Masukkan angka 1:"
    mov eax, 4
    mov ebx, 1
    mov ecx, angka1
    mov edx, 19
    int 0x80

    ; Membaca angka pertama dari pengguna
    mov eax, 3
    mov ebx, 0
    mov ecx, input1
    mov edx, 5
    int 0x80

    ; Menampilkan pesan "Masukkan angka 2:"
    mov eax, 4
    mov ebx, 1
    mov ecx, angka2
    mov edx, 19
    int 0x80

    ; Membaca angka kedua dari pengguna
    mov eax, 3
    mov ebx, 0
    mov ecx, input2
    mov edx, 5
    int 0x80

    ; Menampilkan angka pertama yang dimasukkan pengguna
    mov eax, 4
    mov ebx, 1
    mov ecx, pesan_angka1
    mov edx, 25
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, input1
    mov edx, 5
    int 0x80

    ; Menampilkan angka kedua yang dimasukkan pengguna
    mov eax, 4
    mov ebx, 1
    mov ecx, pesan_angka2
    mov edx, 25
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, input2
    mov edx, 5
    int 0x80

    ; Keluar dari program
    mov eax, 1
    mov ebx, 0
    int 0x80
