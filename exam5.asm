.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  len equ 16
  str1 db "2130987327012467"
  str2 db len dup (?)
  
.CODE
main: 
  mov eax, offset str2
  push eax
  mov eax, offset str1
  push eax
  mov eax, len
  push eax
  call lin_sort
  add esp, 12
  
  call exit
  
; Процедура линейной сортировки 
; строковой записи числа
; Вход:
;   [ebp+48] - длина массива, 32-битное без знака
;   [ebp+52] - указатель на исходный массив
;   [ebp+56] - указатель на результирующий массив
; Локальные переменные:
;   [ebp] - массив счетчиков 
;           на 10 4-байтный чисел без знака
; Выход:
;   нет
lin_sort:
  push ebp
  sub esp, 40
  mov ebp, esp
  
;  спасаю регистры
  push ecx
  push esi
  push eax
  
;  зануляю массив
  mov ecx, 10
zero_loop:
  mov dword ptr [ebp+4*ecx-4], 0
  loop zero_loop

;  иду по исходному массиву и считаю цифры
  mov ecx, [ebp+48]  
  mov esi, [ebp+52]
  xor eax, eax
count_loop:
  mov al, [esi]
  sub al, '0'   ; код нуля - 48
  inc dword ptr [ebp+eax*4]  
  add esi, 1
  loop count_loop
  
;  заполняю результирующий массив
  mov ecx, 10
  mov esi, [ebp+56]
  
;  цикл по очередной цифре
fill_loop:
  cmp dword ptr [ebp+ecx*4-4], 0  
  je next_digit
  
  mov [esi], cl
  add byte ptr [esi], '0'  
  dec byte ptr [esi]

  dec dword ptr [ebp+ecx*4-4]
  add esi, 1
  jmp fill_loop
  
next_digit:
  loop fill_loop  
 
;  восстанаваливаю регистры 
  pop eax
  pop esi 
  pop ecx
  
  add esp, 40   ; уничтожаю локальные переменные
  
  pop ebp
  ret

END main