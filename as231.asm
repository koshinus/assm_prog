.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 5
  b dd 2
  l dd 5
  d dd 3
  
.CODE

main:

mov eax, l
xor edx,edx
div d
xor eax,eax
mov eax, a
mov ecx,edx
mul b
sub eax,ecx

call exit

end main