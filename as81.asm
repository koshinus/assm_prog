.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 10

.DATA
  ar dd 3,4,6,1,7,8,8,4,2,1
  
.CODE

main:
	push len
	push offset ar
	call bubble_sort
	add esp,8
	
call exit

;процедура поиска минимального элемента массива
; Вход:
;   [ebp+8] - указатель на используемый массив
;   [ebp+12] - длина массива
; Выход:
;   нет
bubble_sort:
	push ebp
	mov ebp,esp
	
	push esi
	push eax
	push ebx
	push ecx
	push edx
	
	mov esi,[ebp+8]
	mov ecx,[ebp+12]
	push esi
;есх - дополнительный счетчик
;edx - основной счетчик
;еах - предыдущий элемент
;ebx - текущий элемент
for1:
	pop esi
	mov ebx,[esi]
	push esi
	add esi,type ar
	dec ecx
	cmp ecx,0
	je res
	mov edx,-1
for2:
	inc edx
	cmp edx,ecx
	jge for1
	mov eax,ebx
	mov ebx,[esi]
	add esi,type ar
	cmp ebx,eax
	jge for2
	mov [esi-8],ebx
	mov [esi-4],eax
	mov ebx,eax
	jmp for2
res:
	pop esi
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop esi
	
	pop ebp
	
	ret
	
END main