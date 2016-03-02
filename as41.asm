;произведение элементов массива
.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 7

.DATA
  ar dw 1,2,3,4,5,6,7
  sum dw ?
  prod dw ?
  
.CODE

main:

	mov esi, offset ar
	mov ecx, len
	mov ax, 1
	mov bx, 0
	
again1:
	mul word ptr [esi]
	add esi, type ar
	loop again1

	mov ecx,len
	mov esi, offset ar
	
again2:
	add bx, word ptr [esi]
	add esi, type ar
	loop again2
	
	mov prod, ax
	mov sum, bx
	
call exit

end main