;boot asm it's the boot loader of Lunar
section .multiboot
align 4
  dd 0x1BADB002
  dd 0x00
  dd -(0x1BADB002 + 0x00)

section .bss
align 16

stack_bottom:
 resb 16384
 stack_top:

section .text
 global start
 extern _start

start:
 mov esp, stack_top
 call _start
 cli

.hang:
 hlt
 jmp .hang








