.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

  len equ 21

.DATA
  scan_format db "%d", 0
  print_format1 db "%d ", 0
  print_format2 db "%d", 13, 10, 0
  ar dd len dup(?)
  n dd 4
  
.CODE

main:
	push offset n
	push offset scan_format
	call scanf
	add esp, 8
	
	push n
	mov esi,offset ar
	push esi
	call pascal_triangle
	add esp,8
	
	call getch
	call getch
call exit
;процедура поиска минимального элемента массива
; Вход:
;   [ebp+12] - указатель на введенное число
;	[ebp+8] - указатель на массив
; Выход:
;   нет
pascal_triangle:
	push ebp
	mov ebp,esp
	
	push esi
	push eax
	push ebx
	push ecx
	push edx
	
	xor ebx,ebx
	xor edx,edx
	mov esi,[ebp+8]
	push esi
	mov ecx,[ebp+12]
	inc ecx
	push ecx
;формируем все массивы: один на основе другого
;ecx - введенное число
;edx, ebx - счетчики (edx от 0 до есх)
total_formation:
	pop ecx
	pop esi
	inc edx		
	cmp edx,ecx
	jg res
	push esi
	push ecx
	mov ebx,0
	mov ecx,[esi]
;формируем и выводим очередной массив
;ebx - счетчик (от 1 до ebx)
;eax,ecx - используются для работы с массивом
array_formation:
	inc ebx
	cmp ebx,edx
	je to_total_formation
	mov eax,ecx
	mov ecx,[esi+4]
	add eax,ecx
	
	push esi
	push eax
	push ebx
	push ecx
	push edx
	
  push eax
  push offset print_format1
  call printf
  add esp, 8
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop esi
	
	mov [esi+4],eax
	add esi,4
	jmp array_formation
to_total_formation:
	add esi,4
	mov eax,1
	
	push esi
	push eax
	push ebx
	push ecx
	push edx
	
  push eax
  push offset print_format2
  call printf
  add esp, 8
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop esi
	
	mov [esi],eax
	jmp total_formation
res:
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop esi 
	
	pop ebp
	
	ret
END main