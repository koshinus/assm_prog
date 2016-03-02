.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 7

.DATA
  ar1 dd 1,2,3,4,5,6,7
  r dd 3
  
.CODE

main:
	mov ecx,r
	mov esi,offset ar1
cycle:
	add esi,type ar1
	mov ebx,esi
	loop cycle
call exit

end main