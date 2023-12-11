%include "asm_io.inc"

segment .data
prompt1          db    	"Masukkan Nilai 1 (0 s.d 100): ", 0
prompt2          db    	"Masukkan Nilai 2 (0 s.d 100): ", 0
err_input_msg	 db		"Angka yang Anda masukkan tidak dalam 0 s.d 100", 0
lulus_msg		 db		"Anda lulus!", 0
gagal_msg		 db		"Anda tidak lulus!", 0

passing_score	 dd		150d

segment .bss
nilai1			resd	1
nilai2			resd	1

segment .text
        global  _main
_main:
        enter   0,0               
        pusha

        mov     eax, prompt1
        call    print_string
        call    read_int
        cmp     eax, 0
        jl      error
        cmp     eax, 100
        jg      error
        mov     [nilai1], eax

        mov     eax, prompt2
        call    print_string
        call    read_int
        cmp     eax, 0
        jl      error
        cmp     eax, 100
        jg      error
        mov     [nilai2], eax

        mov     eax, [nilai1]
        add     eax, [nilai2]
        cmp     eax, [passing_score]
        jl      gagal

        mov     eax, lulus_msg
        call    print_string
        jmp     end

error:
        mov     eax, err_input_msg
        call    print_string
        jmp     end

gagal:
        mov     eax, gagal_msg
        call    print_string

end:
        popa
        mov     eax, 0            
        leave                     
        ret