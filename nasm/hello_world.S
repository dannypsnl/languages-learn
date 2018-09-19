global start

section .text
start:
	push dword msg.len
	push dword msg
	push dword 1 ; file descriptor=1 ~> stdout
	mov eax, 4 ; sys_write of MacOS
	sub esp, 4
	int 0x80   ; sys_call
	add esp, 16

	push dword 0
	mov eax, 1
	sub esp, 12
	int 0x80   ; sys_call

section .data
msg:  db "Hello, World!", 10
.len: equ $ - msg
