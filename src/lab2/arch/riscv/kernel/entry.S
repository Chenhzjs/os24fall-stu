    .extern trap_handler
    .section .text.entry
    .align 2
    .globl _traps 
    .extern dummy
    .globl __dummy
    .globl __switch_to
__switch_to:
    sd ra, 32(a0)
    sd sp, 40(a0)
    sd s0, 48(a0)
    sd s1, 56(a0)
    sd s2, 64(a0)
    sd s3, 72(a0)
    sd s4, 80(a0)
    sd s5, 88(a0)
    sd s6, 96(a0)
    sd s7, 104(a0)
    sd s8, 112(a0)
    sd s9, 120(a0)
    sd s10, 128(a0)
    sd s11, 136(a0)

    ld ra, 32(a1)
    ld sp, 40(a1)
    ld s0, 48(a1)
    ld s1, 56(a1)
    ld s2, 64(a1)
    ld s3, 72(a1)
    ld s4, 80(a1)
    ld s5, 88(a1)
    ld s6, 96(a1)
    ld s7, 104(a1)
    ld s8, 112(a1)
    ld s9, 120(a1)
    ld s10, 128(a1)
    ld s11, 136(a1)
    ret
__dummy:
    la t0, dummy
    csrw sepc, t0
    sret
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