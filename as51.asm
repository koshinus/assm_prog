.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 3

.DATA
  ar dd 28,-70,154,98
  GCD dd ?
  
.CODE
main:
	mov esi,offset ar
	mov eax,len
	mov edx,dword ptr [esi]
	cmp edx,0
	jg cycle
	neg edx
	
cycle:
	cmp eax,0
	je res
	dec eax
	add esi,type ar
	mov ebx,dword ptr [esi]
	call check
	jmp cycle
	
res:
	mov GCD,edx
call exit

; Процедура поиска НОД двух чисел
; Вход:
;   edx - первое число, 32-битное без знака
;   ebx - второе число, 32-битное со знаком (берется модуль)
; Выход:
;   edx - вычисленный нод, положительное 32-битное без знака
check:
	;в ebx - текущий элемент массива, в edx - общий ГСД, берем модуль числа
	cmp ebx,0
	jg save
	neg ebx
save:
	;сохраняем длину массива
	push eax
computeGCD:
	;вычисление gcd, перемещаем бывший делитель в еах, а остаток от деления в ebx, xor edx и делим, повторяем процедуру
	mov eax,ebx
	mov ebx,edx
	xor edx,edx
	div ebx
	cmp edx,0
	jne computeGCD
	;перемещаем результат (ГСД) в регистр, не используемый основным циклом
	mov edx,ebx
	;возвращаем данные из стека
	pop eax
	ret
end main