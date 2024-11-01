    .extern start_kernel
    .section .text.init
    .globl _start
_start:
    la sp, boot_stack_top

    call mm_init
    
    call task_init
    
    la t0, _traps
    csrw stvec, t0

    li t1, (1 << 5)
    csrs sie, t1

    rdtime t0
    li t1, 10000000
    add a0, t0, t1
    call sbi_set_timer

    li t1, (1 << 1)
    csrs sstatus, t1
    
    j start_kernel
    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 

    .globl boot_stack_top
boot_stack_top: