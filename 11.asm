.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA 
a dd -2
b dd 1
d dd ?

.CODE
main:

mov eax, a
mov ebx, b

cmp eax, ebx 
jl m1
mov edx, eax
jmp th

m1: mov edx, ebx
th: mov d, edx

call exit
end main