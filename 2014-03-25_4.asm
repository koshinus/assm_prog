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
  
;  push offset ret1  
;  jmp prod
  call prod
  
;ret1:
;  pop ebp

;  -10 * -22
  mov eax, -10
  mov ebx, -22
  
;  push offset ret2  
;  jmp prod
  call prod
  
;ret2:
;  add esp,4  
  
  call exit

; а можно здесь

;------------------
; Вход:
;  eax, ebx - два числа
;  [esp] - адрес возврата (на вершине стека)
; Выход:
;  eax - произведение
prod:
  push edx
  
  imul ebx
  
  pop edx

;  jmp dword ptr [esp]
; + add esp,4 - удаление адреса возврата из стека
  ret
;------------------

  
END main






