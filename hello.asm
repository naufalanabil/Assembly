   ; directive include
%include "asm_io.inc"


segment .data
   ; directive Dx
    hello	db	'Hello, world', 0 ; string "Hello, world!"
   
   
	
segment .bss
   ; directive RESx

segment .text
   global _main
   _main:
      ; Routine “setup”
      enter  0, 0
      pusha

      ; Program Anda di bawah
	  
	  mov	eax, hello
	  call	print_string

      ; Routine “cleanup”
      popa
      mov    eax, 0
      leave
      ret