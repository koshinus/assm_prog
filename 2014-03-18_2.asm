.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

len equ 7

.DATA
  ar1 dw 1,2,3,4,5,6,7,0
  ar2 dd len dup (?)
  
.CODE
main: 
  mov esi, offset ar1
  mov edi, offset ar2

  mov ecx, len

again:  
  xor eax, eax
  mov ax, [esi]
  shl eax, 1
  mov [edi], eax

  add esi, type ar1
  add edi, type ar2
  
  loop again
  
  call exit
END main