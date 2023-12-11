section .data
    pesan db 'Selamat Datang di Universitas Gunadarma',0

section .text
    global _start

_start:
    ; Menyimpan alamat pesan dalam register RSI
    mov rsi, pesan
    ; Memanggil fungsi C untuk mencetak string
    call print_string
    ; Keluar dari program
    call exit

print_string:
    ; Fungsi C untuk mencetak string
    mov rax, 0x4
    mov rdi, 1
    mov rdx, 50
    syscall
    ret

exit:
    ; Keluar dari program
    mov rax, 60
    xor rdi, rdi
    syscall
