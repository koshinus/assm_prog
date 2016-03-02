.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 7

.DATA
  ar1 dd 1,2,3,4,5,6,7
  ar2 dd 3,4,6,7,8,8,4
  ar3 dd len dup(?)
  scal dd 0
  
.CODE

main:
xor esi,esi
	mov ecx,len
	
cycle:
	mov eax,ar1[esi]
	mov edx,ar2[esi]
	mov ebx,edx
	add ebx,eax
	imul edx
	add scal,eax
	mov ar3[esi],ebx
	add esi,type ar1
	loop cycle
	mov scal,ebx
	
call exit

end main