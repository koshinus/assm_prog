.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

len equ 7

.DATA
  ar dd 1,2,3,4,5,6,7
  res dd ?
  
.CODE
main: 
  mov esi, offset ar
  mov ecx, len
  mov eax, 1

again:  
  mul dword ptr [esi]
; error -> size?  mul [esi]
  add esi, type ar
  loop again
  
  mov res, eax
  
  call exit
END main






