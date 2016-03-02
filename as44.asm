.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 7

.DATA
  ar1 dd 1,2,-3,4,-5,6,7
  ar2 dd len dup(?)
  k dd 3
  
.CODE

main:
	mov esi, offset ar1
	mov edi, offset ar2
	mov ecx, len
	
cycle:
	dec ecx
	cmp ecx,0
	je res
	;xor eax,eax
	mov eax,[esi]
	add esi, type ar1
	cdq
	idiv k
	cmp edx,0
	jne cycle
	mov [edi],eax
	add edi, type ar2
	jmp cycle

res:
	
	
call exit

end main