
../../vmlinux:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_skernel>:
    .extern start_kernel
    .section .text.init
    .globl _start
_start:
    la sp, boot_stack_top
    80200000:	00003117          	auipc	sp,0x3
    80200004:	01013103          	ld	sp,16(sp) # 80203010 <_GLOBAL_OFFSET_TABLE_+0x8>

    la t0, _traps
    80200008:	00003297          	auipc	t0,0x3
    8020000c:	0102b283          	ld	t0,16(t0) # 80203018 <_GLOBAL_OFFSET_TABLE_+0x10>
    csrw stvec, t0
    80200010:	10529073          	csrw	stvec,t0

    li t1, (1 << 5)
    80200014:	02000313          	li	t1,32
    csrs sie, t1
    80200018:	10432073          	csrs	sie,t1

    rdtime t0
    8020001c:	c01022f3          	rdtime	t0
    li t1, 10000000
    80200020:	00989337          	lui	t1,0x989
    80200024:	6803031b          	addw	t1,t1,1664 # 989680 <_skernel-0x7f876980>
    add a0, t0, t1
    80200028:	00628533          	add	a0,t0,t1
    call sbi_set_timer
    8020002c:	394000ef          	jal	802003c0 <sbi_set_timer>

    li t1, (1 << 1)
    80200030:	00200313          	li	t1,2
    csrs sstatus, t1
    80200034:	10032073          	csrs	sstatus,t1
    
    j start_kernel
    80200038:	48c0006f          	j	802004c4 <start_kernel>

000000008020003c <_traps>:
    .extern trap_handler
    .section .text.entry
    .align 2
    .globl _traps 
_traps:
    sd ra, -8(sp)
    8020003c:	fe113c23          	sd	ra,-8(sp)
    sd gp, -16(sp)
    80200040:	fe313823          	sd	gp,-16(sp)
    sd tp, -24(sp)
    80200044:	fe413423          	sd	tp,-24(sp)
    sd t0, -32(sp)
    80200048:	fe513023          	sd	t0,-32(sp)
    sd t1, -40(sp)
    8020004c:	fc613c23          	sd	t1,-40(sp)
    sd t2, -48(sp)
    80200050:	fc713823          	sd	t2,-48(sp)
    sd s0, -56(sp)
    80200054:	fc813423          	sd	s0,-56(sp)
    sd s1, -64(sp)
    80200058:	fc913023          	sd	s1,-64(sp)
    sd a0, -72(sp)
    8020005c:	faa13c23          	sd	a0,-72(sp)
    sd a1, -80(sp)
    80200060:	fab13823          	sd	a1,-80(sp)
    sd a2, -88(sp)
    80200064:	fac13423          	sd	a2,-88(sp)
    sd a3, -96(sp)
    80200068:	fad13023          	sd	a3,-96(sp)
    sd a4, -104(sp)
    8020006c:	f8e13c23          	sd	a4,-104(sp)
    sd a5, -112(sp)
    80200070:	f8f13823          	sd	a5,-112(sp)
    sd a6, -120(sp)
    80200074:	f9013423          	sd	a6,-120(sp)
    sd a7, -128(sp)
    80200078:	f9113023          	sd	a7,-128(sp)
    sd s2, -136(sp)
    8020007c:	f7213c23          	sd	s2,-136(sp)
    sd s3, -144(sp)
    80200080:	f7313823          	sd	s3,-144(sp)
    sd s4, -152(sp)
    80200084:	f7413423          	sd	s4,-152(sp)
    sd s5, -160(sp)
    80200088:	f7513023          	sd	s5,-160(sp)
    sd s6, -168(sp)
    8020008c:	f5613c23          	sd	s6,-168(sp)
    sd s7, -176(sp)
    80200090:	f5713823          	sd	s7,-176(sp)
    sd s8, -184(sp)
    80200094:	f5813423          	sd	s8,-184(sp)
    sd s9, -192(sp)
    80200098:	f5913023          	sd	s9,-192(sp)
    sd s10, -200(sp)
    8020009c:	f3a13c23          	sd	s10,-200(sp)
    sd s11, -208(sp)
    802000a0:	f3b13823          	sd	s11,-208(sp)
    sd t3, -216(sp)
    802000a4:	f3c13423          	sd	t3,-216(sp)
    sd t4, -224(sp)
    802000a8:	f3d13023          	sd	t4,-224(sp)
    sd t5, -232(sp)
    802000ac:	f1e13c23          	sd	t5,-232(sp)
    sd t6, -240(sp)
    802000b0:	f1f13823          	sd	t6,-240(sp)
    sd sp, -248(sp)
    802000b4:	f0213423          	sd	sp,-248(sp)
    addi sp, sp, -248
    802000b8:	f0810113          	add	sp,sp,-248

    csrr a0, scause
    802000bc:	14202573          	csrr	a0,scause
    csrr a1, sepc
    802000c0:	141025f3          	csrr	a1,sepc
    call trap_handler
    802000c4:	388000ef          	jal	8020044c <trap_handler>



    ld t6, 8(sp)
    802000c8:	00813f83          	ld	t6,8(sp)
    ld t5, 16(sp)
    802000cc:	01013f03          	ld	t5,16(sp)
    ld t4, 24(sp)
    802000d0:	01813e83          	ld	t4,24(sp)
    ld t3, 32(sp)
    802000d4:	02013e03          	ld	t3,32(sp)
    ld s11, 40(sp)
    802000d8:	02813d83          	ld	s11,40(sp)
    ld s10, 48(sp)
    802000dc:	03013d03          	ld	s10,48(sp)
    ld s9, 56(sp)
    802000e0:	03813c83          	ld	s9,56(sp)
    ld s8, 64(sp)
    802000e4:	04013c03          	ld	s8,64(sp)
    ld s7, 72(sp)
    802000e8:	04813b83          	ld	s7,72(sp)
    ld s6, 80(sp)
    802000ec:	05013b03          	ld	s6,80(sp)
    ld s5, 88(sp)
    802000f0:	05813a83          	ld	s5,88(sp)
    ld s4, 96(sp)
    802000f4:	06013a03          	ld	s4,96(sp)
    ld s3, 104(sp)
    802000f8:	06813983          	ld	s3,104(sp)
    ld s2, 112(sp)
    802000fc:	07013903          	ld	s2,112(sp)
    ld a7, 120(sp)
    80200100:	07813883          	ld	a7,120(sp)
    ld a6, 128(sp)
    80200104:	08013803          	ld	a6,128(sp)
    ld a5, 136(sp)
    80200108:	08813783          	ld	a5,136(sp)
    ld a4, 144(sp)
    8020010c:	09013703          	ld	a4,144(sp)
    ld a3, 152(sp)
    80200110:	09813683          	ld	a3,152(sp)
    ld a2, 160(sp)
    80200114:	0a013603          	ld	a2,160(sp)
    ld a1, 168(sp)
    80200118:	0a813583          	ld	a1,168(sp)
    ld a0, 176(sp)
    8020011c:	0b013503          	ld	a0,176(sp)
    ld s1, 184(sp)
    80200120:	0b813483          	ld	s1,184(sp)
    ld s0, 192(sp)
    80200124:	0c013403          	ld	s0,192(sp)
    ld t2, 200(sp)
    80200128:	0c813383          	ld	t2,200(sp)
    ld t1, 208(sp)
    8020012c:	0d013303          	ld	t1,208(sp)
    ld t0, 216(sp)
    80200130:	0d813283          	ld	t0,216(sp)
    ld tp, 224(sp)
    80200134:	0e013203          	ld	tp,224(sp)
    ld gp, 232(sp)
    80200138:	0e813183          	ld	gp,232(sp)
    ld ra, 240(sp)
    8020013c:	0f013083          	ld	ra,240(sp)
    ld sp, 0(sp)
    80200140:	00013103          	ld	sp,0(sp)
    
    80200144:	10200073          	sret

0000000080200148 <get_cycles>:
#include "sbi.h"

// QEMU 中时钟的频率是 10MHz，也就是 1 秒钟相当于 10000000 个时钟周期
uint64_t TIMECLOCK = 10000000;

uint64_t get_cycles() {
    80200148:	fe010113          	add	sp,sp,-32
    8020014c:	00813c23          	sd	s0,24(sp)
    80200150:	02010413          	add	s0,sp,32
    // 编写内联汇编，使用 rdtime 获取 time 寄存器中（也就是 mtime 寄存器）的值并返回
    uint64_t mtime;
    asm volatile (
    80200154:	c01027f3          	rdtime	a5
    80200158:	fef43423          	sd	a5,-24(s0)
        "rdtime %[mtime]\n"
        : [mtime] "=r" (mtime)
        : : "memory"
    );
    return mtime;
    8020015c:	fe843783          	ld	a5,-24(s0)
}
    80200160:	00078513          	mv	a0,a5
    80200164:	01813403          	ld	s0,24(sp)
    80200168:	02010113          	add	sp,sp,32
    8020016c:	00008067          	ret

0000000080200170 <clock_set_next_event>:

