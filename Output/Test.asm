
; |ax : Acumulador       |
; |bx : Registro Base    |
; |cx : Registro Contador|
; |dx : Registro de Datos|



section .data

msg db "Assemblerx86NASM",0xa,0xd,;msg tipo string db=defined byte
;msg db "A","s","s","e","m","...";msg String como lo interpreta la maquina
;msg db "0x48","0x73","0x73","0x65","...";msg Hex ASCII como realmente lo interpreta la maquina

;directiva para modificacion de datos(si modifico mi msg no debo cambiar todos los valores de mis registros)
;equ nos indica que va a ser la etiqueta y $ es el valor de centinela(la direccion de memoria(registros) ya asignados)
;el len es la etiqueta de cambio dinamico de registros de nuestro mensaje(msg)
len equ $-msg;si hay modificacion de datos en los registros, restando los mismos al centinela($), obtenemos los datos totales(ej:16bytes-12bytes=14bytes) 

section .text

	global _start

_start:


mov eax, 4 ;Con mov asignamos al registro ax con valor de escritura e (eax) que queremos escribir con el numero 4

mov ebx, 1;ahora el valor del registro anterior lo asignamos al bx para imprimir en pantalla con valor de escritura e(ebx), el 1 imprime

mov ecx, msg;ahora le indicamos al registro que es lo que queremos imprimir

mov edx, len;le indicamos a nuestro registro de datos que los datos de nuestra variable msg los trata nuestra etiqueta len(si se modifican los bytes de nuestra cadena de msg los cambia dinamicamente el len)

int 0x80;invocamos al sistema operativo


mov eax, 1 ;le decimos al sistema operativo que el programa termino de forma exitosa

int 0x80;invocamos de nuevo al S.O para ejecutar lo anterior
