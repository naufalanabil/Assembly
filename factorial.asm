%include "asm_io.inc"

segment .data
prompt db "Masukkan angka (0 s.d 10): ", 0
err_msg db "Angka yang Anda masukkan tidak diantara 0 s.d 10", 0

segment .bss

segment .text
global _main
_main:
enter 0,0
pusha

mov eax, prompt
call print_string
call read_int

cmp eax, 10
jg error

cmp eax, 0
jl error

cmp eax, 0
je nol_faktorial

mov ecx, eax
dec ecx

loop_start:
mul ecx
loop loop_start
jmp end

nol_faktorial:
mov eax, 1
jmp end

error:
mov eax, err_msg
call print_string
jmp exit

end:
call print_int
call print_nl

exit:
popa
mov eax, 0
leave
ret