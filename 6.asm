.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA 
n db 24
fib dd ?

.CODE
main:

mov ebx, 0
mov eax, 1

xor ecx, ecx
mov cl, n
jcxz th

fibbo:
mov edx, eax
add eax, ebx
mov ebx, edx
loop fibbo
th:
mov fib, eax

call exit
end main