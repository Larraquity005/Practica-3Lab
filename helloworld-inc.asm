; Hello World Program (External file include)
; Compilar con: nasm -f elf helloworld-inc.asm
; Enlazar con: ld -m elf_i386 helloworld-inc.o functions.o -o helloworld-inc
; Ejecutar con: ./helloworld-inc
 
%include        'functions.asm'      ; Incluir archivo externo

SECTION .data
msg1    db      'Hello, brave new world!', 0Ah
msg2    db      'This is how we recycle in NASM.', 0Ah

SECTION .text
global  _start

_start:

    mov     eax, msg1
    call    sprint          ; Llamar a la función para imprimir el primer mensaje

    mov     eax, msg2
    call    sprint          ; Llamar a la función para imprimir el segundo mensaje

    call    quit            ; Llamar a la función para salir del programa
