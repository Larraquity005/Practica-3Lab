                           ; Hello World Program (NULL terminating bytes)<font></font>
                            ; Compile with: nasm -f elf helloworld-inc.asm<font></font>
                            ; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-inc.o -o helloworld-inc<font></font>
                            ; Run with: ./helloworld-inc<font></font>
<font></font>
                            %include        'functions.asm'<font></font>
<font></font>
                            SECTION .data<font></font>
                            msg1    db      'Hello, brave new world!', 0Ah, 0h          ; NOTE the null terminating byte<font></font>
                            msg2    db      'This is how we recycle in NASM.', 0Ah, 0h  ; NOTE the null terminating byte<font></font>
<font></font>
                            SECTION .text<font></font>
                            global  _start<font></font>
<font></font>
                            _start:<font></font>
<font></font>
                                mov     eax, msg1<font></font>
                                call    sprint<font></font>
<font></font>
                                mov     eax, msg2<font></font>
                                call    sprint<font></font>
<font></font>
                                call    quit<font></font>
