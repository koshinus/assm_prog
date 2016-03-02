.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 9

.DATA
  ar dd 3,4,6,7,8,8,4,2,1
  
.CODE

main:
;помещаем данные в стек
	push len
	push offset ar
	call min_Elem
	add esp,8
	
call exit
;процедура поиска минимального элемента массива
; Вход:
;   [ebp+8] - указатель на используемый массив
;   [ebp+12] - длина массива
; Локальные переменные:
;  возможно есть(?)
; Выход:
;   нет
min_Elem:
	push ebp
	mov ebp,esp

;  спасаю регистры
	push ecx
	push eax
	push esi
	push ebx
	push edx

; готовлюсь к циклу:
;в есх посылаю длину массива
;в еsi - адрес массива
;изначально считаю, что первый элемент массива - минимальный
;заношу его в ebx
;в edx заношу его индекс
	mov ecx,[ebp+12]
	mov esi,[ebp+8]
	mov ebx,[esi]
	push esi
	add esi,type ar
	mov edx,0

;в еах - текущий элемент массива
;в ebx - текущий минимальный элемент
;в edx - счетчик
;в ecx - длина
cycle1:
	inc edx
	cmp edx,ecx
	jge search
	mov eax,[esi]
	add esi,type ar
	cmp eax,ebx
	jnb cycle1
	mov ebx,eax
	jmp cycle1

;прохожу по массиву, вычитаю минимальный элемент
;в еах - текущий элемент массива
;в ebx - минимальный элемент
;в edx - счетчик
;в ecx - длина
search:
	pop esi
	mov edx,0
cycle2:
	mov eax,[esi]
	sub eax,ebx
	mov [esi],eax
	add esi,type ar
	inc edx
	cmp edx,ecx
	jl cycle2
res:
;восстанавливаю регистры
	pop edx
	pop ebx
	pop esi
	pop eax
	pop ecx
	
	pop ebp
	
	ret
	
END main