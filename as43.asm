.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 7

.DATA
  ar1 dd 1,2,3,4,5,6,7
  ar2 dd len dup(?)
  
.CODE

main:
	mov esi, offset ar1
	mov edi, offset ar2
	mov ecx, len
	;dec ecx
	
cycle:
	mov eax,[esi]
	mov [edi + type ar1*ecx-type ar1],eax
	add esi, type ar1
	loop cycle
	
	
call exit

end main