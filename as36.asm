.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  n db 33
  fibnum dd ?
  
.CODE
	main:
	xor ebx,ebx
	mov eax,1
	xor ecx,ecx
	mov cl,n
	mov edx,ecx
	cmp edx,0
	jne cycle1
	mov ebx,1
	jmp res

cycle1:
	add ebx,eax
	sub edx,1
	cmp edx,0
	je res
	jmp cycle2

cycle2:
	add eax,ebx
	sub edx,1
	cmp edx,0
	je res
	jmp cycle1

res: mov fibnum, ebx

call exit

end main