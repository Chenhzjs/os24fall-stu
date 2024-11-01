    .extern trap_handler
    .section .text.entry
    .align 2
    .globl _traps 
_traps:
    sd ra, -8(sp)
    sd gp, -16(sp)
    sd tp, -24(sp)
    sd t0, -32(sp)
    sd t1, -40(sp)
    sd t2, -48(sp)
    sd s0, -56(sp)
    sd s1, -64(sp)
    sd a0, -72(sp)
    sd a1, -80(sp)
    sd a2, -88(sp)
    sd a3, -96(sp)
    sd a4, -104(sp)
    sd a5, -112(sp)
    sd a6, -120(sp)
    sd a7, -128(sp)
    sd s2, -136(sp)
    sd s3, -144(sp)
    sd s4, -152(sp)
    sd s5, -160(sp)
    sd s6, -168(sp)
    sd s7, -176(sp)
    sd s8, -184(sp)
    sd s9, -192(sp)
    sd s10, -200(sp)
    sd s11, -208(sp)
    sd t3, -216(sp)
    sd t4, -224(sp)
    sd t5, -232(sp)
    sd t6, -240(sp)
    sd sp, -248(sp)
    addi sp, sp, -248

    csrr a0, scause
    csrr a1, sepc
    call trap_handler



    ld t6, 8(sp)
    ld t5, 16(sp)
    ld t4, 24(sp)
    ld t3, 32(sp)
    ld s11, 40(sp)
    ld s10, 48(sp)
    ld s9, 56(sp)
    ld s8, 64(sp)
    ld s7, 72(sp)
    ld s6, 80(sp)
    ld s5, 88(sp)
    ld s4, 96(sp)
    ld s3, 104(sp)
    ld s2, 112(sp)
    ld a7, 120(sp)
    ld a6, 128(sp)
    ld a5, 136(sp)
    ld a4, 144(sp)
    ld a3, 152(sp)
    ld a2, 160(sp)
    ld a1, 168(sp)
    ld a0, 176(sp)
    ld s1, 184(sp)
    ld s0, 192(sp)
    ld t2, 200(sp)
    ld t1, 208(sp)
    ld t0, 216(sp)
    ld tp, 224(sp)
    ld gp, 232(sp)
    ld ra, 240(sp)
    ld sp, 0(sp)
    
    sret