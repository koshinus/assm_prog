.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
n db 7
fact dd ?

.CODE
main:
xor eax, eax
mov al, n
cmp eax, 0
mov fact, 0
je th2

xor ebx, ebx
mov eax, 1
mov bl, n

th1:
cmp ebx, 1
je th 
mul ebx
dec ebx
jmp th1

th:
mov fact, eax
th2:
call exit
end main