void clock_set_next_event() {
    80200170:	fd010113          	add	sp,sp,-48
    80200174:	02113423          	sd	ra,40(sp)
    80200178:	02813023          	sd	s0,32(sp)
    8020017c:	03010413          	add	s0,sp,48
    // 下一次时钟中断的时间点
    uint64_t next = get_cycles() + TIMECLOCK;
    80200180:	fc9ff0ef          	jal	80200148 <get_cycles>
    80200184:	00050713          	mv	a4,a0
    80200188:	00003797          	auipc	a5,0x3
    8020018c:	e7878793          	add	a5,a5,-392 # 80203000 <TIMECLOCK>
    80200190:	0007b783          	ld	a5,0(a5)
    80200194:	00f707b3          	add	a5,a4,a5
    80200198:	fef43423          	sd	a5,-24(s0)

    // 使用 sbi_set_timer 来完成对下一次时钟中断的设置
    struct sbiret ret = sbi_set_timer(next);
    8020019c:	fe843503          	ld	a0,-24(s0)
    802001a0:	220000ef          	jal	802003c0 <sbi_set_timer>
    802001a4:	00050713          	mv	a4,a0
    802001a8:	00058793          	mv	a5,a1
    802001ac:	fce43c23          	sd	a4,-40(s0)
    802001b0:	fef43023          	sd	a5,-32(s0)
    802001b4:	00000013          	nop
    802001b8:	02813083          	ld	ra,40(sp)
    802001bc:	02013403          	ld	s0,32(sp)
    802001c0:	03010113          	add	sp,sp,48
    802001c4:	00008067          	ret

00000000802001c8 <sbi_ecall>:
#include "stdint.h"
#include "sbi.h"

struct sbiret sbi_ecall(uint64_t eid, uint64_t fid,
                        uint64_t arg0, uint64_t arg1, uint64_t arg2,
                        uint64_t arg3, uint64_t arg4, uint64_t arg5) {
    802001c8:	f8010113          	add	sp,sp,-128
    802001cc:	06813c23          	sd	s0,120(sp)
    802001d0:	08010413          	add	s0,sp,128
    802001d4:	faa43c23          	sd	a0,-72(s0)
    802001d8:	fab43823          	sd	a1,-80(s0)
    802001dc:	fac43423          	sd	a2,-88(s0)
    802001e0:	fad43023          	sd	a3,-96(s0)
    802001e4:	f8e43c23          	sd	a4,-104(s0)
    802001e8:	f8f43823          	sd	a5,-112(s0)
    802001ec:	f9043423          	sd	a6,-120(s0)
    802001f0:	f9143023          	sd	a7,-128(s0)
    struct sbiret ret;
    uint64_t error;
    uint64_t value;
    asm volatile (
    802001f4:	fb843783          	ld	a5,-72(s0)
    802001f8:	fb043703          	ld	a4,-80(s0)
    802001fc:	fa843683          	ld	a3,-88(s0)
    80200200:	fa043603          	ld	a2,-96(s0)
    80200204:	f9843583          	ld	a1,-104(s0)
    80200208:	f9043503          	ld	a0,-112(s0)
    8020020c:	f8843803          	ld	a6,-120(s0)
    80200210:	f8043883          	ld	a7,-128(s0)
    80200214:	00078893          	mv	a7,a5
    80200218:	00070813          	mv	a6,a4
    8020021c:	00068513          	mv	a0,a3
    80200220:	00060593          	mv	a1,a2
    80200224:	00058613          	mv	a2,a1
    80200228:	00050693          	mv	a3,a0
    8020022c:	00080713          	mv	a4,a6
    80200230:	00088793          	mv	a5,a7
    80200234:	00000073          	ecall
    80200238:	00050713          	mv	a4,a0
    8020023c:	00058793          	mv	a5,a1
    80200240:	fee43423          	sd	a4,-24(s0)
    80200244:	fef43023          	sd	a5,-32(s0)
        : [error] "=r" (error), [value] "=r" (value)
        : [eid] "r" (eid), [fid] "r" (fid), [arg0] "r" (arg0), [arg1] "r" (arg1), 
        [arg2] "r" (arg2), [arg3] "r" (arg3), [arg4] "r" (arg4), [arg5] "r" (arg5)
        : "memory"
    );
    ret.error = error;
    80200248:	fe843783          	ld	a5,-24(s0)
    8020024c:	fcf43023          	sd	a5,-64(s0)
    ret.value = value;
    80200250:	fe043783          	ld	a5,-32(s0)
    80200254:	fcf43423          	sd	a5,-56(s0)
    return ret;
    80200258:	fc043783          	ld	a5,-64(s0)
    8020025c:	fcf43823          	sd	a5,-48(s0)
    80200260:	fc843783          	ld	a5,-56(s0)
    80200264:	fcf43c23          	sd	a5,-40(s0)
    80200268:	fd043703          	ld	a4,-48(s0)
    8020026c:	fd843783          	ld	a5,-40(s0)
    80200270:	00070313          	mv	t1,a4
    80200274:	00078393          	mv	t2,a5
    80200278:	00030713          	mv	a4,t1
    8020027c:	00038793          	mv	a5,t2
}
    80200280:	00070513          	mv	a0,a4
    80200284:	00078593          	mv	a1,a5
    80200288:	07813403          	ld	s0,120(sp)
    8020028c:	08010113          	add	sp,sp,128
    80200290:	00008067          	ret

0000000080200294 <sbi_debug_console_write_byte>:

struct sbiret sbi_debug_console_write_byte(uint8_t byte) {
    80200294:	fc010113          	add	sp,sp,-64
    80200298:	02113c23          	sd	ra,56(sp)
    8020029c:	02813823          	sd	s0,48(sp)
    802002a0:	03213423          	sd	s2,40(sp)
    802002a4:	03313023          	sd	s3,32(sp)
    802002a8:	04010413          	add	s0,sp,64
    802002ac:	00050793          	mv	a5,a0
    802002b0:	fcf407a3          	sb	a5,-49(s0)
    return sbi_ecall(0x4442434e, 0x2, byte, 0, 0, 0, 0, 0);	
    802002b4:	fcf44603          	lbu	a2,-49(s0)
    802002b8:	00000893          	li	a7,0
    802002bc:	00000813          	li	a6,0
    802002c0:	00000793          	li	a5,0
    802002c4:	00000713          	li	a4,0
    802002c8:	00000693          	li	a3,0
    802002cc:	00200593          	li	a1,2
    802002d0:	44424537          	lui	a0,0x44424
    802002d4:	34e50513          	add	a0,a0,846 # 4442434e <_skernel-0x3bddbcb2>
    802002d8:	ef1ff0ef          	jal	802001c8 <sbi_ecall>
    802002dc:	00050713          	mv	a4,a0
    802002e0:	00058793          	mv	a5,a1
    802002e4:	fce43823          	sd	a4,-48(s0)
    802002e8:	fcf43c23          	sd	a5,-40(s0)
    802002ec:	fd043703          	ld	a4,-48(s0)
    802002f0:	fd843783          	ld	a5,-40(s0)
    802002f4:	00070913          	mv	s2,a4
    802002f8:	00078993          	mv	s3,a5
    802002fc:	00090713          	mv	a4,s2
    80200300:	00098793          	mv	a5,s3
}
    80200304:	00070513          	mv	a0,a4
    80200308:	00078593          	mv	a1,a5
    8020030c:	03813083          	ld	ra,56(sp)
    80200310:	03013403          	ld	s0,48(sp)
    80200314:	02813903          	ld	s2,40(sp)
    80200318:	02013983          	ld	s3,32(sp)
    8020031c:	04010113          	add	sp,sp,64
    80200320:	00008067          	ret

0000000080200324 <sbi_system_reset>:

struct sbiret sbi_system_reset(uint32_t reset_type, uint32_t reset_reason) {
    80200324:	fc010113          	add	sp,sp,-64
    80200328:	02113c23          	sd	ra,56(sp)
    8020032c:	02813823          	sd	s0,48(sp)
    80200330:	03213423          	sd	s2,40(sp)
    80200334:	03313023          	sd	s3,32(sp)
    80200338:	04010413          	add	s0,sp,64
    8020033c:	00050793          	mv	a5,a0
    80200340:	00058713          	mv	a4,a1
    80200344:	fcf42623          	sw	a5,-52(s0)
    80200348:	00070793          	mv	a5,a4
    8020034c:	fcf42423          	sw	a5,-56(s0)
    return sbi_ecall(0x53525354, 0x0, reset_type, reset_reason, 0, 0, 0, 0);
    80200350:	fcc46603          	lwu	a2,-52(s0)
    80200354:	fc846683          	lwu	a3,-56(s0)
    80200358:	00000893          	li	a7,0
    8020035c:	00000813          	li	a6,0
    80200360:	00000793          	li	a5,0
    80200364:	00000713          	li	a4,0
    80200368:	00000593          	li	a1,0
    8020036c:	53525537          	lui	a0,0x53525
    80200370:	35450513          	add	a0,a0,852 # 53525354 <_skernel-0x2ccdacac>
    80200374:	e55ff0ef          	jal	802001c8 <sbi_ecall>
    80200378:	00050713          	mv	a4,a0
    8020037c:	00058793          	mv	a5,a1
    80200380:	fce43823          	sd	a4,-48(s0)
    80200384:	fcf43c23          	sd	a5,-40(s0)
    80200388:	fd043703          	ld	a4,-48(s0)
    8020038c:	fd843783          	ld	a5,-40(s0)
    80200390:	00070913          	mv	s2,a4
    80200394:	00078993          	mv	s3,a5
    80200398:	00090713          	mv	a4,s2
    8020039c:	00098793          	mv	a5,s3
}
    802003a0:	00070513          	mv	a0,a4
    802003a4:	00078593          	mv	a1,a5
    802003a8:	03813083          	ld	ra,56(sp)
    802003ac:	03013403          	ld	s0,48(sp)
    802003b0:	02813903          	ld	s2,40(sp)
    802003b4:	02013983          	ld	s3,32(sp)
    802003b8:	04010113          	add	sp,sp,64
    802003bc:	00008067          	ret

00000000802003c0 <sbi_set_timer>:
struct sbiret sbi_set_timer(uint64_t stime_value) {
    802003c0:	fc010113          	add	sp,sp,-64
    802003c4:	02113c23          	sd	ra,56(sp)
    802003c8:	02813823          	sd	s0,48(sp)
    802003cc:	03213423          	sd	s2,40(sp)
    802003d0:	03313023          	sd	s3,32(sp)
    802003d4:	04010413          	add	s0,sp,64
    802003d8:	fca43423          	sd	a0,-56(s0)
    return sbi_ecall(0x54494d45, 0x0, stime_value, 0, 0, 0, 0, 0);
    802003dc:	00000893          	li	a7,0
    802003e0:	00000813          	li	a6,0
    802003e4:	00000793          	li	a5,0
    802003e8:	00000713          	li	a4,0
    802003ec:	00000693          	li	a3,0
    802003f0:	fc843603          	ld	a2,-56(s0)
    802003f4:	00000593          	li	a1,0
    802003f8:	54495537          	lui	a0,0x54495
    802003fc:	d4550513          	add	a0,a0,-699 # 54494d45 <_skernel-0x2bd6b2bb>
    80200400:	dc9ff0ef          	jal	802001c8 <sbi_ecall>
    80200404:	00050713          	mv	a4,a0
    80200408:	00058793          	mv	a5,a1
    8020040c:	fce43823          	sd	a4,-48(s0)
    80200410:	fcf43c23          	sd	a5,-40(s0)
    80200414:	fd043703          	ld	a4,-48(s0)
    80200418:	fd843783          	ld	a5,-40(s0)
    8020041c:	00070913          	mv	s2,a4
    80200420:	00078993          	mv	s3,a5
    80200424:	00090713          	mv	a4,s2
    80200428:	00098793          	mv	a5,s3
    8020042c:	00070513          	mv	a0,a4
    80200430:	00078593          	mv	a1,a5
    80200434:	03813083          	ld	ra,56(sp)
    80200438:	03013403          	ld	s0,48(sp)
    8020043c:	02813903          	ld	s2,40(sp)
    80200440:	02013983          	ld	s3,32(sp)
    80200444:	04010113          	add	sp,sp,64
    80200448:	00008067          	ret

000000008020044c <trap_handler>:
#include "stdint.h"
#include "printk.h"
#include "clock.h"
void trap_handler(uint64_t scause, uint64_t sepc) {
    8020044c:	fe010113          	add	sp,sp,-32
    80200450:	00113c23          	sd	ra,24(sp)
    80200454:	00813823          	sd	s0,16(sp)
    80200458:	02010413          	add	s0,sp,32
    8020045c:	fea43423          	sd	a0,-24(s0)
    80200460:	feb43023          	sd	a1,-32(s0)
    // 通过 `scause` 判断 trap 类型
    // 如果是 interrupt 判断是否是 timer interrupt
    // 如果是 timer interrupt 则打印输出相关信息，并通过 `clock_set_next_event()` 设置下一次时钟中断
    // `clock_set_next_event()` 见 4.3.4 节
    // 其他 interrupt / exception 可以直接忽略，推荐打印出来供以后调试
    if (scause >> 63 == 1) {
    80200464:	fe843783          	ld	a5,-24(s0)
    80200468:	03f7d713          	srl	a4,a5,0x3f
    8020046c:	00100793          	li	a5,1
    80200470:	04f71063          	bne	a4,a5,802004b0 <trap_handler+0x64>
        // printk("%x %x\n", scause, scause & 0x7fffffffffffffff);
        if ((scause & 0x7fffffffffffffff) == 5) {
    80200474:	fe843703          	ld	a4,-24(s0)
    80200478:	fff00793          	li	a5,-1
    8020047c:	0017d793          	srl	a5,a5,0x1
    80200480:	00f77733          	and	a4,a4,a5
    80200484:	00500793          	li	a5,5
    80200488:	00f71c63          	bne	a4,a5,802004a0 <trap_handler+0x54>
            printk("[S] Supervisor Mode Timer Interrupt\n");
    8020048c:	00002517          	auipc	a0,0x2
    80200490:	b7450513          	add	a0,a0,-1164 # 80202000 <_srodata>
    80200494:	7d1000ef          	jal	80201464 <printk>
            clock_set_next_event();
    80200498:	cd9ff0ef          	jal	80200170 <clock_set_next_event>
            printk("Other Interrupt\n");
            clock_set_next_event();
        }
    }

    8020049c:	0140006f          	j	802004b0 <trap_handler+0x64>
            printk("Other Interrupt\n");
    802004a0:	00002517          	auipc	a0,0x2
    802004a4:	b8850513          	add	a0,a0,-1144 # 80202028 <_srodata+0x28>
    802004a8:	7bd000ef          	jal	80201464 <printk>
            clock_set_next_event();
    802004ac:	cc5ff0ef          	jal	80200170 <clock_set_next_event>
    802004b0:	00000013          	nop
    802004b4:	01813083          	ld	ra,24(sp)
    802004b8:	01013403          	ld	s0,16(sp)
    802004bc:	02010113          	add	sp,sp,32
    802004c0:	00008067          	ret

00000000802004c4 <start_kernel>:
#include "printk.h"
#include "defs.h"
extern void test();

int start_kernel() {
    802004c4:	fb010113          	add	sp,sp,-80
    802004c8:	04113423          	sd	ra,72(sp)
    802004cc:	04813023          	sd	s0,64(sp)
    802004d0:	05010413          	add	s0,sp,80
    printk("2024");
    802004d4:	00002517          	auipc	a0,0x2
    802004d8:	b6c50513          	add	a0,a0,-1172 # 80202040 <_srodata+0x40>
    802004dc:	789000ef          	jal	80201464 <printk>
    printk(" ZJU Operating System\n");
    802004e0:	00002517          	auipc	a0,0x2
    802004e4:	b6850513          	add	a0,a0,-1176 # 80202048 <_srodata+0x48>
    802004e8:	77d000ef          	jal	80201464 <printk>
    uint64_t sstatus_val = csr_read(sstatus);
    802004ec:	100027f3          	csrr	a5,sstatus
    802004f0:	fef43423          	sd	a5,-24(s0)
    802004f4:	fe843783          	ld	a5,-24(s0)
    802004f8:	fef43023          	sd	a5,-32(s0)
    printk("sstatus = %x\n", sstatus_val);
    802004fc:	fe043583          	ld	a1,-32(s0)
    80200500:	00002517          	auipc	a0,0x2
    80200504:	b6050513          	add	a0,a0,-1184 # 80202060 <_srodata+0x60>
    80200508:	75d000ef          	jal	80201464 <printk>

    uint64_t sscratch_val_read = csr_read(sscratch);
    8020050c:	140027f3          	csrr	a5,sscratch
    80200510:	fcf43c23          	sd	a5,-40(s0)
    80200514:	fd843783          	ld	a5,-40(s0)
    80200518:	fcf43823          	sd	a5,-48(s0)
    printk("before write sscratch = %x\n", sscratch_val_read);
    8020051c:	fd043583          	ld	a1,-48(s0)
    80200520:	00002517          	auipc	a0,0x2
    80200524:	b5050513          	add	a0,a0,-1200 # 80202070 <_srodata+0x70>
    80200528:	73d000ef          	jal	80201464 <printk>

    uint64_t sscratch_val = 9;
    8020052c:	00900793          	li	a5,9
    80200530:	fcf43423          	sd	a5,-56(s0)
    csr_write(sscratch, sscratch_val);
    80200534:	fc843783          	ld	a5,-56(s0)
    80200538:	fcf43023          	sd	a5,-64(s0)
    8020053c:	fc043783          	ld	a5,-64(s0)
    80200540:	14079073          	csrw	sscratch,a5
    sscratch_val_read = csr_read(sscratch);
    80200544:	140027f3          	csrr	a5,sscratch
    80200548:	faf43c23          	sd	a5,-72(s0)
    8020054c:	fb843783          	ld	a5,-72(s0)
    80200550:	fcf43823          	sd	a5,-48(s0)
    printk("after write sscratch = %x\n", sscratch_val_read);
    80200554:	fd043583          	ld	a1,-48(s0)
    80200558:	00002517          	auipc	a0,0x2
    8020055c:	b3850513          	add	a0,a0,-1224 # 80202090 <_srodata+0x90>
    80200560:	705000ef          	jal	80201464 <printk>
    test();
    80200564:	01c000ef          	jal	80200580 <test>
    return 0;
    80200568:	00000793          	li	a5,0
}
    8020056c:	00078513          	mv	a0,a5
    80200570:	04813083          	ld	ra,72(sp)
    80200574:	04013403          	ld	s0,64(sp)
    80200578:	05010113          	add	sp,sp,80
    8020057c:	00008067          	ret

0000000080200580 <test>:
#include "printk.h"

void test() {
    80200580:	fe010113          	add	sp,sp,-32
    80200584:	00113c23          	sd	ra,24(sp)
    80200588:	00813823          	sd	s0,16(sp)
    8020058c:	02010413          	add	s0,sp,32
    int i = 0;
    80200590:	fe042623          	sw	zero,-20(s0)
    // int t = 0;
    while (1) {
        if ((++i) % 200000000 == 0) {
    80200594:	fec42783          	lw	a5,-20(s0)
    80200598:	0017879b          	addw	a5,a5,1
    8020059c:	fef42623          	sw	a5,-20(s0)
    802005a0:	fec42783          	lw	a5,-20(s0)
    802005a4:	00078713          	mv	a4,a5
    802005a8:	0bebc7b7          	lui	a5,0xbebc
    802005ac:	2007879b          	addw	a5,a5,512 # bebc200 <_skernel-0x74343e00>
    802005b0:	02f767bb          	remw	a5,a4,a5
    802005b4:	0007879b          	sext.w	a5,a5
    802005b8:	fc079ee3          	bnez	a5,80200594 <test+0x14>
            printk("kernel is running!\n");
    802005bc:	00002517          	auipc	a0,0x2
    802005c0:	af450513          	add	a0,a0,-1292 # 802020b0 <_srodata+0xb0>
    802005c4:	6a1000ef          	jal	80201464 <printk>
            i = 0;
    802005c8:	fe042623          	sw	zero,-20(s0)
        if ((++i) % 200000000 == 0) {
    802005cc:	fc9ff06f          	j	80200594 <test+0x14>

00000000802005d0 <putc>:
// credit: 45gfg9 <45gfg9@45gfg9.net>

#include "printk.h"
#include "sbi.h"

int putc(int c) {
    802005d0:	fe010113          	add	sp,sp,-32
    802005d4:	00113c23          	sd	ra,24(sp)
    802005d8:	00813823          	sd	s0,16(sp)
    802005dc:	02010413          	add	s0,sp,32
    802005e0:	00050793          	mv	a5,a0
    802005e4:	fef42623          	sw	a5,-20(s0)
    sbi_debug_console_write_byte(c);
    802005e8:	fec42783          	lw	a5,-20(s0)
    802005ec:	0ff7f793          	zext.b	a5,a5
    802005f0:	00078513          	mv	a0,a5
    802005f4:	ca1ff0ef          	jal	80200294 <sbi_debug_console_write_byte>
    return (char)c;
    802005f8:	fec42783          	lw	a5,-20(s0)
    802005fc:	0ff7f793          	zext.b	a5,a5
    80200600:	0007879b          	sext.w	a5,a5
}
    80200604:	00078513          	mv	a0,a5
    80200608:	01813083          	ld	ra,24(sp)
    8020060c:	01013403          	ld	s0,16(sp)
    80200610:	02010113          	add	sp,sp,32
    80200614:	00008067          	ret

0000000080200618 <isspace>:
    bool sign;
    int width;
    int prec;
};

int isspace(int c) {
    80200618:	fe010113          	add	sp,sp,-32
    8020061c:	00813c23          	sd	s0,24(sp)
    80200620:	02010413          	add	s0,sp,32
    80200624:	00050793          	mv	a5,a0
    80200628:	fef42623          	sw	a5,-20(s0)
    return c == ' ' || (c >= '\t' && c <= '\r');
    8020062c:	fec42783          	lw	a5,-20(s0)
    80200630:	0007871b          	sext.w	a4,a5
    80200634:	02000793          	li	a5,32
    80200638:	02f70263          	beq	a4,a5,8020065c <isspace+0x44>
    8020063c:	fec42783          	lw	a5,-20(s0)
    80200640:	0007871b          	sext.w	a4,a5
    80200644:	00800793          	li	a5,8
    80200648:	00e7de63          	bge	a5,a4,80200664 <isspace+0x4c>
    8020064c:	fec42783          	lw	a5,-20(s0)
    80200650:	0007871b          	sext.w	a4,a5
    80200654:	00d00793          	li	a5,13
    80200658:	00e7c663          	blt	a5,a4,80200664 <isspace+0x4c>
    8020065c:	00100793          	li	a5,1
    80200660:	0080006f          	j	80200668 <isspace+0x50>
    80200664:	00000793          	li	a5,0
}
    80200668:	00078513          	mv	a0,a5
    8020066c:	01813403          	ld	s0,24(sp)
    80200670:	02010113          	add	sp,sp,32
    80200674:	00008067          	ret

0000000080200678 <strtol>:

long strtol(const char *restrict nptr, char **restrict endptr, int base) {
    80200678:	fb010113          	add	sp,sp,-80
    8020067c:	04113423          	sd	ra,72(sp)
    80200680:	04813023          	sd	s0,64(sp)
    80200684:	05010413          	add	s0,sp,80
    80200688:	fca43423          	sd	a0,-56(s0)
    8020068c:	fcb43023          	sd	a1,-64(s0)
    80200690:	00060793          	mv	a5,a2
    80200694:	faf42e23          	sw	a5,-68(s0)
    long ret = 0;
    80200698:	fe043423          	sd	zero,-24(s0)
    bool neg = false;
    8020069c:	fe0403a3          	sb	zero,-25(s0)
    const char *p = nptr;
    802006a0:	fc843783          	ld	a5,-56(s0)
    802006a4:	fcf43c23          	sd	a5,-40(s0)

    while (isspace(*p)) {
    802006a8:	0100006f          	j	802006b8 <strtol+0x40>
        p++;
    802006ac:	fd843783          	ld	a5,-40(s0)
    802006b0:	00178793          	add	a5,a5,1
    802006b4:	fcf43c23          	sd	a5,-40(s0)
    while (isspace(*p)) {
    802006b8:	fd843783          	ld	a5,-40(s0)
    802006bc:	0007c783          	lbu	a5,0(a5)
    802006c0:	0007879b          	sext.w	a5,a5
    802006c4:	00078513          	mv	a0,a5
    802006c8:	f51ff0ef          	jal	80200618 <isspace>
    802006cc:	00050793          	mv	a5,a0
    802006d0:	fc079ee3          	bnez	a5,802006ac <strtol+0x34>
    }

    if (*p == '-') {
    802006d4:	fd843783          	ld	a5,-40(s0)
    802006d8:	0007c783          	lbu	a5,0(a5)
    802006dc:	00078713          	mv	a4,a5
    802006e0:	02d00793          	li	a5,45
    802006e4:	00f71e63          	bne	a4,a5,80200700 <strtol+0x88>
        neg = true;
    802006e8:	00100793          	li	a5,1
    802006ec:	fef403a3          	sb	a5,-25(s0)
        p++;
    802006f0:	fd843783          	ld	a5,-40(s0)
    802006f4:	00178793          	add	a5,a5,1
    802006f8:	fcf43c23          	sd	a5,-40(s0)
    802006fc:	0240006f          	j	80200720 <strtol+0xa8>
    } else if (*p == '+') {
    80200700:	fd843783          	ld	a5,-40(s0)
    80200704:	0007c783          	lbu	a5,0(a5)
    80200708:	00078713          	mv	a4,a5
    8020070c:	02b00793          	li	a5,43
    80200710:	00f71863          	bne	a4,a5,80200720 <strtol+0xa8>
        p++;
    80200714:	fd843783          	ld	a5,-40(s0)
    80200718:	00178793          	add	a5,a5,1
    8020071c:	fcf43c23          	sd	a5,-40(s0)
    }

    if (base == 0) {
    80200720:	fbc42783          	lw	a5,-68(s0)
    80200724:	0007879b          	sext.w	a5,a5
    80200728:	06079c63          	bnez	a5,802007a0 <strtol+0x128>
        if (*p == '0') {
    8020072c:	fd843783          	ld	a5,-40(s0)
    80200730:	0007c783          	lbu	a5,0(a5)
    80200734:	00078713          	mv	a4,a5
    80200738:	03000793          	li	a5,48
    8020073c:	04f71e63          	bne	a4,a5,80200798 <strtol+0x120>
            p++;
    80200740:	fd843783          	ld	a5,-40(s0)
    80200744:	00178793          	add	a5,a5,1
    80200748:	fcf43c23          	sd	a5,-40(s0)
            if (*p == 'x' || *p == 'X') {
    8020074c:	fd843783          	ld	a5,-40(s0)
    80200750:	0007c783          	lbu	a5,0(a5)
    80200754:	00078713          	mv	a4,a5
    80200758:	07800793          	li	a5,120
    8020075c:	00f70c63          	beq	a4,a5,80200774 <strtol+0xfc>
    80200760:	fd843783          	ld	a5,-40(s0)
    80200764:	0007c783          	lbu	a5,0(a5)
    80200768:	00078713          	mv	a4,a5
    8020076c:	05800793          	li	a5,88
    80200770:	00f71e63          	bne	a4,a5,8020078c <strtol+0x114>
                base = 16;
    80200774:	01000793          	li	a5,16
    80200778:	faf42e23          	sw	a5,-68(s0)
                p++;
    8020077c:	fd843783          	ld	a5,-40(s0)
    80200780:	00178793          	add	a5,a5,1
    80200784:	fcf43c23          	sd	a5,-40(s0)
    80200788:	0180006f          	j	802007a0 <strtol+0x128>
            } else {
                base = 8;
    8020078c:	00800793          	li	a5,8
    80200790:	faf42e23          	sw	a5,-68(s0)
    80200794:	00c0006f          	j	802007a0 <strtol+0x128>
            }
        } else {
            base = 10;
    80200798:	00a00793          	li	a5,10
    8020079c:	faf42e23          	sw	a5,-68(s0)
        }
    }

    while (1) {
        int digit;
        if (*p >= '0' && *p <= '9') {
    802007a0:	fd843783          	ld	a5,-40(s0)
    802007a4:	0007c783          	lbu	a5,0(a5)
    802007a8:	00078713          	mv	a4,a5
    802007ac:	02f00793          	li	a5,47
    802007b0:	02e7f863          	bgeu	a5,a4,802007e0 <strtol+0x168>
    802007b4:	fd843783          	ld	a5,-40(s0)
    802007b8:	0007c783          	lbu	a5,0(a5)
    802007bc:	00078713          	mv	a4,a5
    802007c0:	03900793          	li	a5,57
    802007c4:	00e7ee63          	bltu	a5,a4,802007e0 <strtol+0x168>
            digit = *p - '0';
    802007c8:	fd843783          	ld	a5,-40(s0)
    802007cc:	0007c783          	lbu	a5,0(a5)
    802007d0:	0007879b          	sext.w	a5,a5
    802007d4:	fd07879b          	addw	a5,a5,-48
    802007d8:	fcf42a23          	sw	a5,-44(s0)
    802007dc:	0800006f          	j	8020085c <strtol+0x1e4>
        } else if (*p >= 'a' && *p <= 'z') {
    802007e0:	fd843783          	ld	a5,-40(s0)
    802007e4:	0007c783          	lbu	a5,0(a5)
    802007e8:	00078713          	mv	a4,a5
    802007ec:	06000793          	li	a5,96
    802007f0:	02e7f863          	bgeu	a5,a4,80200820 <strtol+0x1a8>
    802007f4:	fd843783          	ld	a5,-40(s0)
    802007f8:	0007c783          	lbu	a5,0(a5)
    802007fc:	00078713          	mv	a4,a5
    80200800:	07a00793          	li	a5,122
    80200804:	00e7ee63          	bltu	a5,a4,80200820 <strtol+0x1a8>
            digit = *p - ('a' - 10);
    80200808:	fd843783          	ld	a5,-40(s0)
    8020080c:	0007c783          	lbu	a5,0(a5)
    80200810:	0007879b          	sext.w	a5,a5
    80200814:	fa97879b          	addw	a5,a5,-87
    80200818:	fcf42a23          	sw	a5,-44(s0)
    8020081c:	0400006f          	j	8020085c <strtol+0x1e4>
        } else if (*p >= 'A' && *p <= 'Z') {
    80200820:	fd843783          	ld	a5,-40(s0)
    80200824:	0007c783          	lbu	a5,0(a5)
    80200828:	00078713          	mv	a4,a5
    8020082c:	04000793          	li	a5,64
    80200830:	06e7f863          	bgeu	a5,a4,802008a0 <strtol+0x228>
    80200834:	fd843783          	ld	a5,-40(s0)
    80200838:	0007c783          	lbu	a5,0(a5)
    8020083c:	00078713          	mv	a4,a5
    80200840:	05a00793          	li	a5,90
    80200844:	04e7ee63          	bltu	a5,a4,802008a0 <strtol+0x228>
            digit = *p - ('A' - 10);
    80200848:	fd843783          	ld	a5,-40(s0)
    8020084c:	0007c783          	lbu	a5,0(a5)
    80200850:	0007879b          	sext.w	a5,a5
    80200854:	fc97879b          	addw	a5,a5,-55
    80200858:	fcf42a23          	sw	a5,-44(s0)
        } else {
            break;
        }

        if (digit >= base) {
    8020085c:	fd442783          	lw	a5,-44(s0)
    80200860:	00078713          	mv	a4,a5
    80200864:	fbc42783          	lw	a5,-68(s0)
    80200868:	0007071b          	sext.w	a4,a4
    8020086c:	0007879b          	sext.w	a5,a5
    80200870:	02f75663          	bge	a4,a5,8020089c <strtol+0x224>
            break;
        }

        ret = ret * base + digit;
    80200874:	fbc42703          	lw	a4,-68(s0)
    80200878:	fe843783          	ld	a5,-24(s0)
    8020087c:	02f70733          	mul	a4,a4,a5
    80200880:	fd442783          	lw	a5,-44(s0)
    80200884:	00f707b3          	add	a5,a4,a5
    80200888:	fef43423          	sd	a5,-24(s0)
        p++;
    8020088c:	fd843783          	ld	a5,-40(s0)
    80200890:	00178793          	add	a5,a5,1
    80200894:	fcf43c23          	sd	a5,-40(s0)
    while (1) {
    80200898:	f09ff06f          	j	802007a0 <strtol+0x128>
            break;
    8020089c:	00000013          	nop
    }

    if (endptr) {
    802008a0:	fc043783          	ld	a5,-64(s0)
    802008a4:	00078863          	beqz	a5,802008b4 <strtol+0x23c>
        *endptr = (char *)p;
    802008a8:	fc043783          	ld	a5,-64(s0)
    802008ac:	fd843703          	ld	a4,-40(s0)
    802008b0:	00e7b023          	sd	a4,0(a5)
    }

    return neg ? -ret : ret;
    802008b4:	fe744783          	lbu	a5,-25(s0)
    802008b8:	0ff7f793          	zext.b	a5,a5
    802008bc:	00078863          	beqz	a5,802008cc <strtol+0x254>
    802008c0:	fe843783          	ld	a5,-24(s0)
    802008c4:	40f007b3          	neg	a5,a5
    802008c8:	0080006f          	j	802008d0 <strtol+0x258>
    802008cc:	fe843783          	ld	a5,-24(s0)
}
    802008d0:	00078513          	mv	a0,a5
    802008d4:	04813083          	ld	ra,72(sp)
    802008d8:	04013403          	ld	s0,64(sp)
    802008dc:	05010113          	add	sp,sp,80
    802008e0:	00008067          	ret

00000000802008e4 <puts_wo_nl>:

// puts without newline
static int puts_wo_nl(int (*putch)(int), const char *s) {
    802008e4:	fd010113          	add	sp,sp,-48
    802008e8:	02113423          	sd	ra,40(sp)
    802008ec:	02813023          	sd	s0,32(sp)
    802008f0:	03010413          	add	s0,sp,48
    802008f4:	fca43c23          	sd	a0,-40(s0)
    802008f8:	fcb43823          	sd	a1,-48(s0)
    if (!s) {
    802008fc:	fd043783          	ld	a5,-48(s0)
    80200900:	00079863          	bnez	a5,80200910 <puts_wo_nl+0x2c>
        s = "(null)";
    80200904:	00001797          	auipc	a5,0x1
    80200908:	7c478793          	add	a5,a5,1988 # 802020c8 <_srodata+0xc8>
    8020090c:	fcf43823          	sd	a5,-48(s0)
    }
    const char *p = s;
    80200910:	fd043783          	ld	a5,-48(s0)
    80200914:	fef43423          	sd	a5,-24(s0)
    while (*p) {
    80200918:	0240006f          	j	8020093c <puts_wo_nl+0x58>
        putch(*p++);
    8020091c:	fe843783          	ld	a5,-24(s0)
    80200920:	00178713          	add	a4,a5,1
    80200924:	fee43423          	sd	a4,-24(s0)
    80200928:	0007c783          	lbu	a5,0(a5)
    8020092c:	0007871b          	sext.w	a4,a5
    80200930:	fd843783          	ld	a5,-40(s0)
    80200934:	00070513          	mv	a0,a4
    80200938:	000780e7          	jalr	a5
    while (*p) {
    8020093c:	fe843783          	ld	a5,-24(s0)
    80200940:	0007c783          	lbu	a5,0(a5)
    80200944:	fc079ce3          	bnez	a5,8020091c <puts_wo_nl+0x38>
    }
    return p - s;
    80200948:	fe843703          	ld	a4,-24(s0)
    8020094c:	fd043783          	ld	a5,-48(s0)
    80200950:	40f707b3          	sub	a5,a4,a5
    80200954:	0007879b          	sext.w	a5,a5
}
    80200958:	00078513          	mv	a0,a5
    8020095c:	02813083          	ld	ra,40(sp)
    80200960:	02013403          	ld	s0,32(sp)
    80200964:	03010113          	add	sp,sp,48
    80200968:	00008067          	ret

000000008020096c <print_dec_int>:

static int print_dec_int(int (*putch)(int), unsigned long num, bool is_signed, struct fmt_flags *flags) {
    8020096c:	f9010113          	add	sp,sp,-112
    80200970:	06113423          	sd	ra,104(sp)
    80200974:	06813023          	sd	s0,96(sp)
    80200978:	07010413          	add	s0,sp,112
    8020097c:	faa43423          	sd	a0,-88(s0)
    80200980:	fab43023          	sd	a1,-96(s0)
    80200984:	00060793          	mv	a5,a2
    80200988:	f8d43823          	sd	a3,-112(s0)
    8020098c:	f8f40fa3          	sb	a5,-97(s0)
    if (is_signed && num == 0x8000000000000000UL) {
    80200990:	f9f44783          	lbu	a5,-97(s0)
    80200994:	0ff7f793          	zext.b	a5,a5
    80200998:	02078663          	beqz	a5,802009c4 <print_dec_int+0x58>
    8020099c:	fa043703          	ld	a4,-96(s0)
    802009a0:	fff00793          	li	a5,-1
    802009a4:	03f79793          	sll	a5,a5,0x3f
    802009a8:	00f71e63          	bne	a4,a5,802009c4 <print_dec_int+0x58>
        // special case for 0x8000000000000000
        return puts_wo_nl(putch, "-9223372036854775808");
    802009ac:	00001597          	auipc	a1,0x1
    802009b0:	72458593          	add	a1,a1,1828 # 802020d0 <_srodata+0xd0>
    802009b4:	fa843503          	ld	a0,-88(s0)
    802009b8:	f2dff0ef          	jal	802008e4 <puts_wo_nl>
    802009bc:	00050793          	mv	a5,a0
    802009c0:	2a00006f          	j	80200c60 <print_dec_int+0x2f4>
    }

    if (flags->prec == 0 && num == 0) {
    802009c4:	f9043783          	ld	a5,-112(s0)
    802009c8:	00c7a783          	lw	a5,12(a5)
    802009cc:	00079a63          	bnez	a5,802009e0 <print_dec_int+0x74>
    802009d0:	fa043783          	ld	a5,-96(s0)
    802009d4:	00079663          	bnez	a5,802009e0 <print_dec_int+0x74>
        return 0;
    802009d8:	00000793          	li	a5,0
    802009dc:	2840006f          	j	80200c60 <print_dec_int+0x2f4>
    }

    bool neg = false;
    802009e0:	fe0407a3          	sb	zero,-17(s0)

    if (is_signed && (long)num < 0) {
    802009e4:	f9f44783          	lbu	a5,-97(s0)
    802009e8:	0ff7f793          	zext.b	a5,a5
    802009ec:	02078063          	beqz	a5,80200a0c <print_dec_int+0xa0>
    802009f0:	fa043783          	ld	a5,-96(s0)
    802009f4:	0007dc63          	bgez	a5,80200a0c <print_dec_int+0xa0>
        neg = true;
    802009f8:	00100793          	li	a5,1
    802009fc:	fef407a3          	sb	a5,-17(s0)
        num = -num;
    80200a00:	fa043783          	ld	a5,-96(s0)
    80200a04:	40f007b3          	neg	a5,a5
    80200a08:	faf43023          	sd	a5,-96(s0)
    }

    char buf[20];
    int decdigits = 0;
    80200a0c:	fe042423          	sw	zero,-24(s0)

    bool has_sign_char = is_signed && (neg || flags->sign || flags->spaceflag);
    80200a10:	f9f44783          	lbu	a5,-97(s0)
    80200a14:	0ff7f793          	zext.b	a5,a5
    80200a18:	02078863          	beqz	a5,80200a48 <print_dec_int+0xdc>
    80200a1c:	fef44783          	lbu	a5,-17(s0)
    80200a20:	0ff7f793          	zext.b	a5,a5
    80200a24:	00079e63          	bnez	a5,80200a40 <print_dec_int+0xd4>
    80200a28:	f9043783          	ld	a5,-112(s0)
    80200a2c:	0057c783          	lbu	a5,5(a5)
    80200a30:	00079863          	bnez	a5,80200a40 <print_dec_int+0xd4>
    80200a34:	f9043783          	ld	a5,-112(s0)
    80200a38:	0047c783          	lbu	a5,4(a5)
    80200a3c:	00078663          	beqz	a5,80200a48 <print_dec_int+0xdc>
    80200a40:	00100793          	li	a5,1
    80200a44:	0080006f          	j	80200a4c <print_dec_int+0xe0>
    80200a48:	00000793          	li	a5,0
    80200a4c:	fcf40ba3          	sb	a5,-41(s0)
    80200a50:	fd744783          	lbu	a5,-41(s0)
    80200a54:	0017f793          	and	a5,a5,1
    80200a58:	fcf40ba3          	sb	a5,-41(s0)

    do {
        buf[decdigits++] = num % 10 + '0';
    80200a5c:	fa043703          	ld	a4,-96(s0)
    80200a60:	00a00793          	li	a5,10
    80200a64:	02f777b3          	remu	a5,a4,a5
    80200a68:	0ff7f713          	zext.b	a4,a5
    80200a6c:	fe842783          	lw	a5,-24(s0)
    80200a70:	0017869b          	addw	a3,a5,1
    80200a74:	fed42423          	sw	a3,-24(s0)
    80200a78:	0307071b          	addw	a4,a4,48
    80200a7c:	0ff77713          	zext.b	a4,a4
    80200a80:	ff078793          	add	a5,a5,-16
    80200a84:	008787b3          	add	a5,a5,s0
    80200a88:	fce78423          	sb	a4,-56(a5)
        num /= 10;
    80200a8c:	fa043703          	ld	a4,-96(s0)
    80200a90:	00a00793          	li	a5,10
    80200a94:	02f757b3          	divu	a5,a4,a5
    80200a98:	faf43023          	sd	a5,-96(s0)
    } while (num);
    80200a9c:	fa043783          	ld	a5,-96(s0)
    80200aa0:	fa079ee3          	bnez	a5,80200a5c <print_dec_int+0xf0>

    if (flags->prec == -1 && flags->zeroflag) {
    80200aa4:	f9043783          	ld	a5,-112(s0)
    80200aa8:	00c7a783          	lw	a5,12(a5)
    80200aac:	00078713          	mv	a4,a5
    80200ab0:	fff00793          	li	a5,-1
    80200ab4:	02f71063          	bne	a4,a5,80200ad4 <print_dec_int+0x168>
    80200ab8:	f9043783          	ld	a5,-112(s0)
    80200abc:	0037c783          	lbu	a5,3(a5)
    80200ac0:	00078a63          	beqz	a5,80200ad4 <print_dec_int+0x168>
        flags->prec = flags->width;
    80200ac4:	f9043783          	ld	a5,-112(s0)
    80200ac8:	0087a703          	lw	a4,8(a5)
    80200acc:	f9043783          	ld	a5,-112(s0)
    80200ad0:	00e7a623          	sw	a4,12(a5)
    }

    int written = 0;
    80200ad4:	fe042223          	sw	zero,-28(s0)

    for (int i = flags->width - __MAX(decdigits, flags->prec) - has_sign_char; i > 0; i--) {
    80200ad8:	f9043783          	ld	a5,-112(s0)
    80200adc:	0087a703          	lw	a4,8(a5)
    80200ae0:	fe842783          	lw	a5,-24(s0)
    80200ae4:	fcf42823          	sw	a5,-48(s0)
    80200ae8:	f9043783          	ld	a5,-112(s0)
    80200aec:	00c7a783          	lw	a5,12(a5)
    80200af0:	fcf42623          	sw	a5,-52(s0)
    80200af4:	fd042783          	lw	a5,-48(s0)
    80200af8:	00078593          	mv	a1,a5
    80200afc:	fcc42783          	lw	a5,-52(s0)
    80200b00:	00078613          	mv	a2,a5
    80200b04:	0006069b          	sext.w	a3,a2
    80200b08:	0005879b          	sext.w	a5,a1
    80200b0c:	00f6d463          	bge	a3,a5,80200b14 <print_dec_int+0x1a8>
    80200b10:	00058613          	mv	a2,a1
    80200b14:	0006079b          	sext.w	a5,a2
    80200b18:	40f707bb          	subw	a5,a4,a5
    80200b1c:	0007871b          	sext.w	a4,a5
    80200b20:	fd744783          	lbu	a5,-41(s0)
    80200b24:	0007879b          	sext.w	a5,a5
    80200b28:	40f707bb          	subw	a5,a4,a5
    80200b2c:	fef42023          	sw	a5,-32(s0)
    80200b30:	0280006f          	j	80200b58 <print_dec_int+0x1ec>
        putch(' ');
    80200b34:	fa843783          	ld	a5,-88(s0)
    80200b38:	02000513          	li	a0,32
    80200b3c:	000780e7          	jalr	a5
        ++written;
    80200b40:	fe442783          	lw	a5,-28(s0)
    80200b44:	0017879b          	addw	a5,a5,1
    80200b48:	fef42223          	sw	a5,-28(s0)
    for (int i = flags->width - __MAX(decdigits, flags->prec) - has_sign_char; i > 0; i--) {
    80200b4c:	fe042783          	lw	a5,-32(s0)
    80200b50:	fff7879b          	addw	a5,a5,-1
    80200b54:	fef42023          	sw	a5,-32(s0)
    80200b58:	fe042783          	lw	a5,-32(s0)
    80200b5c:	0007879b          	sext.w	a5,a5
    80200b60:	fcf04ae3          	bgtz	a5,80200b34 <print_dec_int+0x1c8>
    }

    if (has_sign_char) {
    80200b64:	fd744783          	lbu	a5,-41(s0)
    80200b68:	0ff7f793          	zext.b	a5,a5
    80200b6c:	04078463          	beqz	a5,80200bb4 <print_dec_int+0x248>
        putch(neg ? '-' : flags->sign ? '+' : ' ');
    80200b70:	fef44783          	lbu	a5,-17(s0)
    80200b74:	0ff7f793          	zext.b	a5,a5
    80200b78:	00078663          	beqz	a5,80200b84 <print_dec_int+0x218>
    80200b7c:	02d00793          	li	a5,45
    80200b80:	01c0006f          	j	80200b9c <print_dec_int+0x230>
    80200b84:	f9043783          	ld	a5,-112(s0)
    80200b88:	0057c783          	lbu	a5,5(a5)
    80200b8c:	00078663          	beqz	a5,80200b98 <print_dec_int+0x22c>
    80200b90:	02b00793          	li	a5,43
    80200b94:	0080006f          	j	80200b9c <print_dec_int+0x230>
    80200b98:	02000793          	li	a5,32
    80200b9c:	fa843703          	ld	a4,-88(s0)
    80200ba0:	00078513          	mv	a0,a5
    80200ba4:	000700e7          	jalr	a4
        ++written;
    80200ba8:	fe442783          	lw	a5,-28(s0)
    80200bac:	0017879b          	addw	a5,a5,1
    80200bb0:	fef42223          	sw	a5,-28(s0)
    }

    for (int i = decdigits; i < flags->prec - has_sign_char; i++) {
    80200bb4:	fe842783          	lw	a5,-24(s0)
    80200bb8:	fcf42e23          	sw	a5,-36(s0)
    80200bbc:	0280006f          	j	80200be4 <print_dec_int+0x278>
        putch('0');
    80200bc0:	fa843783          	ld	a5,-88(s0)
    80200bc4:	03000513          	li	a0,48
    80200bc8:	000780e7          	jalr	a5
        ++written;
    80200bcc:	fe442783          	lw	a5,-28(s0)
    80200bd0:	0017879b          	addw	a5,a5,1
    80200bd4:	fef42223          	sw	a5,-28(s0)
    for (int i = decdigits; i < flags->prec - has_sign_char; i++) {
    80200bd8:	fdc42783          	lw	a5,-36(s0)
    80200bdc:	0017879b          	addw	a5,a5,1
    80200be0:	fcf42e23          	sw	a5,-36(s0)
    80200be4:	f9043783          	ld	a5,-112(s0)
    80200be8:	00c7a703          	lw	a4,12(a5)
    80200bec:	fd744783          	lbu	a5,-41(s0)
    80200bf0:	0007879b          	sext.w	a5,a5
    80200bf4:	40f707bb          	subw	a5,a4,a5
    80200bf8:	0007871b          	sext.w	a4,a5
    80200bfc:	fdc42783          	lw	a5,-36(s0)
    80200c00:	0007879b          	sext.w	a5,a5
    80200c04:	fae7cee3          	blt	a5,a4,80200bc0 <print_dec_int+0x254>
    }

    for (int i = decdigits - 1; i >= 0; i--) {
    80200c08:	fe842783          	lw	a5,-24(s0)
    80200c0c:	fff7879b          	addw	a5,a5,-1
    80200c10:	fcf42c23          	sw	a5,-40(s0)
    80200c14:	03c0006f          	j	80200c50 <print_dec_int+0x2e4>
        putch(buf[i]);
    80200c18:	fd842783          	lw	a5,-40(s0)
    80200c1c:	ff078793          	add	a5,a5,-16
    80200c20:	008787b3          	add	a5,a5,s0
    80200c24:	fc87c783          	lbu	a5,-56(a5)
    80200c28:	0007871b          	sext.w	a4,a5
    80200c2c:	fa843783          	ld	a5,-88(s0)
    80200c30:	00070513          	mv	a0,a4
    80200c34:	000780e7          	jalr	a5
        ++written;
    80200c38:	fe442783          	lw	a5,-28(s0)
    80200c3c:	0017879b          	addw	a5,a5,1
    80200c40:	fef42223          	sw	a5,-28(s0)
    for (int i = decdigits - 1; i >= 0; i--) {
    80200c44:	fd842783          	lw	a5,-40(s0)
    80200c48:	fff7879b          	addw	a5,a5,-1
    80200c4c:	fcf42c23          	sw	a5,-40(s0)
    80200c50:	fd842783          	lw	a5,-40(s0)
    80200c54:	0007879b          	sext.w	a5,a5
    80200c58:	fc07d0e3          	bgez	a5,80200c18 <print_dec_int+0x2ac>
    }

    return written;
    80200c5c:	fe442783          	lw	a5,-28(s0)
}
    80200c60:	00078513          	mv	a0,a5
    80200c64:	06813083          	ld	ra,104(sp)
    80200c68:	06013403          	ld	s0,96(sp)
    80200c6c:	07010113          	add	sp,sp,112
    80200c70:	00008067          	ret

0000000080200c74 <vprintfmt>:

int vprintfmt(int (*putch)(int), const char *fmt, va_list vl) {
    80200c74:	f4010113          	add	sp,sp,-192
    80200c78:	0a113c23          	sd	ra,184(sp)
    80200c7c:	0a813823          	sd	s0,176(sp)
    80200c80:	0c010413          	add	s0,sp,192
    80200c84:	f4a43c23          	sd	a0,-168(s0)
    80200c88:	f4b43823          	sd	a1,-176(s0)
    80200c8c:	f4c43423          	sd	a2,-184(s0)
    static const char lowerxdigits[] = "0123456789abcdef";
    static const char upperxdigits[] = "0123456789ABCDEF";

    struct fmt_flags flags = {};
    80200c90:	f8043023          	sd	zero,-128(s0)
    80200c94:	f8043423          	sd	zero,-120(s0)

    int written = 0;
    80200c98:	fe042623          	sw	zero,-20(s0)

    for (; *fmt; fmt++) {
    80200c9c:	7a40006f          	j	80201440 <vprintfmt+0x7cc>
        if (flags.in_format) {
    80200ca0:	f8044783          	lbu	a5,-128(s0)
    80200ca4:	72078e63          	beqz	a5,802013e0 <vprintfmt+0x76c>
            if (*fmt == '#') {
    80200ca8:	f5043783          	ld	a5,-176(s0)
    80200cac:	0007c783          	lbu	a5,0(a5)
    80200cb0:	00078713          	mv	a4,a5
    80200cb4:	02300793          	li	a5,35
    80200cb8:	00f71863          	bne	a4,a5,80200cc8 <vprintfmt+0x54>
                flags.sharpflag = true;
    80200cbc:	00100793          	li	a5,1
    80200cc0:	f8f40123          	sb	a5,-126(s0)
    80200cc4:	7700006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == '0') {
    80200cc8:	f5043783          	ld	a5,-176(s0)
    80200ccc:	0007c783          	lbu	a5,0(a5)
    80200cd0:	00078713          	mv	a4,a5
    80200cd4:	03000793          	li	a5,48
    80200cd8:	00f71863          	bne	a4,a5,80200ce8 <vprintfmt+0x74>
                flags.zeroflag = true;
    80200cdc:	00100793          	li	a5,1
    80200ce0:	f8f401a3          	sb	a5,-125(s0)
    80200ce4:	7500006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == 'l' || *fmt == 'z' || *fmt == 't' || *fmt == 'j') {
    80200ce8:	f5043783          	ld	a5,-176(s0)
    80200cec:	0007c783          	lbu	a5,0(a5)
    80200cf0:	00078713          	mv	a4,a5
    80200cf4:	06c00793          	li	a5,108
    80200cf8:	04f70063          	beq	a4,a5,80200d38 <vprintfmt+0xc4>
    80200cfc:	f5043783          	ld	a5,-176(s0)
    80200d00:	0007c783          	lbu	a5,0(a5)
    80200d04:	00078713          	mv	a4,a5
    80200d08:	07a00793          	li	a5,122
    80200d0c:	02f70663          	beq	a4,a5,80200d38 <vprintfmt+0xc4>
    80200d10:	f5043783          	ld	a5,-176(s0)
    80200d14:	0007c783          	lbu	a5,0(a5)
    80200d18:	00078713          	mv	a4,a5
    80200d1c:	07400793          	li	a5,116
    80200d20:	00f70c63          	beq	a4,a5,80200d38 <vprintfmt+0xc4>
    80200d24:	f5043783          	ld	a5,-176(s0)
    80200d28:	0007c783          	lbu	a5,0(a5)
    80200d2c:	00078713          	mv	a4,a5
    80200d30:	06a00793          	li	a5,106
    80200d34:	00f71863          	bne	a4,a5,80200d44 <vprintfmt+0xd0>
                // l: long, z: size_t, t: ptrdiff_t, j: intmax_t
                flags.longflag = true;
    80200d38:	00100793          	li	a5,1
    80200d3c:	f8f400a3          	sb	a5,-127(s0)
    80200d40:	6f40006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == '+') {
    80200d44:	f5043783          	ld	a5,-176(s0)
    80200d48:	0007c783          	lbu	a5,0(a5)
    80200d4c:	00078713          	mv	a4,a5
    80200d50:	02b00793          	li	a5,43
    80200d54:	00f71863          	bne	a4,a5,80200d64 <vprintfmt+0xf0>
                flags.sign = true;
    80200d58:	00100793          	li	a5,1
    80200d5c:	f8f402a3          	sb	a5,-123(s0)
    80200d60:	6d40006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == ' ') {
    80200d64:	f5043783          	ld	a5,-176(s0)
    80200d68:	0007c783          	lbu	a5,0(a5)
    80200d6c:	00078713          	mv	a4,a5
    80200d70:	02000793          	li	a5,32
    80200d74:	00f71863          	bne	a4,a5,80200d84 <vprintfmt+0x110>
                flags.spaceflag = true;
    80200d78:	00100793          	li	a5,1
    80200d7c:	f8f40223          	sb	a5,-124(s0)
    80200d80:	6b40006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == '*') {
    80200d84:	f5043783          	ld	a5,-176(s0)
    80200d88:	0007c783          	lbu	a5,0(a5)
    80200d8c:	00078713          	mv	a4,a5
    80200d90:	02a00793          	li	a5,42
    80200d94:	00f71e63          	bne	a4,a5,80200db0 <vprintfmt+0x13c>
                flags.width = va_arg(vl, int);
    80200d98:	f4843783          	ld	a5,-184(s0)
    80200d9c:	00878713          	add	a4,a5,8
    80200da0:	f4e43423          	sd	a4,-184(s0)
    80200da4:	0007a783          	lw	a5,0(a5)
    80200da8:	f8f42423          	sw	a5,-120(s0)
    80200dac:	6880006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt >= '1' && *fmt <= '9') {
    80200db0:	f5043783          	ld	a5,-176(s0)
    80200db4:	0007c783          	lbu	a5,0(a5)
    80200db8:	00078713          	mv	a4,a5
    80200dbc:	03000793          	li	a5,48
    80200dc0:	04e7f663          	bgeu	a5,a4,80200e0c <vprintfmt+0x198>
    80200dc4:	f5043783          	ld	a5,-176(s0)
    80200dc8:	0007c783          	lbu	a5,0(a5)
    80200dcc:	00078713          	mv	a4,a5
    80200dd0:	03900793          	li	a5,57
    80200dd4:	02e7ec63          	bltu	a5,a4,80200e0c <vprintfmt+0x198>
                flags.width = strtol(fmt, (char **)&fmt, 10);
    80200dd8:	f5043783          	ld	a5,-176(s0)
    80200ddc:	f5040713          	add	a4,s0,-176
    80200de0:	00a00613          	li	a2,10
    80200de4:	00070593          	mv	a1,a4
    80200de8:	00078513          	mv	a0,a5
    80200dec:	88dff0ef          	jal	80200678 <strtol>
    80200df0:	00050793          	mv	a5,a0
    80200df4:	0007879b          	sext.w	a5,a5
    80200df8:	f8f42423          	sw	a5,-120(s0)
                fmt--;
    80200dfc:	f5043783          	ld	a5,-176(s0)
    80200e00:	fff78793          	add	a5,a5,-1
    80200e04:	f4f43823          	sd	a5,-176(s0)
    80200e08:	62c0006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == '.') {
    80200e0c:	f5043783          	ld	a5,-176(s0)
    80200e10:	0007c783          	lbu	a5,0(a5)
    80200e14:	00078713          	mv	a4,a5
    80200e18:	02e00793          	li	a5,46
    80200e1c:	06f71863          	bne	a4,a5,80200e8c <vprintfmt+0x218>
                fmt++;
    80200e20:	f5043783          	ld	a5,-176(s0)
    80200e24:	00178793          	add	a5,a5,1
    80200e28:	f4f43823          	sd	a5,-176(s0)
                if (*fmt == '*') {
    80200e2c:	f5043783          	ld	a5,-176(s0)
    80200e30:	0007c783          	lbu	a5,0(a5)
    80200e34:	00078713          	mv	a4,a5
    80200e38:	02a00793          	li	a5,42
    80200e3c:	00f71e63          	bne	a4,a5,80200e58 <vprintfmt+0x1e4>
                    flags.prec = va_arg(vl, int);
    80200e40:	f4843783          	ld	a5,-184(s0)
    80200e44:	00878713          	add	a4,a5,8
    80200e48:	f4e43423          	sd	a4,-184(s0)
    80200e4c:	0007a783          	lw	a5,0(a5)
    80200e50:	f8f42623          	sw	a5,-116(s0)
    80200e54:	5e00006f          	j	80201434 <vprintfmt+0x7c0>
                } else {
                    flags.prec = strtol(fmt, (char **)&fmt, 10);
    80200e58:	f5043783          	ld	a5,-176(s0)
    80200e5c:	f5040713          	add	a4,s0,-176
    80200e60:	00a00613          	li	a2,10
    80200e64:	00070593          	mv	a1,a4
    80200e68:	00078513          	mv	a0,a5
    80200e6c:	80dff0ef          	jal	80200678 <strtol>
    80200e70:	00050793          	mv	a5,a0
    80200e74:	0007879b          	sext.w	a5,a5
    80200e78:	f8f42623          	sw	a5,-116(s0)
                    fmt--;
    80200e7c:	f5043783          	ld	a5,-176(s0)
    80200e80:	fff78793          	add	a5,a5,-1
    80200e84:	f4f43823          	sd	a5,-176(s0)
    80200e88:	5ac0006f          	j	80201434 <vprintfmt+0x7c0>
                }
            } else if (*fmt == 'x' || *fmt == 'X' || *fmt == 'p') {
    80200e8c:	f5043783          	ld	a5,-176(s0)
    80200e90:	0007c783          	lbu	a5,0(a5)
    80200e94:	00078713          	mv	a4,a5
    80200e98:	07800793          	li	a5,120
    80200e9c:	02f70663          	beq	a4,a5,80200ec8 <vprintfmt+0x254>
    80200ea0:	f5043783          	ld	a5,-176(s0)
    80200ea4:	0007c783          	lbu	a5,0(a5)
    80200ea8:	00078713          	mv	a4,a5
    80200eac:	05800793          	li	a5,88
    80200eb0:	00f70c63          	beq	a4,a5,80200ec8 <vprintfmt+0x254>
    80200eb4:	f5043783          	ld	a5,-176(s0)
    80200eb8:	0007c783          	lbu	a5,0(a5)
    80200ebc:	00078713          	mv	a4,a5
    80200ec0:	07000793          	li	a5,112
    80200ec4:	30f71263          	bne	a4,a5,802011c8 <vprintfmt+0x554>
                bool is_long = *fmt == 'p' || flags.longflag;
    80200ec8:	f5043783          	ld	a5,-176(s0)
    80200ecc:	0007c783          	lbu	a5,0(a5)
    80200ed0:	00078713          	mv	a4,a5
    80200ed4:	07000793          	li	a5,112
    80200ed8:	00f70663          	beq	a4,a5,80200ee4 <vprintfmt+0x270>
    80200edc:	f8144783          	lbu	a5,-127(s0)
    80200ee0:	00078663          	beqz	a5,80200eec <vprintfmt+0x278>
    80200ee4:	00100793          	li	a5,1
    80200ee8:	0080006f          	j	80200ef0 <vprintfmt+0x27c>
    80200eec:	00000793          	li	a5,0
    80200ef0:	faf403a3          	sb	a5,-89(s0)
    80200ef4:	fa744783          	lbu	a5,-89(s0)
    80200ef8:	0017f793          	and	a5,a5,1
    80200efc:	faf403a3          	sb	a5,-89(s0)

                unsigned long num = is_long ? va_arg(vl, unsigned long) : va_arg(vl, unsigned int);
    80200f00:	fa744783          	lbu	a5,-89(s0)
    80200f04:	0ff7f793          	zext.b	a5,a5
    80200f08:	00078c63          	beqz	a5,80200f20 <vprintfmt+0x2ac>
    80200f0c:	f4843783          	ld	a5,-184(s0)
    80200f10:	00878713          	add	a4,a5,8
    80200f14:	f4e43423          	sd	a4,-184(s0)
    80200f18:	0007b783          	ld	a5,0(a5)
    80200f1c:	01c0006f          	j	80200f38 <vprintfmt+0x2c4>
    80200f20:	f4843783          	ld	a5,-184(s0)
    80200f24:	00878713          	add	a4,a5,8
    80200f28:	f4e43423          	sd	a4,-184(s0)
    80200f2c:	0007a783          	lw	a5,0(a5)
    80200f30:	02079793          	sll	a5,a5,0x20
    80200f34:	0207d793          	srl	a5,a5,0x20
    80200f38:	fef43023          	sd	a5,-32(s0)

                if (flags.prec == 0 && num == 0 && *fmt != 'p') {
    80200f3c:	f8c42783          	lw	a5,-116(s0)
    80200f40:	02079463          	bnez	a5,80200f68 <vprintfmt+0x2f4>
    80200f44:	fe043783          	ld	a5,-32(s0)
    80200f48:	02079063          	bnez	a5,80200f68 <vprintfmt+0x2f4>
    80200f4c:	f5043783          	ld	a5,-176(s0)
    80200f50:	0007c783          	lbu	a5,0(a5)
    80200f54:	00078713          	mv	a4,a5
    80200f58:	07000793          	li	a5,112
    80200f5c:	00f70663          	beq	a4,a5,80200f68 <vprintfmt+0x2f4>
                    flags.in_format = false;
    80200f60:	f8040023          	sb	zero,-128(s0)
    80200f64:	4d00006f          	j	80201434 <vprintfmt+0x7c0>
                    continue;
                }

                // 0x prefix for pointers, or, if # flag is set and non-zero
                bool prefix = *fmt == 'p' || (flags.sharpflag && num != 0);
    80200f68:	f5043783          	ld	a5,-176(s0)
    80200f6c:	0007c783          	lbu	a5,0(a5)
    80200f70:	00078713          	mv	a4,a5
    80200f74:	07000793          	li	a5,112
    80200f78:	00f70a63          	beq	a4,a5,80200f8c <vprintfmt+0x318>
    80200f7c:	f8244783          	lbu	a5,-126(s0)
    80200f80:	00078a63          	beqz	a5,80200f94 <vprintfmt+0x320>
    80200f84:	fe043783          	ld	a5,-32(s0)
    80200f88:	00078663          	beqz	a5,80200f94 <vprintfmt+0x320>
    80200f8c:	00100793          	li	a5,1
    80200f90:	0080006f          	j	80200f98 <vprintfmt+0x324>
    80200f94:	00000793          	li	a5,0
    80200f98:	faf40323          	sb	a5,-90(s0)
    80200f9c:	fa644783          	lbu	a5,-90(s0)
    80200fa0:	0017f793          	and	a5,a5,1
    80200fa4:	faf40323          	sb	a5,-90(s0)

                int hexdigits = 0;
    80200fa8:	fc042e23          	sw	zero,-36(s0)
                const char *xdigits = *fmt == 'X' ? upperxdigits : lowerxdigits;
    80200fac:	f5043783          	ld	a5,-176(s0)
    80200fb0:	0007c783          	lbu	a5,0(a5)
    80200fb4:	00078713          	mv	a4,a5
    80200fb8:	05800793          	li	a5,88
    80200fbc:	00f71863          	bne	a4,a5,80200fcc <vprintfmt+0x358>
    80200fc0:	00001797          	auipc	a5,0x1
    80200fc4:	12878793          	add	a5,a5,296 # 802020e8 <upperxdigits.1>
    80200fc8:	00c0006f          	j	80200fd4 <vprintfmt+0x360>
    80200fcc:	00001797          	auipc	a5,0x1
    80200fd0:	13478793          	add	a5,a5,308 # 80202100 <lowerxdigits.0>
    80200fd4:	f8f43c23          	sd	a5,-104(s0)
                char buf[2 * sizeof(unsigned long)];

                do {
                    buf[hexdigits++] = xdigits[num & 0xf];
    80200fd8:	fe043783          	ld	a5,-32(s0)
    80200fdc:	00f7f793          	and	a5,a5,15
    80200fe0:	f9843703          	ld	a4,-104(s0)
    80200fe4:	00f70733          	add	a4,a4,a5
    80200fe8:	fdc42783          	lw	a5,-36(s0)
    80200fec:	0017869b          	addw	a3,a5,1
    80200ff0:	fcd42e23          	sw	a3,-36(s0)
    80200ff4:	00074703          	lbu	a4,0(a4)
    80200ff8:	ff078793          	add	a5,a5,-16
    80200ffc:	008787b3          	add	a5,a5,s0
    80201000:	f8e78023          	sb	a4,-128(a5)
                    num >>= 4;
    80201004:	fe043783          	ld	a5,-32(s0)
    80201008:	0047d793          	srl	a5,a5,0x4
    8020100c:	fef43023          	sd	a5,-32(s0)
                } while (num);
    80201010:	fe043783          	ld	a5,-32(s0)
    80201014:	fc0792e3          	bnez	a5,80200fd8 <vprintfmt+0x364>

                if (flags.prec == -1 && flags.zeroflag) {
    80201018:	f8c42783          	lw	a5,-116(s0)
    8020101c:	00078713          	mv	a4,a5
    80201020:	fff00793          	li	a5,-1
    80201024:	02f71663          	bne	a4,a5,80201050 <vprintfmt+0x3dc>
    80201028:	f8344783          	lbu	a5,-125(s0)
    8020102c:	02078263          	beqz	a5,80201050 <vprintfmt+0x3dc>
                    flags.prec = flags.width - 2 * prefix;
    80201030:	f8842703          	lw	a4,-120(s0)
    80201034:	fa644783          	lbu	a5,-90(s0)
    80201038:	0007879b          	sext.w	a5,a5
    8020103c:	0017979b          	sllw	a5,a5,0x1
    80201040:	0007879b          	sext.w	a5,a5
    80201044:	40f707bb          	subw	a5,a4,a5
    80201048:	0007879b          	sext.w	a5,a5
    8020104c:	f8f42623          	sw	a5,-116(s0)
                }

                for (int i = flags.width - 2 * prefix - __MAX(hexdigits, flags.prec); i > 0; i--) {
    80201050:	f8842703          	lw	a4,-120(s0)
    80201054:	fa644783          	lbu	a5,-90(s0)
    80201058:	0007879b          	sext.w	a5,a5
    8020105c:	0017979b          	sllw	a5,a5,0x1
    80201060:	0007879b          	sext.w	a5,a5
    80201064:	40f707bb          	subw	a5,a4,a5
    80201068:	0007871b          	sext.w	a4,a5
    8020106c:	fdc42783          	lw	a5,-36(s0)
    80201070:	f8f42a23          	sw	a5,-108(s0)
    80201074:	f8c42783          	lw	a5,-116(s0)
    80201078:	f8f42823          	sw	a5,-112(s0)
    8020107c:	f9442783          	lw	a5,-108(s0)
    80201080:	00078593          	mv	a1,a5
    80201084:	f9042783          	lw	a5,-112(s0)
    80201088:	00078613          	mv	a2,a5
    8020108c:	0006069b          	sext.w	a3,a2
    80201090:	0005879b          	sext.w	a5,a1
    80201094:	00f6d463          	bge	a3,a5,8020109c <vprintfmt+0x428>
    80201098:	00058613          	mv	a2,a1
    8020109c:	0006079b          	sext.w	a5,a2
    802010a0:	40f707bb          	subw	a5,a4,a5
    802010a4:	fcf42c23          	sw	a5,-40(s0)
    802010a8:	0280006f          	j	802010d0 <vprintfmt+0x45c>
                    putch(' ');
    802010ac:	f5843783          	ld	a5,-168(s0)
    802010b0:	02000513          	li	a0,32
    802010b4:	000780e7          	jalr	a5
                    ++written;
    802010b8:	fec42783          	lw	a5,-20(s0)
    802010bc:	0017879b          	addw	a5,a5,1
    802010c0:	fef42623          	sw	a5,-20(s0)
                for (int i = flags.width - 2 * prefix - __MAX(hexdigits, flags.prec); i > 0; i--) {
    802010c4:	fd842783          	lw	a5,-40(s0)
    802010c8:	fff7879b          	addw	a5,a5,-1
    802010cc:	fcf42c23          	sw	a5,-40(s0)
    802010d0:	fd842783          	lw	a5,-40(s0)
    802010d4:	0007879b          	sext.w	a5,a5
    802010d8:	fcf04ae3          	bgtz	a5,802010ac <vprintfmt+0x438>
                }

                if (prefix) {
    802010dc:	fa644783          	lbu	a5,-90(s0)
    802010e0:	0ff7f793          	zext.b	a5,a5
    802010e4:	04078463          	beqz	a5,8020112c <vprintfmt+0x4b8>
                    putch('0');
    802010e8:	f5843783          	ld	a5,-168(s0)
    802010ec:	03000513          	li	a0,48
    802010f0:	000780e7          	jalr	a5
                    putch(*fmt == 'X' ? 'X' : 'x');
    802010f4:	f5043783          	ld	a5,-176(s0)
    802010f8:	0007c783          	lbu	a5,0(a5)
    802010fc:	00078713          	mv	a4,a5
    80201100:	05800793          	li	a5,88
    80201104:	00f71663          	bne	a4,a5,80201110 <vprintfmt+0x49c>
    80201108:	05800793          	li	a5,88
    8020110c:	0080006f          	j	80201114 <vprintfmt+0x4a0>
    80201110:	07800793          	li	a5,120
    80201114:	f5843703          	ld	a4,-168(s0)
    80201118:	00078513          	mv	a0,a5
    8020111c:	000700e7          	jalr	a4
                    written += 2;
    80201120:	fec42783          	lw	a5,-20(s0)
    80201124:	0027879b          	addw	a5,a5,2
    80201128:	fef42623          	sw	a5,-20(s0)
                }

                for (int i = hexdigits; i < flags.prec; i++) {
    8020112c:	fdc42783          	lw	a5,-36(s0)
    80201130:	fcf42a23          	sw	a5,-44(s0)
    80201134:	0280006f          	j	8020115c <vprintfmt+0x4e8>
                    putch('0');
    80201138:	f5843783          	ld	a5,-168(s0)
    8020113c:	03000513          	li	a0,48
    80201140:	000780e7          	jalr	a5
                    ++written;
    80201144:	fec42783          	lw	a5,-20(s0)
    80201148:	0017879b          	addw	a5,a5,1
    8020114c:	fef42623          	sw	a5,-20(s0)
                for (int i = hexdigits; i < flags.prec; i++) {
    80201150:	fd442783          	lw	a5,-44(s0)
    80201154:	0017879b          	addw	a5,a5,1
    80201158:	fcf42a23          	sw	a5,-44(s0)
    8020115c:	f8c42703          	lw	a4,-116(s0)
    80201160:	fd442783          	lw	a5,-44(s0)
    80201164:	0007879b          	sext.w	a5,a5
    80201168:	fce7c8e3          	blt	a5,a4,80201138 <vprintfmt+0x4c4>
                }

                for (int i = hexdigits - 1; i >= 0; i--) {
    8020116c:	fdc42783          	lw	a5,-36(s0)
    80201170:	fff7879b          	addw	a5,a5,-1
    80201174:	fcf42823          	sw	a5,-48(s0)
    80201178:	03c0006f          	j	802011b4 <vprintfmt+0x540>
                    putch(buf[i]);
    8020117c:	fd042783          	lw	a5,-48(s0)
    80201180:	ff078793          	add	a5,a5,-16
    80201184:	008787b3          	add	a5,a5,s0
    80201188:	f807c783          	lbu	a5,-128(a5)
    8020118c:	0007871b          	sext.w	a4,a5
    80201190:	f5843783          	ld	a5,-168(s0)
    80201194:	00070513          	mv	a0,a4
    80201198:	000780e7          	jalr	a5
                    ++written;
    8020119c:	fec42783          	lw	a5,-20(s0)
    802011a0:	0017879b          	addw	a5,a5,1
    802011a4:	fef42623          	sw	a5,-20(s0)
                for (int i = hexdigits - 1; i >= 0; i--) {
    802011a8:	fd042783          	lw	a5,-48(s0)
    802011ac:	fff7879b          	addw	a5,a5,-1
    802011b0:	fcf42823          	sw	a5,-48(s0)
    802011b4:	fd042783          	lw	a5,-48(s0)
    802011b8:	0007879b          	sext.w	a5,a5
    802011bc:	fc07d0e3          	bgez	a5,8020117c <vprintfmt+0x508>
                }

                flags.in_format = false;
    802011c0:	f8040023          	sb	zero,-128(s0)
            } else if (*fmt == 'x' || *fmt == 'X' || *fmt == 'p') {
    802011c4:	2700006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == 'd' || *fmt == 'i' || *fmt == 'u') {
    802011c8:	f5043783          	ld	a5,-176(s0)
    802011cc:	0007c783          	lbu	a5,0(a5)
    802011d0:	00078713          	mv	a4,a5
    802011d4:	06400793          	li	a5,100
    802011d8:	02f70663          	beq	a4,a5,80201204 <vprintfmt+0x590>
    802011dc:	f5043783          	ld	a5,-176(s0)
    802011e0:	0007c783          	lbu	a5,0(a5)
    802011e4:	00078713          	mv	a4,a5
    802011e8:	06900793          	li	a5,105
    802011ec:	00f70c63          	beq	a4,a5,80201204 <vprintfmt+0x590>
    802011f0:	f5043783          	ld	a5,-176(s0)
    802011f4:	0007c783          	lbu	a5,0(a5)
    802011f8:	00078713          	mv	a4,a5
    802011fc:	07500793          	li	a5,117
    80201200:	08f71063          	bne	a4,a5,80201280 <vprintfmt+0x60c>
                long num = flags.longflag ? va_arg(vl, long) : va_arg(vl, int);
    80201204:	f8144783          	lbu	a5,-127(s0)
    80201208:	00078c63          	beqz	a5,80201220 <vprintfmt+0x5ac>
    8020120c:	f4843783          	ld	a5,-184(s0)
    80201210:	00878713          	add	a4,a5,8
    80201214:	f4e43423          	sd	a4,-184(s0)
    80201218:	0007b783          	ld	a5,0(a5)
    8020121c:	0140006f          	j	80201230 <vprintfmt+0x5bc>
    80201220:	f4843783          	ld	a5,-184(s0)
    80201224:	00878713          	add	a4,a5,8
    80201228:	f4e43423          	sd	a4,-184(s0)
    8020122c:	0007a783          	lw	a5,0(a5)
    80201230:	faf43423          	sd	a5,-88(s0)

                written += print_dec_int(putch, num, *fmt != 'u', &flags);
    80201234:	fa843583          	ld	a1,-88(s0)
    80201238:	f5043783          	ld	a5,-176(s0)
    8020123c:	0007c783          	lbu	a5,0(a5)
    80201240:	0007871b          	sext.w	a4,a5
    80201244:	07500793          	li	a5,117
    80201248:	40f707b3          	sub	a5,a4,a5
    8020124c:	00f037b3          	snez	a5,a5
    80201250:	0ff7f793          	zext.b	a5,a5
    80201254:	f8040713          	add	a4,s0,-128
    80201258:	00070693          	mv	a3,a4
    8020125c:	00078613          	mv	a2,a5
    80201260:	f5843503          	ld	a0,-168(s0)
    80201264:	f08ff0ef          	jal	8020096c <print_dec_int>
    80201268:	00050793          	mv	a5,a0
    8020126c:	fec42703          	lw	a4,-20(s0)
    80201270:	00f707bb          	addw	a5,a4,a5
    80201274:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    80201278:	f8040023          	sb	zero,-128(s0)
            } else if (*fmt == 'd' || *fmt == 'i' || *fmt == 'u') {
    8020127c:	1b80006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == 'n') {
    80201280:	f5043783          	ld	a5,-176(s0)
    80201284:	0007c783          	lbu	a5,0(a5)
    80201288:	00078713          	mv	a4,a5
    8020128c:	06e00793          	li	a5,110
    80201290:	04f71c63          	bne	a4,a5,802012e8 <vprintfmt+0x674>
                if (flags.longflag) {
    80201294:	f8144783          	lbu	a5,-127(s0)
    80201298:	02078463          	beqz	a5,802012c0 <vprintfmt+0x64c>
                    long *n = va_arg(vl, long *);
    8020129c:	f4843783          	ld	a5,-184(s0)
    802012a0:	00878713          	add	a4,a5,8
    802012a4:	f4e43423          	sd	a4,-184(s0)
    802012a8:	0007b783          	ld	a5,0(a5)
    802012ac:	faf43823          	sd	a5,-80(s0)
                    *n = written;
    802012b0:	fec42703          	lw	a4,-20(s0)
    802012b4:	fb043783          	ld	a5,-80(s0)
    802012b8:	00e7b023          	sd	a4,0(a5)
    802012bc:	0240006f          	j	802012e0 <vprintfmt+0x66c>
                } else {
                    int *n = va_arg(vl, int *);
    802012c0:	f4843783          	ld	a5,-184(s0)
    802012c4:	00878713          	add	a4,a5,8
    802012c8:	f4e43423          	sd	a4,-184(s0)
    802012cc:	0007b783          	ld	a5,0(a5)
    802012d0:	faf43c23          	sd	a5,-72(s0)
                    *n = written;
    802012d4:	fb843783          	ld	a5,-72(s0)
    802012d8:	fec42703          	lw	a4,-20(s0)
    802012dc:	00e7a023          	sw	a4,0(a5)
                }
                flags.in_format = false;
    802012e0:	f8040023          	sb	zero,-128(s0)
    802012e4:	1500006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == 's') {
    802012e8:	f5043783          	ld	a5,-176(s0)
    802012ec:	0007c783          	lbu	a5,0(a5)
    802012f0:	00078713          	mv	a4,a5
    802012f4:	07300793          	li	a5,115
    802012f8:	02f71e63          	bne	a4,a5,80201334 <vprintfmt+0x6c0>
                const char *s = va_arg(vl, const char *);
    802012fc:	f4843783          	ld	a5,-184(s0)
    80201300:	00878713          	add	a4,a5,8
    80201304:	f4e43423          	sd	a4,-184(s0)
    80201308:	0007b783          	ld	a5,0(a5)
    8020130c:	fcf43023          	sd	a5,-64(s0)
                written += puts_wo_nl(putch, s);
    80201310:	fc043583          	ld	a1,-64(s0)
    80201314:	f5843503          	ld	a0,-168(s0)
    80201318:	dccff0ef          	jal	802008e4 <puts_wo_nl>
    8020131c:	00050793          	mv	a5,a0
    80201320:	fec42703          	lw	a4,-20(s0)
    80201324:	00f707bb          	addw	a5,a4,a5
    80201328:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    8020132c:	f8040023          	sb	zero,-128(s0)
    80201330:	1040006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == 'c') {
    80201334:	f5043783          	ld	a5,-176(s0)
    80201338:	0007c783          	lbu	a5,0(a5)
    8020133c:	00078713          	mv	a4,a5
    80201340:	06300793          	li	a5,99
    80201344:	02f71e63          	bne	a4,a5,80201380 <vprintfmt+0x70c>
                int ch = va_arg(vl, int);
    80201348:	f4843783          	ld	a5,-184(s0)
    8020134c:	00878713          	add	a4,a5,8
    80201350:	f4e43423          	sd	a4,-184(s0)
    80201354:	0007a783          	lw	a5,0(a5)
    80201358:	fcf42623          	sw	a5,-52(s0)
                putch(ch);
    8020135c:	fcc42703          	lw	a4,-52(s0)
    80201360:	f5843783          	ld	a5,-168(s0)
    80201364:	00070513          	mv	a0,a4
    80201368:	000780e7          	jalr	a5
                ++written;
    8020136c:	fec42783          	lw	a5,-20(s0)
    80201370:	0017879b          	addw	a5,a5,1
    80201374:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    80201378:	f8040023          	sb	zero,-128(s0)
    8020137c:	0b80006f          	j	80201434 <vprintfmt+0x7c0>
            } else if (*fmt == '%') {
    80201380:	f5043783          	ld	a5,-176(s0)
    80201384:	0007c783          	lbu	a5,0(a5)
    80201388:	00078713          	mv	a4,a5
    8020138c:	02500793          	li	a5,37
    80201390:	02f71263          	bne	a4,a5,802013b4 <vprintfmt+0x740>
                putch('%');
    80201394:	f5843783          	ld	a5,-168(s0)
    80201398:	02500513          	li	a0,37
    8020139c:	000780e7          	jalr	a5
                ++written;
    802013a0:	fec42783          	lw	a5,-20(s0)
    802013a4:	0017879b          	addw	a5,a5,1
    802013a8:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    802013ac:	f8040023          	sb	zero,-128(s0)
    802013b0:	0840006f          	j	80201434 <vprintfmt+0x7c0>
            } else {
                putch(*fmt);
    802013b4:	f5043783          	ld	a5,-176(s0)
    802013b8:	0007c783          	lbu	a5,0(a5)
    802013bc:	0007871b          	sext.w	a4,a5
    802013c0:	f5843783          	ld	a5,-168(s0)
    802013c4:	00070513          	mv	a0,a4
    802013c8:	000780e7          	jalr	a5
                ++written;
    802013cc:	fec42783          	lw	a5,-20(s0)
    802013d0:	0017879b          	addw	a5,a5,1
    802013d4:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    802013d8:	f8040023          	sb	zero,-128(s0)
    802013dc:	0580006f          	j	80201434 <vprintfmt+0x7c0>
            }
        } else if (*fmt == '%') {
    802013e0:	f5043783          	ld	a5,-176(s0)
    802013e4:	0007c783          	lbu	a5,0(a5)
    802013e8:	00078713          	mv	a4,a5
    802013ec:	02500793          	li	a5,37
    802013f0:	02f71063          	bne	a4,a5,80201410 <vprintfmt+0x79c>
            flags = (struct fmt_flags) {.in_format = true, .prec = -1};
    802013f4:	f8043023          	sd	zero,-128(s0)
    802013f8:	f8043423          	sd	zero,-120(s0)
    802013fc:	00100793          	li	a5,1
    80201400:	f8f40023          	sb	a5,-128(s0)
    80201404:	fff00793          	li	a5,-1
    80201408:	f8f42623          	sw	a5,-116(s0)
    8020140c:	0280006f          	j	80201434 <vprintfmt+0x7c0>
        } else {
            putch(*fmt);
    80201410:	f5043783          	ld	a5,-176(s0)
    80201414:	0007c783          	lbu	a5,0(a5)
    80201418:	0007871b          	sext.w	a4,a5
    8020141c:	f5843783          	ld	a5,-168(s0)
    80201420:	00070513          	mv	a0,a4
    80201424:	000780e7          	jalr	a5
            ++written;
    80201428:	fec42783          	lw	a5,-20(s0)
    8020142c:	0017879b          	addw	a5,a5,1
    80201430:	fef42623          	sw	a5,-20(s0)
    for (; *fmt; fmt++) {
    80201434:	f5043783          	ld	a5,-176(s0)
    80201438:	00178793          	add	a5,a5,1
    8020143c:	f4f43823          	sd	a5,-176(s0)
    80201440:	f5043783          	ld	a5,-176(s0)
    80201444:	0007c783          	lbu	a5,0(a5)
    80201448:	84079ce3          	bnez	a5,80200ca0 <vprintfmt+0x2c>
        }
    }

    return written;
    8020144c:	fec42783          	lw	a5,-20(s0)
}
    80201450:	00078513          	mv	a0,a5
    80201454:	0b813083          	ld	ra,184(sp)
    80201458:	0b013403          	ld	s0,176(sp)
    8020145c:	0c010113          	add	sp,sp,192
    80201460:	00008067          	ret

0000000080201464 <printk>:

int printk(const char* s, ...) {
    80201464:	f9010113          	add	sp,sp,-112
    80201468:	02113423          	sd	ra,40(sp)
    8020146c:	02813023          	sd	s0,32(sp)
    80201470:	03010413          	add	s0,sp,48
    80201474:	fca43c23          	sd	a0,-40(s0)
    80201478:	00b43423          	sd	a1,8(s0)
    8020147c:	00c43823          	sd	a2,16(s0)
    80201480:	00d43c23          	sd	a3,24(s0)
    80201484:	02e43023          	sd	a4,32(s0)
    80201488:	02f43423          	sd	a5,40(s0)
    8020148c:	03043823          	sd	a6,48(s0)
    80201490:	03143c23          	sd	a7,56(s0)
    int res = 0;
    80201494:	fe042623          	sw	zero,-20(s0)
    va_list vl;
    va_start(vl, s);
    80201498:	04040793          	add	a5,s0,64
    8020149c:	fcf43823          	sd	a5,-48(s0)
    802014a0:	fd043783          	ld	a5,-48(s0)
    802014a4:	fc878793          	add	a5,a5,-56
    802014a8:	fef43023          	sd	a5,-32(s0)
    res = vprintfmt(putc, s, vl);
    802014ac:	fe043783          	ld	a5,-32(s0)
    802014b0:	00078613          	mv	a2,a5
    802014b4:	fd843583          	ld	a1,-40(s0)
    802014b8:	fffff517          	auipc	a0,0xfffff
    802014bc:	11850513          	add	a0,a0,280 # 802005d0 <putc>
    802014c0:	fb4ff0ef          	jal	80200c74 <vprintfmt>
    802014c4:	00050793          	mv	a5,a0
    802014c8:	fef42623          	sw	a5,-20(s0)
    va_end(vl);
    return res;
    802014cc:	fec42783          	lw	a5,-20(s0)
}
    802014d0:	00078513          	mv	a0,a5
    802014d4:	02813083          	ld	ra,40(sp)
    802014d8:	02013403          	ld	s0,32(sp)
    802014dc:	07010113          	add	sp,sp,112
    802014e0:	00008067          	ret
