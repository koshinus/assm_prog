;произведение элементов массива
.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 7

.DATA
  ar1 dd 1,2,3,4,5,6,7
  ar2 len dup(?)
  res dd ?
  
.CODE

main:

	mov esi, offset ar1
	mov edi, offset ar2
	mov ecx, len
	mov eax, 1
	
again:
	xor eax,eax
	mov ax,[esi]
	shl eax,1
	mov [edi],eax
	add esi, type ar1
	add edi, type ar2
	loop again
	
	mov res, eax
	
call exit

end main