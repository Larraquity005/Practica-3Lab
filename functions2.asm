                            ;------------------------------------------<font></font>
                            ; int slen(String message)<font></font>
                            ; String length calculation function<font></font>
                            slen:<font></font>
                                push    ebx<font></font>
                                mov     ebx, eax<font></font>
<font></font>
                            nextchar:<font></font>
                                cmp     byte [eax], 0<font></font>
                                jz      finished<font></font>
                                inc     eax<font></font>
                                jmp     nextchar<font></font>
<font></font>
                            finished:<font></font>
                                sub     eax, ebx<font></font>
                                pop     ebx<font></font>
                                ret<font></font>
<font></font>
<font></font>
                            ;------------------------------------------<font></font>
                            ; void sprint(String message)<font></font>
                            ; String printing function<font></font>
                            sprint:<font></font>
                                push    edx<font></font>
                                push    ecx<font></font>
                                push    ebx<font></font>
                                push    eax<font></font>
                                call    slen<font></font>
<font></font>
                                mov     edx, eax<font></font>
                                pop     eax<font></font>
<font></font>
                                mov     ecx, eax<font></font>
                                mov     ebx, 1<font></font>
                                mov     eax, 4<font></font>
                                int     80h<font></font>
<font></font>
                                pop     ebx<font></font>
                                pop     ecx<font></font>
                                pop     edx<font></font>
                                ret<font></font>
<font></font>
<font></font>
                            ;------------------------------------------<font></font>
                            ; void sprintLF(String message)<font></font>
                            ; String printing with line feed function<font></font>
                            sprintLF:<font></font>
                                call    sprint<font></font>
<font></font>
                                push    eax         ; push eax onto the stack to preserve it while we use the eax register in this function<font></font>
                                mov     eax, 0Ah    ; move 0Ah into eax - 0Ah is the ascii character for a linefeed<font></font>
                                                    ; as eax is 4 bytes wide, it now contains 0000000Ah<font></font>
                                push    eax         ; push the linefeed onto the stack so we can get the address<font></font>
                                                    ; given that we have a little-endian architecture, eax register bytes are stored in reverse order,<font></font>
                                                    ; this corresponds to stack memory contents of 0Ah, 0h, 0h, 0h,<font></font>
                                                    ; giving us a linefeed followed by a NULL terminating byte<font></font>
                                mov     eax, esp    ; move the address of the current stack pointer into eax for sprint<font></font>
                                call    sprint      ; call our sprint function<font></font>
                                pop     eax         ; remove our linefeed character from the stack<font></font>
                                pop     eax         ; restore the original value of eax before our function was called<font></font>
                                ret                 ; return to our program<font></font>
<font></font>
<font></font>
                            ;------------------------------------------<font></font>
                            ; void exit()<font></font>
                            ; Exit program and restore resources<font></font>
                            quit:<font></font>
                                mov     ebx, 0<font></font>
                                mov     eax, 1<font></font>
                                int     80h<font></font>
                                ret<font></font>
<font></font>
<font></font>
