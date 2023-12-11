section .data
    prompt db "Masukkan sebuah angka: ", 0
    output db "Anda memasukkan angka: ", 0
    input db 0
    output_len equ $ - output

section .bss
    number resb 10 ; Menyimpan angka yang dimasukkan pengguna

section .text
    global _start

_start:
    ; Tampilkan prompt ke layar
    mov eax, 4          ; Syscall write (code 4)
    mov ebx, 1          ; File descriptor 1 (STDOUT)
    mov ecx, prompt     ; Pointer ke pesan prompt
    mov edx, 24         ; Panjang pesan prompt
    int 0x80            ; Panggil syscall

    ; Baca input dari pengguna
    mov eax, 3          ; Syscall read (code 3)
    mov ebx, 0          ; File descriptor 0 (STDIN)
    mov ecx, number     ; Pointer ke variabel number
    mov edx, 10         ; Panjang maksimum input
    int 0x80            ; Panggil syscall

    ; Tampilkan pesan output dan angka yang dimasukkan
    mov eax, 4          ; Syscall write (code 4)
    mov ebx, 1          ; File descriptor 1 (STDOUT)
    mov ecx, output     ; Pointer ke pesan output
    mov edx, output_len ; Panjang pesan output
    int 0x80            ; Panggil syscall

    ; Tampilkan angka yang dimasukkan pengguna
    mov eax, 4          ; Syscall write (code 4)
    mov ebx, 1          ; File descriptor 1 (STDOUT)
    mov ecx, number     ; Pointer ke variabel number
    mov edx, 10         ; Panjang maksimum angka
    int 0x80            ; Panggil syscall

    ; Keluar dari program
    mov eax, 1          ; Syscall exit (code 1)
    xor ebx, ebx        ; Kode keluar 0
    int 0x80            ; Panggil syscall
