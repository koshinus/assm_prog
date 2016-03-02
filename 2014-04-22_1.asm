.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  a dq -23.789
  b dq 1234.567567567567e-2 ; 1234.567 * 10^(-2) = 12.34567
  cc dq ?
  print_a db "a = %lf", 13, 10, 0
  print_b db "b = %.15lf", 13, 10, 0

  mess_c db "Enter a real number: ", 0
  input_c db "%lf", 0
  print_c db 13, 10, "c = %.15lf", 13, 10, 0
  
.CODE
main: 
;  готовлю printf
  mov eax, offset a
  push dword ptr [eax+4]
  push dword ptr [eax]
  push offset print_a
  call printf
  add esp, 12
  
  mov eax, offset b
  push dword ptr [eax+4]
  push dword ptr [eax]
  push offset print_b
  call printf
  add esp, 12
  
  push offset mess_c
  call printf 
  add esp, 4
  
  push offset cc
  push offset input_c
  call scanf
  add esp, 8
  
  mov eax, offset cc
  push dword ptr [eax+4]
  push dword ptr [eax]
  push offset print_c
  call printf
  add esp, 12
  
  call getch
  call getch
  
  call exit
  
END main