.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  
.CODE
main: 
  mov eax, 10
  push eax
  call summ_n
  add esp, 4

  mov eax, 100
  push eax
  call summ_n
  add esp, 4
  
  call exit
  
; Процедура суммирования первых 
; n натуральных чисел  
; Вход:
;   [ebp+8] - n, 32-битное без знака
; Выход:
;   eax - искомая сумма, 32-битное без знака
summ_n:
  push ebp
  mov ebp, esp
  
  mov eax, [ebp+8]
  cmp eax, 1
  je stop_summ
  
  dec eax
  push eax
  call summ_n
  add esp, 4
  
  add eax, [ebp+8]
  
stop_summ:  
  pop ebp
  ret

END main