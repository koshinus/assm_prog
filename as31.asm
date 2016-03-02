.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 7
  b dd 10
  d dd ?
  
.CODE

main:
mov eax,a
mov ebx,b
cmp eax,ebx
jge m1
mov edx,ebx
jmp res
m1: mov edx,eax
res: mov d,edx

call exit

end main