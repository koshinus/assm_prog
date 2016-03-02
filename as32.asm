.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 7
  b dd 2
  d dd 3
  
  
.CODE

main:
mov eax,a
mov ebx,a
xor edx,edx
div b
cmp edx,1
je c1
jmp c2
c1: mov eax,ebx
mul d
inc eax
c2: mov a,eax

call exit

end main