.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
a dd 30
b dd 17
max dd ?
min dd ?
gcd dd ?

.CODE
main:
	mov eax, a
	mov ebx, b

	cmp eax, ebx 
	jl m1
	mov edx, eax
	mov ecx, ebx
	jmp th
	m1: mov edx, ebx
	mov ecx, eax
	th: 
	mov max, edx
	mov min, ecx

	mov eax, max
	mov ebx, min
	tut:
	xor edx, edx
	div ebx
	cmp edx, 0
	je ttt
	mov eax, ebx
	mov ebx, edx
	jmp tut
	ttt: 
	mov gcd, ebx

call exit
end main