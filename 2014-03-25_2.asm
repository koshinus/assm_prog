.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  
.CODE
; процедуры можно размещать здесь

; ГЛАВНАЯ ПРОЦЕДУРА
main: 
;  1 * 2
  mov eax, 1
  mov ebx, 2
  mov ebp, offset ret1  
  jmp prod
ret1:

;  -10 * -22
  mov eax, -10
  mov ebx, -22
  mov ebp, offset ret2  
  jmp prod
ret2:
  
  call exit

; а можно здесь

;------------------
; Вход:
;  eax, ebx - два числа
;  ebp - адрес возврата
; Выход:
;  eax - произведение
prod:
  push edx
  
  imul ebx
  
  pop edx
  jmp ebp

;------------------

  
END main






