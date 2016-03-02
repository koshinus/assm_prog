.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 17
  b dd 4
  gcd dd ?
  
  
.CODE
main:
	mov ecx,a
	mov edx,b

cycle:
	mov eax,ebx
	mov ebx,edx
	xor edx,edx
	div ebx
	cmp edx,0
	je c1
	jmp cycle

c1: mov gcd,ebx

call exit

end main