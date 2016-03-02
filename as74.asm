.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  scan_format1 db "%d", 0
  scan_format2 db "%d", 0
  print_format1 db "Enter other number: ", 0
  print_format2 db 13, 10, "GCD equals %d", 13, 10, 0
  n dd -12
  m dd 144
.CODE
main: 
;  готовлю scanf
  push offset n
  push offset scan_format1
  call scanf
  add esp, 8

  
  push offset print_format1
  call printf
  add esp, 4
  
  
  push offset m
  push offset scan_format2
  call scanf
  add esp, 8
  
	mov eax,n
	call module
	push eax
	mov eax,m
	call module
	mov ebx,eax
	pop eax
	call computeGCD
  
;  готовлю printf
  push eax
  push offset print_format2
  call printf
  add esp, 8
  
  call getch
  call getch
  
  call exit

;процедура поиска НОД двух 32-битных беззнаковых чисел  
;числа находятся в регистрах eax,ebx
;результат находится в еах

computeGCD:
	cmp ebx,0
	je res
	xor edx,edx
	div ebx
	mov eax,ebx
	mov ebx,edx
	jmp computeGCD
res:
	ret

;процедура принимает в eax 32-битное со знаком и возвращает его модуль	
module:
	cmp eax,0
	jl reverse
	ret
reverse:
	neg eax
	ret
	
END main