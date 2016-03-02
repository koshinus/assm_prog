.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
len equ 4
reka dd 28, 70, 154, 7
  
.CODE
; процедуры можно размещать здесь

; ГЛАВНАЯ ПРОЦЕДУРА
main: 
	xor edx, edx
	mov	esi, offset reka
	mov ecx, len
	dec ecx
	mov eax, [esi]
bicycle_:
	add esi, type reka
	mov ebx, [esi]
	call help_
	loop bicycle_
  
  call exit
help_:
	push edx
	push ebx
	help_deeper_:
		xor edx, edx
		div ebx
		cmp edx, 0 
		jne swap_
		mov eax, ebx
		jmp pora_domoy_
	swap_:
		mov eax, ebx
		mov ebx, edx
		jmp help_deeper_
	pora_domoy_:
	pop ebx
	pop edx

	ret
; а можно здесь

;------------------
; Вход:
;  eax, ebx - два числа
;  [esp] - адрес возврата (на вершине стека)
; Выход:
;  eax - произведение
;help_:
;  push eax
;  
;  imul ebx
;  
;  pop edx;
;
;  jmp dword ptr [esp]
; + add esp,4 - удаление адреса возврата из стека
;  ret
;------------------

  
END main