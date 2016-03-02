.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 10

.DATA
  ar dd 3,4,6,1,7,8,8,4,2,1
  a dd ?
  b dd ?
  
.CODE

main:
;помещаем данные в стек
	push len
	push offset ar
	push offset a
	push offset b
	call min_Elem
	add esp,16
	
call exit
;процедура поиска минимального элемента массива
; Вход:
;   [ebp+8] - индекс минимального элемента массива
;   [ebp+12] - минимальный элемент
;   [ebp+16] - указатель на используемый массив
;   [ebp+20] - длина массива
; Локальные переменные:
; возможно есть(?)
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
	mov ecx,[ebp+20]
	mov esi,[ebp+16]
	mov ebx,[esi]
	add esi,type ar
	mov edx,0
	push eax

;в еах - текущий элемент массива
;в ebx - текущий минимальный элемент
;в edx - счетчик
;в ecx - длина
cycle1:
	inc edx
	cmp edx,ecx
	jge res
	mov eax,[esi]
	add esi,type ar
	cmp eax,ebx
	jnb cycle1
	mov ebx,eax
	pop eax
	mov eax,edx
	push eax
	jmp cycle1

;заношу полученные результаты
res:
	pop eax
	mov edx,eax
	mov [ebp+12],ebx
	mov [ebp+8],edx
;восстанавливаю регистры
	pop edx
	pop ebx
	pop esi
	pop eax
	pop ecx
	
	pop ebp
	
	ret
	
END main