.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 5
  b dd 2
  l dd -55
  d dd -17
  
.CODE

main:

mov eax, l
cdq
idiv d
xor eax,eax
mov eax, a
mov ecx,edx
mul b
sub eax,ecx

call exit

end main