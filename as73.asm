.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  scan_format db "%d", 0
  print_format db 13, 10, "You have entered %d", 13, 10, 0
  n dd ?
.CODE
main: 
;  готовлю scanf
  push offset n
  push offset scan_format
  call scanf
  add esp, 8
  
;  готовлю printf
  mov eax, n
  add eax,10
  push eax
  push offset print_format
  call printf
  add esp, 8
  
  call getch
  call getch
  
  call exit
  
END main