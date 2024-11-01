
../../vmlinux:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_skernel>:
    .extern start_kernel
    .section .text.init
    .globl _start
_start:
    la sp, boot_stack_top
    80200000:	00003117          	auipc	sp,0x3
    80200004:	05013103          	ld	sp,80(sp) # 80203050 <_GLOBAL_OFFSET_TABLE_+0x18>

    call mm_init
    80200008:	3a4000ef          	jal	802003ac <mm_init>
    
    call task_init
    8020000c:	3e4000ef          	jal	802003f0 <task_init>
    
    la t0, _traps
    80200010:	00003297          	auipc	t0,0x3
    80200014:	0502b283          	ld	t0,80(t0) # 80203060 <_GLOBAL_OFFSET_TABLE_+0x28>
    csrw stvec, t0
    80200018:	10529073          	csrw	stvec,t0

    li t1, (1 << 5)
    8020001c:	02000313          	li	t1,32
    csrs sie, t1
    80200020:	10432073          	csrs	sie,t1

    rdtime t0
    80200024:	c01022f3          	rdtime	t0
    li t1, 10000000
    80200028:	00989337          	lui	t1,0x989
    8020002c:	6803031b          	addw	t1,t1,1664 # 989680 <_skernel-0x7f876980>
    add a0, t0, t1
    80200030:	00628533          	add	a0,t0,t1
    call sbi_set_timer
    80200034:	475000ef          	jal	80200ca8 <sbi_set_timer>

    li t1, (1 << 1)
    80200038:	00200313          	li	t1,2
    csrs sstatus, t1
    8020003c:	10032073          	csrs	sstatus,t1
    
    j start_kernel
    80200040:	5650006f          	j	80200da4 <start_kernel>

0000000080200044 <__switch_to>:
    .globl _traps 
    .extern dummy
    .globl __dummy
    .globl __switch_to
__switch_to:
    sd ra, 32(a0)
    80200044:	02153023          	sd	ra,32(a0)
    sd sp, 40(a0)
    80200048:	02253423          	sd	sp,40(a0)
    sd s0, 48(a0)
    8020004c:	02853823          	sd	s0,48(a0)
    sd s1, 56(a0)
    80200050:	02953c23          	sd	s1,56(a0)
    sd s2, 64(a0)
    80200054:	05253023          	sd	s2,64(a0)
    sd s3, 72(a0)
    80200058:	05353423          	sd	s3,72(a0)
    sd s4, 80(a0)
    8020005c:	05453823          	sd	s4,80(a0)
    sd s5, 88(a0)
    80200060:	05553c23          	sd	s5,88(a0)
    sd s6, 96(a0)
    80200064:	07653023          	sd	s6,96(a0)
    sd s7, 104(a0)
    80200068:	07753423          	sd	s7,104(a0)
    sd s8, 112(a0)
    8020006c:	07853823          	sd	s8,112(a0)
    sd s9, 120(a0)
    80200070:	07953c23          	sd	s9,120(a0)
    sd s10, 128(a0)
    80200074:	09a53023          	sd	s10,128(a0)
    sd s11, 136(a0)
    80200078:	09b53423          	sd	s11,136(a0)

    ld ra, 32(a1)
    8020007c:	0205b083          	ld	ra,32(a1)
    ld sp, 40(a1)
    80200080:	0285b103          	ld	sp,40(a1)
    ld s0, 48(a1)
    80200084:	0305b403          	ld	s0,48(a1)
    ld s1, 56(a1)
    80200088:	0385b483          	ld	s1,56(a1)
    ld s2, 64(a1)
    8020008c:	0405b903          	ld	s2,64(a1)
    ld s3, 72(a1)
    80200090:	0485b983          	ld	s3,72(a1)
    ld s4, 80(a1)
    80200094:	0505ba03          	ld	s4,80(a1)
    ld s5, 88(a1)
    80200098:	0585ba83          	ld	s5,88(a1)
    ld s6, 96(a1)
    8020009c:	0605bb03          	ld	s6,96(a1)
    ld s7, 104(a1)
    802000a0:	0685bb83          	ld	s7,104(a1)
    ld s8, 112(a1)
    802000a4:	0705bc03          	ld	s8,112(a1)
    ld s9, 120(a1)
    802000a8:	0785bc83          	ld	s9,120(a1)
    ld s10, 128(a1)
    802000ac:	0805bd03          	ld	s10,128(a1)
    ld s11, 136(a1)
    802000b0:	0885bd83          	ld	s11,136(a1)
    ret
    802000b4:	00008067          	ret

00000000802000b8 <__dummy>:
__dummy:
    la t0, dummy
    802000b8:	00003297          	auipc	t0,0x3
    802000bc:	fa02b283          	ld	t0,-96(t0) # 80203058 <_GLOBAL_OFFSET_TABLE_+0x20>
    csrw sepc, t0
    802000c0:	14129073          	csrw	sepc,t0
    sret
    802000c4:	10200073          	sret

00000000802000c8 <_traps>:
_traps:
    sd ra, -8(sp)
    802000c8:	fe113c23          	sd	ra,-8(sp)
    sd gp, -16(sp)
    802000cc:	fe313823          	sd	gp,-16(sp)
    sd tp, -24(sp)
    802000d0:	fe413423          	sd	tp,-24(sp)
    sd t0, -32(sp)
    802000d4:	fe513023          	sd	t0,-32(sp)
    sd t1, -40(sp)
    802000d8:	fc613c23          	sd	t1,-40(sp)
    sd t2, -48(sp)
    802000dc:	fc713823          	sd	t2,-48(sp)
    sd s0, -56(sp)
    802000e0:	fc813423          	sd	s0,-56(sp)
    sd s1, -64(sp)
    802000e4:	fc913023          	sd	s1,-64(sp)
    sd a0, -72(sp)
    802000e8:	faa13c23          	sd	a0,-72(sp)
    sd a1, -80(sp)
    802000ec:	fab13823          	sd	a1,-80(sp)
    sd a2, -88(sp)
    802000f0:	fac13423          	sd	a2,-88(sp)
    sd a3, -96(sp)
    802000f4:	fad13023          	sd	a3,-96(sp)
    sd a4, -104(sp)
    802000f8:	f8e13c23          	sd	a4,-104(sp)
    sd a5, -112(sp)
    802000fc:	f8f13823          	sd	a5,-112(sp)
    sd a6, -120(sp)
    80200100:	f9013423          	sd	a6,-120(sp)
    sd a7, -128(sp)
    80200104:	f9113023          	sd	a7,-128(sp)
    sd s2, -136(sp)
    80200108:	f7213c23          	sd	s2,-136(sp)
    sd s3, -144(sp)
    8020010c:	f7313823          	sd	s3,-144(sp)
    sd s4, -152(sp)
    80200110:	f7413423          	sd	s4,-152(sp)
    sd s5, -160(sp)
    80200114:	f7513023          	sd	s5,-160(sp)
    sd s6, -168(sp)
    80200118:	f5613c23          	sd	s6,-168(sp)
    sd s7, -176(sp)
    8020011c:	f5713823          	sd	s7,-176(sp)
    sd s8, -184(sp)
    80200120:	f5813423          	sd	s8,-184(sp)
    sd s9, -192(sp)
    80200124:	f5913023          	sd	s9,-192(sp)
    sd s10, -200(sp)
    80200128:	f3a13c23          	sd	s10,-200(sp)
    sd s11, -208(sp)
    8020012c:	f3b13823          	sd	s11,-208(sp)
    sd t3, -216(sp)
    80200130:	f3c13423          	sd	t3,-216(sp)
    sd t4, -224(sp)
    80200134:	f3d13023          	sd	t4,-224(sp)
    sd t5, -232(sp)
    80200138:	f1e13c23          	sd	t5,-232(sp)
    sd t6, -240(sp)
    8020013c:	f1f13823          	sd	t6,-240(sp)
    sd sp, -248(sp)
    80200140:	f0213423          	sd	sp,-248(sp)
    addi sp, sp, -248
    80200144:	f0810113          	add	sp,sp,-248

    csrr a0, scause
    80200148:	14202573          	csrr	a0,scause
    csrr a1, sepc
    8020014c:	141025f3          	csrr	a1,sepc
    call trap_handler
    80200150:	3e5000ef          	jal	80200d34 <trap_handler>



    ld t6, 8(sp)
    80200154:	00813f83          	ld	t6,8(sp)
    ld t5, 16(sp)
    80200158:	01013f03          	ld	t5,16(sp)
    ld t4, 24(sp)
    8020015c:	01813e83          	ld	t4,24(sp)
    ld t3, 32(sp)
    80200160:	02013e03          	ld	t3,32(sp)
    ld s11, 40(sp)
    80200164:	02813d83          	ld	s11,40(sp)
    ld s10, 48(sp)
    80200168:	03013d03          	ld	s10,48(sp)
    ld s9, 56(sp)
    8020016c:	03813c83          	ld	s9,56(sp)
    ld s8, 64(sp)
    80200170:	04013c03          	ld	s8,64(sp)
    ld s7, 72(sp)
    80200174:	04813b83          	ld	s7,72(sp)
    ld s6, 80(sp)
    80200178:	05013b03          	ld	s6,80(sp)
    ld s5, 88(sp)
    8020017c:	05813a83          	ld	s5,88(sp)
    ld s4, 96(sp)
    80200180:	06013a03          	ld	s4,96(sp)
    ld s3, 104(sp)
    80200184:	06813983          	ld	s3,104(sp)
    ld s2, 112(sp)
    80200188:	07013903          	ld	s2,112(sp)
    ld a7, 120(sp)
    8020018c:	07813883          	ld	a7,120(sp)
    ld a6, 128(sp)
    80200190:	08013803          	ld	a6,128(sp)
    ld a5, 136(sp)
    80200194:	08813783          	ld	a5,136(sp)
    ld a4, 144(sp)
    80200198:	09013703          	ld	a4,144(sp)
    ld a3, 152(sp)
    8020019c:	09813683          	ld	a3,152(sp)
    ld a2, 160(sp)
    802001a0:	0a013603          	ld	a2,160(sp)
    ld a1, 168(sp)
    802001a4:	0a813583          	ld	a1,168(sp)
    ld a0, 176(sp)
    802001a8:	0b013503          	ld	a0,176(sp)
    ld s1, 184(sp)
    802001ac:	0b813483          	ld	s1,184(sp)
    ld s0, 192(sp)
    802001b0:	0c013403          	ld	s0,192(sp)
    ld t2, 200(sp)
    802001b4:	0c813383          	ld	t2,200(sp)
    ld t1, 208(sp)
    802001b8:	0d013303          	ld	t1,208(sp)
    ld t0, 216(sp)
    802001bc:	0d813283          	ld	t0,216(sp)
    ld tp, 224(sp)
    802001c0:	0e013203          	ld	tp,224(sp)
    ld gp, 232(sp)
    802001c4:	0e813183          	ld	gp,232(sp)
    ld ra, 240(sp)
    802001c8:	0f013083          	ld	ra,240(sp)
    ld sp, 0(sp)
    802001cc:	00013103          	ld	sp,0(sp)

    802001d0:	10200073          	sret

00000000802001d4 <get_cycles>:
#include "sbi.h"

// QEMU 中时钟的频率是 10MHz，也就是 1 秒钟相当于 10000000 个时钟周期
uint64_t TIMECLOCK = 10000000;

uint64_t get_cycles() {
    802001d4:	fe010113          	add	sp,sp,-32
    802001d8:	00813c23          	sd	s0,24(sp)
    802001dc:	02010413          	add	s0,sp,32
    // 编写内联汇编，使用 rdtime 获取 time 寄存器中（也就是 mtime 寄存器）的值并返回
    uint64_t mtime;
    asm volatile (
    802001e0:	c01027f3          	rdtime	a5
    802001e4:	fef43423          	sd	a5,-24(s0)
        "rdtime %[mtime]\n"
        : [mtime] "=r" (mtime)
        : : "memory"
    );
    return mtime;
    802001e8:	fe843783          	ld	a5,-24(s0)
}
    802001ec:	00078513          	mv	a0,a5
    802001f0:	01813403          	ld	s0,24(sp)
    802001f4:	02010113          	add	sp,sp,32
    802001f8:	00008067          	ret

00000000802001fc <clock_set_next_event>:

void clock_set_next_event() {
    802001fc:	fd010113          	add	sp,sp,-48
    80200200:	02113423          	sd	ra,40(sp)
    80200204:	02813023          	sd	s0,32(sp)
    80200208:	03010413          	add	s0,sp,48
    // 下一次时钟中断的时间点
    uint64_t next = get_cycles() + TIMECLOCK;
    8020020c:	fc9ff0ef          	jal	802001d4 <get_cycles>
    80200210:	00050713          	mv	a4,a0
    80200214:	00003797          	auipc	a5,0x3
    80200218:	dec78793          	add	a5,a5,-532 # 80203000 <TIMECLOCK>
    8020021c:	0007b783          	ld	a5,0(a5)
    80200220:	00f707b3          	add	a5,a4,a5
    80200224:	fef43423          	sd	a5,-24(s0)

    // 使用 sbi_set_timer 来完成对下一次时钟中断的设置
    struct sbiret ret = sbi_set_timer(next);
    80200228:	fe843503          	ld	a0,-24(s0)
    8020022c:	27d000ef          	jal	80200ca8 <sbi_set_timer>
    80200230:	00050713          	mv	a4,a0
    80200234:	00058793          	mv	a5,a1
    80200238:	fce43c23          	sd	a4,-40(s0)
    8020023c:	fef43023          	sd	a5,-32(s0)
    80200240:	00000013          	nop
    80200244:	02813083          	ld	ra,40(sp)
    80200248:	02013403          	ld	s0,32(sp)
    8020024c:	03010113          	add	sp,sp,48
    80200250:	00008067          	ret

0000000080200254 <kalloc>:

struct {
    struct run *freelist;
} kmem;

void *kalloc() {
    80200254:	fe010113          	add	sp,sp,-32
    80200258:	00113c23          	sd	ra,24(sp)
    8020025c:	00813823          	sd	s0,16(sp)
    80200260:	02010413          	add	s0,sp,32
    struct run *r;

    r = kmem.freelist;
    80200264:	00005797          	auipc	a5,0x5
    80200268:	d9c78793          	add	a5,a5,-612 # 80205000 <kmem>
    8020026c:	0007b783          	ld	a5,0(a5)
    80200270:	fef43423          	sd	a5,-24(s0)
    kmem.freelist = r->next;
    80200274:	fe843783          	ld	a5,-24(s0)
    80200278:	0007b703          	ld	a4,0(a5)
    8020027c:	00005797          	auipc	a5,0x5
    80200280:	d8478793          	add	a5,a5,-636 # 80205000 <kmem>
    80200284:	00e7b023          	sd	a4,0(a5)
    
    memset((void *)r, 0x0, PGSIZE);
    80200288:	00001637          	lui	a2,0x1
    8020028c:	00000593          	li	a1,0
    80200290:	fe843503          	ld	a0,-24(s0)
    80200294:	389010ef          	jal	80201e1c <memset>
    return (void *)r;
    80200298:	fe843783          	ld	a5,-24(s0)
}
    8020029c:	00078513          	mv	a0,a5
    802002a0:	01813083          	ld	ra,24(sp)
    802002a4:	01013403          	ld	s0,16(sp)
    802002a8:	02010113          	add	sp,sp,32
    802002ac:	00008067          	ret

00000000802002b0 <kfree>:

void kfree(void *addr) {
    802002b0:	fd010113          	add	sp,sp,-48
    802002b4:	02113423          	sd	ra,40(sp)
    802002b8:	02813023          	sd	s0,32(sp)
    802002bc:	03010413          	add	s0,sp,48
    802002c0:	fca43c23          	sd	a0,-40(s0)
    struct run *r;

    // PGSIZE align 
    *(uintptr_t *)&addr = (uintptr_t)addr & ~(PGSIZE - 1);
    802002c4:	fd843783          	ld	a5,-40(s0)
    802002c8:	00078693          	mv	a3,a5
    802002cc:	fd840793          	add	a5,s0,-40
    802002d0:	fffff737          	lui	a4,0xfffff
    802002d4:	00e6f733          	and	a4,a3,a4
    802002d8:	00e7b023          	sd	a4,0(a5)

    memset(addr, 0x0, (uint64_t)PGSIZE);
    802002dc:	fd843783          	ld	a5,-40(s0)
    802002e0:	00001637          	lui	a2,0x1
    802002e4:	00000593          	li	a1,0
    802002e8:	00078513          	mv	a0,a5
    802002ec:	331010ef          	jal	80201e1c <memset>

    r = (struct run *)addr;
    802002f0:	fd843783          	ld	a5,-40(s0)
    802002f4:	fef43423          	sd	a5,-24(s0)
    r->next = kmem.freelist;
    802002f8:	00005797          	auipc	a5,0x5
    802002fc:	d0878793          	add	a5,a5,-760 # 80205000 <kmem>
    80200300:	0007b703          	ld	a4,0(a5)
    80200304:	fe843783          	ld	a5,-24(s0)
    80200308:	00e7b023          	sd	a4,0(a5)
    kmem.freelist = r;
    8020030c:	00005797          	auipc	a5,0x5
    80200310:	cf478793          	add	a5,a5,-780 # 80205000 <kmem>
    80200314:	fe843703          	ld	a4,-24(s0)
    80200318:	00e7b023          	sd	a4,0(a5)

    return;
    8020031c:	00000013          	nop
}
    80200320:	02813083          	ld	ra,40(sp)
    80200324:	02013403          	ld	s0,32(sp)
    80200328:	03010113          	add	sp,sp,48
    8020032c:	00008067          	ret

0000000080200330 <kfreerange>:

void kfreerange(char *start, char *end) {
    80200330:	fd010113          	add	sp,sp,-48
    80200334:	02113423          	sd	ra,40(sp)
    80200338:	02813023          	sd	s0,32(sp)
    8020033c:	03010413          	add	s0,sp,48
    80200340:	fca43c23          	sd	a0,-40(s0)
    80200344:	fcb43823          	sd	a1,-48(s0)
    char *addr = (char *)PGROUNDUP((uintptr_t)start);
    80200348:	fd843703          	ld	a4,-40(s0)
    8020034c:	000017b7          	lui	a5,0x1
    80200350:	fff78793          	add	a5,a5,-1 # fff <_skernel-0x801ff001>
    80200354:	00f70733          	add	a4,a4,a5
    80200358:	fffff7b7          	lui	a5,0xfffff
    8020035c:	00f777b3          	and	a5,a4,a5
    80200360:	fef43423          	sd	a5,-24(s0)
    for (; (uintptr_t)(addr) + PGSIZE <= (uintptr_t)end; addr += PGSIZE) {
    80200364:	01c0006f          	j	80200380 <kfreerange+0x50>
        kfree((void *)addr);
    80200368:	fe843503          	ld	a0,-24(s0)
    8020036c:	f45ff0ef          	jal	802002b0 <kfree>
    for (; (uintptr_t)(addr) + PGSIZE <= (uintptr_t)end; addr += PGSIZE) {
    80200370:	fe843703          	ld	a4,-24(s0)
    80200374:	000017b7          	lui	a5,0x1
    80200378:	00f707b3          	add	a5,a4,a5
    8020037c:	fef43423          	sd	a5,-24(s0)
    80200380:	fe843703          	ld	a4,-24(s0)
    80200384:	000017b7          	lui	a5,0x1
    80200388:	00f70733          	add	a4,a4,a5
    8020038c:	fd043783          	ld	a5,-48(s0)
    80200390:	fce7fce3          	bgeu	a5,a4,80200368 <kfreerange+0x38>
    }
}
    80200394:	00000013          	nop
    80200398:	00000013          	nop
    8020039c:	02813083          	ld	ra,40(sp)
    802003a0:	02013403          	ld	s0,32(sp)
    802003a4:	03010113          	add	sp,sp,48
    802003a8:	00008067          	ret

00000000802003ac <mm_init>:

void mm_init(void) {
    802003ac:	ff010113          	add	sp,sp,-16
    802003b0:	00113423          	sd	ra,8(sp)
    802003b4:	00813023          	sd	s0,0(sp)
    802003b8:	01010413          	add	s0,sp,16
    kfreerange(_ekernel, (char *)PHY_END);
    802003bc:	01100793          	li	a5,17
    802003c0:	01b79593          	sll	a1,a5,0x1b
    802003c4:	00003517          	auipc	a0,0x3
    802003c8:	c7c53503          	ld	a0,-900(a0) # 80203040 <_GLOBAL_OFFSET_TABLE_+0x8>
    802003cc:	f65ff0ef          	jal	80200330 <kfreerange>
    printk("...mm_init done!\n");
    802003d0:	00002517          	auipc	a0,0x2
    802003d4:	c3050513          	add	a0,a0,-976 # 80202000 <_srodata>
    802003d8:	125010ef          	jal	80201cfc <printk>
}
    802003dc:	00000013          	nop
    802003e0:	00813083          	ld	ra,8(sp)
    802003e4:	00013403          	ld	s0,0(sp)
    802003e8:	01010113          	add	sp,sp,16
    802003ec:	00008067          	ret

00000000802003f0 <task_init>:

struct task_struct *idle;           // idle process
struct task_struct *current;        // 指向当前运行线程的 task_struct
struct task_struct *task[NR_TASKS]; // 线程数组，所有的线程都保存在此

void task_init() {
    802003f0:	fe010113          	add	sp,sp,-32
    802003f4:	00113c23          	sd	ra,24(sp)
    802003f8:	00813823          	sd	s0,16(sp)
    802003fc:	02010413          	add	s0,sp,32
    srand(2024);
    80200400:	7e800513          	li	a0,2024
    80200404:	179010ef          	jal	80201d7c <srand>

    // 1. 调用 kalloc() 为 idle 分配一个物理页
    idle = (struct task_struct*)kalloc();
    80200408:	e4dff0ef          	jal	80200254 <kalloc>
    8020040c:	00050713          	mv	a4,a0
    80200410:	00005797          	auipc	a5,0x5
    80200414:	bf878793          	add	a5,a5,-1032 # 80205008 <idle>
    80200418:	00e7b023          	sd	a4,0(a5)
    // idle->thread.sp = (uint64_t)idle + PGSIZE;
    // idle->thread.ra = (uint64_t)__dummy;
    // 2. 设置 state 为 TASK_RUNNING;
    idle->state = TASK_RUNNING;
    8020041c:	00005797          	auipc	a5,0x5
    80200420:	bec78793          	add	a5,a5,-1044 # 80205008 <idle>
    80200424:	0007b783          	ld	a5,0(a5)
    80200428:	0007b023          	sd	zero,0(a5)
    // 3. 由于 idle 不参与调度，可以将其 counter / priority 设置为 0
    idle->counter = 0;
    8020042c:	00005797          	auipc	a5,0x5
    80200430:	bdc78793          	add	a5,a5,-1060 # 80205008 <idle>
    80200434:	0007b783          	ld	a5,0(a5)
    80200438:	0007b423          	sd	zero,8(a5)
    idle->priority = 0;
    8020043c:	00005797          	auipc	a5,0x5
    80200440:	bcc78793          	add	a5,a5,-1076 # 80205008 <idle>
    80200444:	0007b783          	ld	a5,0(a5)
    80200448:	0007b823          	sd	zero,16(a5)
    // 4. 设置 idle 的 pid 为 0
    idle->pid = 0;
    8020044c:	00005797          	auipc	a5,0x5
    80200450:	bbc78793          	add	a5,a5,-1092 # 80205008 <idle>
    80200454:	0007b783          	ld	a5,0(a5)
    80200458:	0007bc23          	sd	zero,24(a5)
    // 5. 将 current 和 task[0] 指向 idle
    current = idle;
    8020045c:	00005797          	auipc	a5,0x5
    80200460:	bac78793          	add	a5,a5,-1108 # 80205008 <idle>
    80200464:	0007b703          	ld	a4,0(a5)
    80200468:	00005797          	auipc	a5,0x5
    8020046c:	ba878793          	add	a5,a5,-1112 # 80205010 <current>
    80200470:	00e7b023          	sd	a4,0(a5)
    task[0] = idle;
    80200474:	00005797          	auipc	a5,0x5
    80200478:	b9478793          	add	a5,a5,-1132 # 80205008 <idle>
    8020047c:	0007b703          	ld	a4,0(a5)
    80200480:	00005797          	auipc	a5,0x5
    80200484:	b9878793          	add	a5,a5,-1128 # 80205018 <task>
    80200488:	00e7b023          	sd	a4,0(a5)
    //     - counter  = 0;
    //     - priority = rand() 产生的随机数（控制范围在 [PRIORITY_MIN, PRIORITY_MAX] 之间）
    // 3. 为 task[1] ~ task[NR_TASKS - 1] 设置 thread_struct 中的 ra 和 sp
    //     - ra 设置为 __dummy（见 4.2.2）的地址
    //     - sp 设置为该线程申请的物理页的高地址
    for (int i = 1; i < NR_TASKS; i ++) {
    8020048c:	00100793          	li	a5,1
    80200490:	fef42623          	sw	a5,-20(s0)
    80200494:	12c0006f          	j	802005c0 <task_init+0x1d0>
        task[i] = (struct task_struct*)kalloc();
    80200498:	dbdff0ef          	jal	80200254 <kalloc>
    8020049c:	00050693          	mv	a3,a0
    802004a0:	00005717          	auipc	a4,0x5
    802004a4:	b7870713          	add	a4,a4,-1160 # 80205018 <task>
    802004a8:	fec42783          	lw	a5,-20(s0)
    802004ac:	00379793          	sll	a5,a5,0x3
    802004b0:	00f707b3          	add	a5,a4,a5
    802004b4:	00d7b023          	sd	a3,0(a5)
        task[i]->thread.sp = (uint64_t)task[i] + PGSIZE;
    802004b8:	00005717          	auipc	a4,0x5
    802004bc:	b6070713          	add	a4,a4,-1184 # 80205018 <task>
    802004c0:	fec42783          	lw	a5,-20(s0)
    802004c4:	00379793          	sll	a5,a5,0x3
    802004c8:	00f707b3          	add	a5,a4,a5
    802004cc:	0007b783          	ld	a5,0(a5)
    802004d0:	00078693          	mv	a3,a5
    802004d4:	00005717          	auipc	a4,0x5
    802004d8:	b4470713          	add	a4,a4,-1212 # 80205018 <task>
    802004dc:	fec42783          	lw	a5,-20(s0)
    802004e0:	00379793          	sll	a5,a5,0x3
    802004e4:	00f707b3          	add	a5,a4,a5
    802004e8:	0007b783          	ld	a5,0(a5)
    802004ec:	00001737          	lui	a4,0x1
    802004f0:	00e68733          	add	a4,a3,a4
    802004f4:	02e7b423          	sd	a4,40(a5)
        task[i]->thread.ra = (uint64_t)__dummy;
    802004f8:	00005717          	auipc	a4,0x5
    802004fc:	b2070713          	add	a4,a4,-1248 # 80205018 <task>
    80200500:	fec42783          	lw	a5,-20(s0)
    80200504:	00379793          	sll	a5,a5,0x3
    80200508:	00f707b3          	add	a5,a4,a5
    8020050c:	0007b783          	ld	a5,0(a5)
    80200510:	00003717          	auipc	a4,0x3
    80200514:	b3873703          	ld	a4,-1224(a4) # 80203048 <_GLOBAL_OFFSET_TABLE_+0x10>
    80200518:	02e7b023          	sd	a4,32(a5)
        task[i]->state = TASK_RUNNING;
    8020051c:	00005717          	auipc	a4,0x5
    80200520:	afc70713          	add	a4,a4,-1284 # 80205018 <task>
    80200524:	fec42783          	lw	a5,-20(s0)
    80200528:	00379793          	sll	a5,a5,0x3
    8020052c:	00f707b3          	add	a5,a4,a5
    80200530:	0007b783          	ld	a5,0(a5)
    80200534:	0007b023          	sd	zero,0(a5)
        task[i]->counter = 0;
    80200538:	00005717          	auipc	a4,0x5
    8020053c:	ae070713          	add	a4,a4,-1312 # 80205018 <task>
    80200540:	fec42783          	lw	a5,-20(s0)
    80200544:	00379793          	sll	a5,a5,0x3
    80200548:	00f707b3          	add	a5,a4,a5
    8020054c:	0007b783          	ld	a5,0(a5)
    80200550:	0007b423          	sd	zero,8(a5)
        task[i]->priority = PRIORITY_MIN + rand() % (PRIORITY_MAX - PRIORITY_MIN + 1);
    80200554:	06d010ef          	jal	80201dc0 <rand>
    80200558:	00050793          	mv	a5,a0
    8020055c:	00078713          	mv	a4,a5
    80200560:	00a00793          	li	a5,10
    80200564:	02f767bb          	remw	a5,a4,a5
    80200568:	0007879b          	sext.w	a5,a5
    8020056c:	0017879b          	addw	a5,a5,1
    80200570:	0007869b          	sext.w	a3,a5
    80200574:	00005717          	auipc	a4,0x5
    80200578:	aa470713          	add	a4,a4,-1372 # 80205018 <task>
    8020057c:	fec42783          	lw	a5,-20(s0)
    80200580:	00379793          	sll	a5,a5,0x3
    80200584:	00f707b3          	add	a5,a4,a5
    80200588:	0007b783          	ld	a5,0(a5)
    8020058c:	00068713          	mv	a4,a3
    80200590:	00e7b823          	sd	a4,16(a5)
        task[i]->pid = i;
    80200594:	00005717          	auipc	a4,0x5
    80200598:	a8470713          	add	a4,a4,-1404 # 80205018 <task>
    8020059c:	fec42783          	lw	a5,-20(s0)
    802005a0:	00379793          	sll	a5,a5,0x3
    802005a4:	00f707b3          	add	a5,a4,a5
    802005a8:	0007b783          	ld	a5,0(a5)
    802005ac:	fec42703          	lw	a4,-20(s0)
    802005b0:	00e7bc23          	sd	a4,24(a5)
    for (int i = 1; i < NR_TASKS; i ++) {
    802005b4:	fec42783          	lw	a5,-20(s0)
    802005b8:	0017879b          	addw	a5,a5,1
    802005bc:	fef42623          	sw	a5,-20(s0)
    802005c0:	fec42783          	lw	a5,-20(s0)
    802005c4:	0007871b          	sext.w	a4,a5
    802005c8:	00400793          	li	a5,4
    802005cc:	ece7d6e3          	bge	a5,a4,80200498 <task_init+0xa8>
    }
    

    /* YOUR CODE HERE */

    printk("...task_init done!\n");
    802005d0:	00002517          	auipc	a0,0x2
    802005d4:	a4850513          	add	a0,a0,-1464 # 80202018 <_srodata+0x18>
    802005d8:	724010ef          	jal	80201cfc <printk>
}
    802005dc:	00000013          	nop
    802005e0:	01813083          	ld	ra,24(sp)
    802005e4:	01013403          	ld	s0,16(sp)
    802005e8:	02010113          	add	sp,sp,32
    802005ec:	00008067          	ret

00000000802005f0 <switch_to>:
extern void __switch_to(struct task_struct *prev, struct task_struct *next);
/*判断下一个执行的线程 next 与当前的线程 current 是否为同一个线程，
如果是同一个线程，则无需做任何处理，否则调用 __switch_to 进行线程切换 */
void switch_to(struct task_struct *next) {
    802005f0:	fd010113          	add	sp,sp,-48
    802005f4:	02113423          	sd	ra,40(sp)
    802005f8:	02813023          	sd	s0,32(sp)
    802005fc:	03010413          	add	s0,sp,48
    80200600:	fca43c23          	sd	a0,-40(s0)
    // YOUR CODE HERE
    if (current != next) {
    80200604:	00005797          	auipc	a5,0x5
    80200608:	a0c78793          	add	a5,a5,-1524 # 80205010 <current>
    8020060c:	0007b783          	ld	a5,0(a5)
    80200610:	fd843703          	ld	a4,-40(s0)
    80200614:	02f70863          	beq	a4,a5,80200644 <switch_to+0x54>
        struct task_struct *prev = current;
    80200618:	00005797          	auipc	a5,0x5
    8020061c:	9f878793          	add	a5,a5,-1544 # 80205010 <current>
    80200620:	0007b783          	ld	a5,0(a5)
    80200624:	fef43423          	sd	a5,-24(s0)
        // printk("switch now!\n");
        // 因为 __switch_to 改变了 ra，所以得在前面赋值
        current = next;
    80200628:	00005797          	auipc	a5,0x5
    8020062c:	9e878793          	add	a5,a5,-1560 # 80205010 <current>
    80200630:	fd843703          	ld	a4,-40(s0)
    80200634:	00e7b023          	sd	a4,0(a5)
        __switch_to(prev, next);
    80200638:	fd843583          	ld	a1,-40(s0)
    8020063c:	fe843503          	ld	a0,-24(s0)
    80200640:	a05ff0ef          	jal	80200044 <__switch_to>
    }
}
    80200644:	00000013          	nop
    80200648:	02813083          	ld	ra,40(sp)
    8020064c:	02013403          	ld	s0,32(sp)
    80200650:	03010113          	add	sp,sp,48
    80200654:	00008067          	ret

0000000080200658 <do_timer>:

/* 在时钟中断处理中被调用，用于判断是否需要进行调度 */
void do_timer() {
    80200658:	ff010113          	add	sp,sp,-16
    8020065c:	00113423          	sd	ra,8(sp)
    80200660:	00813023          	sd	s0,0(sp)
    80200664:	01010413          	add	s0,sp,16
    if (current == idle || current->counter == 0) { // 1. 如果当前线程是 idle 线程或当前线程时间片耗尽则直接进行调度
    80200668:	00005797          	auipc	a5,0x5
    8020066c:	9a878793          	add	a5,a5,-1624 # 80205010 <current>
    80200670:	0007b703          	ld	a4,0(a5)
    80200674:	00005797          	auipc	a5,0x5
    80200678:	99478793          	add	a5,a5,-1644 # 80205008 <idle>
    8020067c:	0007b783          	ld	a5,0(a5)
    80200680:	00f70c63          	beq	a4,a5,80200698 <do_timer+0x40>
    80200684:	00005797          	auipc	a5,0x5
    80200688:	98c78793          	add	a5,a5,-1652 # 80205010 <current>
    8020068c:	0007b783          	ld	a5,0(a5)
    80200690:	0087b783          	ld	a5,8(a5)
    80200694:	00079663          	bnez	a5,802006a0 <do_timer+0x48>
        // printk("schedule!\n");
        schedule();
    80200698:	050000ef          	jal	802006e8 <schedule>
    8020069c:	03c0006f          	j	802006d8 <do_timer+0x80>
    } else { // 2. 否则对当前线程的运行剩余时间减 1，若剩余时间仍然大于 0 则直接返回，否则进行调度
         current->counter --;
    802006a0:	00005797          	auipc	a5,0x5
    802006a4:	97078793          	add	a5,a5,-1680 # 80205010 <current>
    802006a8:	0007b783          	ld	a5,0(a5)
    802006ac:	0087b703          	ld	a4,8(a5)
    802006b0:	fff70713          	add	a4,a4,-1
    802006b4:	00e7b423          	sd	a4,8(a5)
        if (current->counter > 0) return ;
    802006b8:	00005797          	auipc	a5,0x5
    802006bc:	95878793          	add	a5,a5,-1704 # 80205010 <current>
    802006c0:	0007b783          	ld	a5,0(a5)
    802006c4:	0087b783          	ld	a5,8(a5)
    802006c8:	00079663          	bnez	a5,802006d4 <do_timer+0x7c>
        else schedule();
    802006cc:	01c000ef          	jal	802006e8 <schedule>
    802006d0:	0080006f          	j	802006d8 <do_timer+0x80>
        if (current->counter > 0) return ;
    802006d4:	00000013          	nop
    }
    // YOUR CODE HERE
}
    802006d8:	00813083          	ld	ra,8(sp)
    802006dc:	00013403          	ld	s0,0(sp)
    802006e0:	01010113          	add	sp,sp,16
    802006e4:	00008067          	ret

00000000802006e8 <schedule>:

/* 调度程序，选择出下一个运行的线程 */
void schedule() {
    802006e8:	fe010113          	add	sp,sp,-32
    802006ec:	00113c23          	sd	ra,24(sp)
    802006f0:	00813823          	sd	s0,16(sp)
    802006f4:	02010413          	add	s0,sp,32
    int k = 0;
    802006f8:	fe042623          	sw	zero,-20(s0)
    for (int i = 1; i < NR_TASKS; i ++) { // 调度时选择 counter 最大的线程运行
    802006fc:	00100793          	li	a5,1
    80200700:	fef42423          	sw	a5,-24(s0)
    80200704:	08c0006f          	j	80200790 <schedule+0xa8>
        if (task[i]->counter > 0) {
    80200708:	00005717          	auipc	a4,0x5
    8020070c:	91070713          	add	a4,a4,-1776 # 80205018 <task>
    80200710:	fe842783          	lw	a5,-24(s0)
    80200714:	00379793          	sll	a5,a5,0x3
    80200718:	00f707b3          	add	a5,a4,a5
    8020071c:	0007b783          	ld	a5,0(a5)
    80200720:	0087b783          	ld	a5,8(a5)
    80200724:	06078063          	beqz	a5,80200784 <schedule+0x9c>
            if (k == 0) k = i;
    80200728:	fec42783          	lw	a5,-20(s0)
    8020072c:	0007879b          	sext.w	a5,a5
    80200730:	00079863          	bnez	a5,80200740 <schedule+0x58>
    80200734:	fe842783          	lw	a5,-24(s0)
    80200738:	fef42623          	sw	a5,-20(s0)
    8020073c:	0480006f          	j	80200784 <schedule+0x9c>
            else if (task[i]->counter > task[k]->counter) {
    80200740:	00005717          	auipc	a4,0x5
    80200744:	8d870713          	add	a4,a4,-1832 # 80205018 <task>
    80200748:	fe842783          	lw	a5,-24(s0)
    8020074c:	00379793          	sll	a5,a5,0x3
    80200750:	00f707b3          	add	a5,a4,a5
    80200754:	0007b783          	ld	a5,0(a5)
    80200758:	0087b703          	ld	a4,8(a5)
    8020075c:	00005697          	auipc	a3,0x5
    80200760:	8bc68693          	add	a3,a3,-1860 # 80205018 <task>
    80200764:	fec42783          	lw	a5,-20(s0)
    80200768:	00379793          	sll	a5,a5,0x3
    8020076c:	00f687b3          	add	a5,a3,a5
    80200770:	0007b783          	ld	a5,0(a5)
    80200774:	0087b783          	ld	a5,8(a5)
    80200778:	00e7f663          	bgeu	a5,a4,80200784 <schedule+0x9c>
                k = i;
    8020077c:	fe842783          	lw	a5,-24(s0)
    80200780:	fef42623          	sw	a5,-20(s0)
    for (int i = 1; i < NR_TASKS; i ++) { // 调度时选择 counter 最大的线程运行
    80200784:	fe842783          	lw	a5,-24(s0)
    80200788:	0017879b          	addw	a5,a5,1
    8020078c:	fef42423          	sw	a5,-24(s0)
    80200790:	fe842783          	lw	a5,-24(s0)
    80200794:	0007871b          	sext.w	a4,a5
    80200798:	00400793          	li	a5,4
    8020079c:	f6e7d6e3          	bge	a5,a4,80200708 <schedule+0x20>
            }
        }
        // printk("i = %d, counter = %d\n", i, task[i]->counter);
    }
    // printk("k = %d, counter = %d\n", k, task[k]->counter);
    if (k == 0) { // 如果所有线程 counter 都为 0，则令所有线程 counter = priority
    802007a0:	fec42783          	lw	a5,-20(s0)
    802007a4:	0007879b          	sext.w	a5,a5
    802007a8:	0a079e63          	bnez	a5,80200864 <schedule+0x17c>
        for (int i = 1; i < NR_TASKS; i ++) { // 调度时选择 counter 最大的线程运行
    802007ac:	00100793          	li	a5,1
    802007b0:	fef42223          	sw	a5,-28(s0)
    802007b4:	0980006f          	j	8020084c <schedule+0x164>
            task[i]->counter = task[i]->priority;
    802007b8:	00005717          	auipc	a4,0x5
    802007bc:	86070713          	add	a4,a4,-1952 # 80205018 <task>
    802007c0:	fe442783          	lw	a5,-28(s0)
    802007c4:	00379793          	sll	a5,a5,0x3
    802007c8:	00f707b3          	add	a5,a4,a5
    802007cc:	0007b703          	ld	a4,0(a5)
    802007d0:	00005697          	auipc	a3,0x5
    802007d4:	84868693          	add	a3,a3,-1976 # 80205018 <task>
    802007d8:	fe442783          	lw	a5,-28(s0)
    802007dc:	00379793          	sll	a5,a5,0x3
    802007e0:	00f687b3          	add	a5,a3,a5
    802007e4:	0007b783          	ld	a5,0(a5)
    802007e8:	01073703          	ld	a4,16(a4)
    802007ec:	00e7b423          	sd	a4,8(a5)
            printk("SET [PID = %d PRIORITY = %d COUNTER = %d]\n", i, task[i]->priority, task[i]->counter);
    802007f0:	00005717          	auipc	a4,0x5
    802007f4:	82870713          	add	a4,a4,-2008 # 80205018 <task>
    802007f8:	fe442783          	lw	a5,-28(s0)
    802007fc:	00379793          	sll	a5,a5,0x3
    80200800:	00f707b3          	add	a5,a4,a5
    80200804:	0007b783          	ld	a5,0(a5)
    80200808:	0107b603          	ld	a2,16(a5)
    8020080c:	00005717          	auipc	a4,0x5
    80200810:	80c70713          	add	a4,a4,-2036 # 80205018 <task>
    80200814:	fe442783          	lw	a5,-28(s0)
    80200818:	00379793          	sll	a5,a5,0x3
    8020081c:	00f707b3          	add	a5,a4,a5
    80200820:	0007b783          	ld	a5,0(a5)
    80200824:	0087b703          	ld	a4,8(a5)
    80200828:	fe442783          	lw	a5,-28(s0)
    8020082c:	00070693          	mv	a3,a4
    80200830:	00078593          	mv	a1,a5
    80200834:	00001517          	auipc	a0,0x1
    80200838:	7fc50513          	add	a0,a0,2044 # 80202030 <_srodata+0x30>
    8020083c:	4c0010ef          	jal	80201cfc <printk>
        for (int i = 1; i < NR_TASKS; i ++) { // 调度时选择 counter 最大的线程运行
    80200840:	fe442783          	lw	a5,-28(s0)
    80200844:	0017879b          	addw	a5,a5,1
    80200848:	fef42223          	sw	a5,-28(s0)
    8020084c:	fe442783          	lw	a5,-28(s0)
    80200850:	0007871b          	sext.w	a4,a5
    80200854:	00400793          	li	a5,4
    80200858:	f6e7d0e3          	bge	a5,a4,802007b8 <schedule+0xd0>
        }
        schedule();
    8020085c:	e8dff0ef          	jal	802006e8 <schedule>
        return ;
    80200860:	0240006f          	j	80200884 <schedule+0x19c>
    }
    switch_to(task[k]);
    80200864:	00004717          	auipc	a4,0x4
    80200868:	7b470713          	add	a4,a4,1972 # 80205018 <task>
    8020086c:	fec42783          	lw	a5,-20(s0)
    80200870:	00379793          	sll	a5,a5,0x3
    80200874:	00f707b3          	add	a5,a4,a5
    80200878:	0007b783          	ld	a5,0(a5)
    8020087c:	00078513          	mv	a0,a5
    80200880:	d71ff0ef          	jal	802005f0 <switch_to>
}
    80200884:	01813083          	ld	ra,24(sp)
    80200888:	01013403          	ld	s0,16(sp)
    8020088c:	02010113          	add	sp,sp,32
    80200890:	00008067          	ret

0000000080200894 <dummy>:
int tasks_output_index = 0;
char expected_output[] = "2222222222111111133334222222222211111113";
#include "sbi.h"
#endif

void dummy() {
    80200894:	fd010113          	add	sp,sp,-48
    80200898:	02113423          	sd	ra,40(sp)
    8020089c:	02813023          	sd	s0,32(sp)
    802008a0:	03010413          	add	s0,sp,48
    uint64_t MOD = 1000000007;
    802008a4:	3b9ad7b7          	lui	a5,0x3b9ad
    802008a8:	a0778793          	add	a5,a5,-1529 # 3b9aca07 <_skernel-0x448535f9>
    802008ac:	fcf43c23          	sd	a5,-40(s0)
    uint64_t auto_inc_local_var = 0;
    802008b0:	fe043423          	sd	zero,-24(s0)
    int last_counter = -1;
    802008b4:	fff00793          	li	a5,-1
    802008b8:	fef42223          	sw	a5,-28(s0)
    // printk("dummy!");
    while (1) {
        if ((last_counter == -1 || current->counter != last_counter) && current->counter > 0) {
    802008bc:	fe442783          	lw	a5,-28(s0)
    802008c0:	0007871b          	sext.w	a4,a5
    802008c4:	fff00793          	li	a5,-1
    802008c8:	00f70e63          	beq	a4,a5,802008e4 <dummy+0x50>
    802008cc:	00004797          	auipc	a5,0x4
    802008d0:	74478793          	add	a5,a5,1860 # 80205010 <current>
    802008d4:	0007b783          	ld	a5,0(a5)
    802008d8:	0087b703          	ld	a4,8(a5)
    802008dc:	fe442783          	lw	a5,-28(s0)
    802008e0:	fcf70ee3          	beq	a4,a5,802008bc <dummy+0x28>
    802008e4:	00004797          	auipc	a5,0x4
    802008e8:	72c78793          	add	a5,a5,1836 # 80205010 <current>
    802008ec:	0007b783          	ld	a5,0(a5)
    802008f0:	0087b783          	ld	a5,8(a5)
    802008f4:	fc0784e3          	beqz	a5,802008bc <dummy+0x28>
            if (current->counter == 1) {
    802008f8:	00004797          	auipc	a5,0x4
    802008fc:	71878793          	add	a5,a5,1816 # 80205010 <current>
    80200900:	0007b783          	ld	a5,0(a5)
    80200904:	0087b703          	ld	a4,8(a5)
    80200908:	00100793          	li	a5,1
    8020090c:	00f71e63          	bne	a4,a5,80200928 <dummy+0x94>
                --(current->counter);   // forced the counter to be zero if this thread is going to be scheduled
    80200910:	00004797          	auipc	a5,0x4
    80200914:	70078793          	add	a5,a5,1792 # 80205010 <current>
    80200918:	0007b783          	ld	a5,0(a5)
    8020091c:	0087b703          	ld	a4,8(a5)
    80200920:	fff70713          	add	a4,a4,-1
    80200924:	00e7b423          	sd	a4,8(a5)
            }                           // in case that the new counter is also 1, leading the information not printed.
            last_counter = current->counter;
    80200928:	00004797          	auipc	a5,0x4
    8020092c:	6e878793          	add	a5,a5,1768 # 80205010 <current>
    80200930:	0007b783          	ld	a5,0(a5)
    80200934:	0087b783          	ld	a5,8(a5)
    80200938:	fef42223          	sw	a5,-28(s0)
            auto_inc_local_var = (auto_inc_local_var + 1) % MOD;
    8020093c:	fe843783          	ld	a5,-24(s0)
    80200940:	00178713          	add	a4,a5,1
    80200944:	fd843783          	ld	a5,-40(s0)
    80200948:	02f777b3          	remu	a5,a4,a5
    8020094c:	fef43423          	sd	a5,-24(s0)
            printk("[PID = %d] is running. COUNTER = %d, auto_inc_local_var = %d\n", current->pid, current->counter, auto_inc_local_var);
    80200950:	00004797          	auipc	a5,0x4
    80200954:	6c078793          	add	a5,a5,1728 # 80205010 <current>
    80200958:	0007b783          	ld	a5,0(a5)
    8020095c:	0187b703          	ld	a4,24(a5)
    80200960:	00004797          	auipc	a5,0x4
    80200964:	6b078793          	add	a5,a5,1712 # 80205010 <current>
    80200968:	0007b783          	ld	a5,0(a5)
    8020096c:	0087b783          	ld	a5,8(a5)
    80200970:	fe843683          	ld	a3,-24(s0)
    80200974:	00078613          	mv	a2,a5
    80200978:	00070593          	mv	a1,a4
    8020097c:	00001517          	auipc	a0,0x1
    80200980:	6e450513          	add	a0,a0,1764 # 80202060 <_srodata+0x60>
    80200984:	378010ef          	jal	80201cfc <printk>
            #if TEST_SCHED
            tasks_output[tasks_output_index++] = current->pid + '0';
    80200988:	00004797          	auipc	a5,0x4
    8020098c:	68878793          	add	a5,a5,1672 # 80205010 <current>
    80200990:	0007b783          	ld	a5,0(a5)
    80200994:	0187b783          	ld	a5,24(a5)
    80200998:	0ff7f713          	zext.b	a4,a5
    8020099c:	00004797          	auipc	a5,0x4
    802009a0:	6cc78793          	add	a5,a5,1740 # 80205068 <tasks_output_index>
    802009a4:	0007a783          	lw	a5,0(a5)
    802009a8:	0017869b          	addw	a3,a5,1
    802009ac:	0006861b          	sext.w	a2,a3
    802009b0:	00004697          	auipc	a3,0x4
    802009b4:	6b868693          	add	a3,a3,1720 # 80205068 <tasks_output_index>
    802009b8:	00c6a023          	sw	a2,0(a3)
    802009bc:	0307071b          	addw	a4,a4,48
    802009c0:	0ff77713          	zext.b	a4,a4
    802009c4:	00004697          	auipc	a3,0x4
    802009c8:	67c68693          	add	a3,a3,1660 # 80205040 <tasks_output>
    802009cc:	00f687b3          	add	a5,a3,a5
    802009d0:	00e78023          	sb	a4,0(a5)
            if (tasks_output_index == MAX_OUTPUT) {
    802009d4:	00004797          	auipc	a5,0x4
    802009d8:	69478793          	add	a5,a5,1684 # 80205068 <tasks_output_index>
    802009dc:	0007a783          	lw	a5,0(a5)
    802009e0:	00078713          	mv	a4,a5
    802009e4:	02800793          	li	a5,40
    802009e8:	ecf71ae3          	bne	a4,a5,802008bc <dummy+0x28>
                for (int i = 0; i < MAX_OUTPUT; ++i) {
    802009ec:	fe042023          	sw	zero,-32(s0)
    802009f0:	0800006f          	j	80200a70 <dummy+0x1dc>
                    if (tasks_output[i] != expected_output[i]) {
    802009f4:	00004717          	auipc	a4,0x4
    802009f8:	64c70713          	add	a4,a4,1612 # 80205040 <tasks_output>
    802009fc:	fe042783          	lw	a5,-32(s0)
    80200a00:	00f707b3          	add	a5,a4,a5
    80200a04:	0007c683          	lbu	a3,0(a5)
    80200a08:	00002717          	auipc	a4,0x2
    80200a0c:	60070713          	add	a4,a4,1536 # 80203008 <expected_output>
    80200a10:	fe042783          	lw	a5,-32(s0)
    80200a14:	00f707b3          	add	a5,a4,a5
    80200a18:	0007c783          	lbu	a5,0(a5)
    80200a1c:	00068713          	mv	a4,a3
    80200a20:	04f70263          	beq	a4,a5,80200a64 <dummy+0x1d0>
                        printk("\033[31mTest failed!\033[0m\n");
    80200a24:	00001517          	auipc	a0,0x1
    80200a28:	67c50513          	add	a0,a0,1660 # 802020a0 <_srodata+0xa0>
    80200a2c:	2d0010ef          	jal	80201cfc <printk>
                        printk("\033[31m    Expected: %s\033[0m\n", expected_output);
    80200a30:	00002597          	auipc	a1,0x2
    80200a34:	5d858593          	add	a1,a1,1496 # 80203008 <expected_output>
    80200a38:	00001517          	auipc	a0,0x1
    80200a3c:	68050513          	add	a0,a0,1664 # 802020b8 <_srodata+0xb8>
    80200a40:	2bc010ef          	jal	80201cfc <printk>
                        printk("\033[31m    Got:      %s\033[0m\n", tasks_output);
    80200a44:	00004597          	auipc	a1,0x4
    80200a48:	5fc58593          	add	a1,a1,1532 # 80205040 <tasks_output>
    80200a4c:	00001517          	auipc	a0,0x1
    80200a50:	68c50513          	add	a0,a0,1676 # 802020d8 <_srodata+0xd8>
    80200a54:	2a8010ef          	jal	80201cfc <printk>
                        sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN, SBI_SRST_RESET_REASON_NONE);
    80200a58:	00000593          	li	a1,0
    80200a5c:	00000513          	li	a0,0
    80200a60:	1ac000ef          	jal	80200c0c <sbi_system_reset>
                for (int i = 0; i < MAX_OUTPUT; ++i) {
    80200a64:	fe042783          	lw	a5,-32(s0)
    80200a68:	0017879b          	addw	a5,a5,1
    80200a6c:	fef42023          	sw	a5,-32(s0)
    80200a70:	fe042783          	lw	a5,-32(s0)
    80200a74:	0007871b          	sext.w	a4,a5
    80200a78:	02700793          	li	a5,39
    80200a7c:	f6e7dce3          	bge	a5,a4,802009f4 <dummy+0x160>
                    }
                }
                printk("\033[32mTest passed!\033[0m\n");
    80200a80:	00001517          	auipc	a0,0x1
    80200a84:	67850513          	add	a0,a0,1656 # 802020f8 <_srodata+0xf8>
    80200a88:	274010ef          	jal	80201cfc <printk>
                printk("\033[32m    Output: %s\033[0m\n", expected_output);
    80200a8c:	00002597          	auipc	a1,0x2
    80200a90:	57c58593          	add	a1,a1,1404 # 80203008 <expected_output>
    80200a94:	00001517          	auipc	a0,0x1
    80200a98:	67c50513          	add	a0,a0,1660 # 80202110 <_srodata+0x110>
    80200a9c:	260010ef          	jal	80201cfc <printk>
                sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN, SBI_SRST_RESET_REASON_NONE);
    80200aa0:	00000593          	li	a1,0
    80200aa4:	00000513          	li	a0,0
    80200aa8:	164000ef          	jal	80200c0c <sbi_system_reset>
        if ((last_counter == -1 || current->counter != last_counter) && current->counter > 0) {
    80200aac:	e11ff06f          	j	802008bc <dummy+0x28>

0000000080200ab0 <sbi_ecall>:
#include "stdint.h"
#include "sbi.h"

struct sbiret sbi_ecall(uint64_t eid, uint64_t fid,
                        uint64_t arg0, uint64_t arg1, uint64_t arg2,
                        uint64_t arg3, uint64_t arg4, uint64_t arg5) {
    80200ab0:	f8010113          	add	sp,sp,-128
    80200ab4:	06813c23          	sd	s0,120(sp)
    80200ab8:	08010413          	add	s0,sp,128
    80200abc:	faa43c23          	sd	a0,-72(s0)
    80200ac0:	fab43823          	sd	a1,-80(s0)
    80200ac4:	fac43423          	sd	a2,-88(s0)
    80200ac8:	fad43023          	sd	a3,-96(s0)
    80200acc:	f8e43c23          	sd	a4,-104(s0)
    80200ad0:	f8f43823          	sd	a5,-112(s0)
    80200ad4:	f9043423          	sd	a6,-120(s0)
    80200ad8:	f9143023          	sd	a7,-128(s0)
    struct sbiret ret;
    uint64_t error;
    uint64_t value;
    asm volatile (
    80200adc:	fb843783          	ld	a5,-72(s0)
    80200ae0:	fb043703          	ld	a4,-80(s0)
    80200ae4:	fa843683          	ld	a3,-88(s0)
    80200ae8:	fa043603          	ld	a2,-96(s0)
    80200aec:	f9843583          	ld	a1,-104(s0)
    80200af0:	f9043503          	ld	a0,-112(s0)
    80200af4:	f8843803          	ld	a6,-120(s0)
    80200af8:	f8043883          	ld	a7,-128(s0)
    80200afc:	00078893          	mv	a7,a5
    80200b00:	00070813          	mv	a6,a4
    80200b04:	00068513          	mv	a0,a3
    80200b08:	00060593          	mv	a1,a2
    80200b0c:	00058613          	mv	a2,a1
    80200b10:	00050693          	mv	a3,a0
    80200b14:	00080713          	mv	a4,a6
    80200b18:	00088793          	mv	a5,a7
    80200b1c:	00000073          	ecall
    80200b20:	00050713          	mv	a4,a0
    80200b24:	00058793          	mv	a5,a1
    80200b28:	fee43423          	sd	a4,-24(s0)
    80200b2c:	fef43023          	sd	a5,-32(s0)
        : [error] "=r" (error), [value] "=r" (value)
        : [eid] "r" (eid), [fid] "r" (fid), [arg0] "r" (arg0), [arg1] "r" (arg1), 
        [arg2] "r" (arg2), [arg3] "r" (arg3), [arg4] "r" (arg4), [arg5] "r" (arg5)
        : "memory"
    );
    ret.error = error;
    80200b30:	fe843783          	ld	a5,-24(s0)
    80200b34:	fcf43023          	sd	a5,-64(s0)
    ret.value = value;
    80200b38:	fe043783          	ld	a5,-32(s0)
    80200b3c:	fcf43423          	sd	a5,-56(s0)
    return ret;
    80200b40:	fc043783          	ld	a5,-64(s0)
    80200b44:	fcf43823          	sd	a5,-48(s0)
    80200b48:	fc843783          	ld	a5,-56(s0)
    80200b4c:	fcf43c23          	sd	a5,-40(s0)
    80200b50:	fd043703          	ld	a4,-48(s0)
    80200b54:	fd843783          	ld	a5,-40(s0)
    80200b58:	00070313          	mv	t1,a4
    80200b5c:	00078393          	mv	t2,a5
    80200b60:	00030713          	mv	a4,t1
    80200b64:	00038793          	mv	a5,t2
}
    80200b68:	00070513          	mv	a0,a4
    80200b6c:	00078593          	mv	a1,a5
    80200b70:	07813403          	ld	s0,120(sp)
    80200b74:	08010113          	add	sp,sp,128
    80200b78:	00008067          	ret

0000000080200b7c <sbi_debug_console_write_byte>:

struct sbiret sbi_debug_console_write_byte(uint8_t byte) {
    80200b7c:	fc010113          	add	sp,sp,-64
    80200b80:	02113c23          	sd	ra,56(sp)
    80200b84:	02813823          	sd	s0,48(sp)
    80200b88:	03213423          	sd	s2,40(sp)
    80200b8c:	03313023          	sd	s3,32(sp)
    80200b90:	04010413          	add	s0,sp,64
    80200b94:	00050793          	mv	a5,a0
    80200b98:	fcf407a3          	sb	a5,-49(s0)
    return sbi_ecall(0x4442434e, 0x2, byte, 0, 0, 0, 0, 0);	
    80200b9c:	fcf44603          	lbu	a2,-49(s0)
    80200ba0:	00000893          	li	a7,0
    80200ba4:	00000813          	li	a6,0
    80200ba8:	00000793          	li	a5,0
    80200bac:	00000713          	li	a4,0
    80200bb0:	00000693          	li	a3,0
    80200bb4:	00200593          	li	a1,2
    80200bb8:	44424537          	lui	a0,0x44424
    80200bbc:	34e50513          	add	a0,a0,846 # 4442434e <_skernel-0x3bddbcb2>
    80200bc0:	ef1ff0ef          	jal	80200ab0 <sbi_ecall>
    80200bc4:	00050713          	mv	a4,a0
    80200bc8:	00058793          	mv	a5,a1
    80200bcc:	fce43823          	sd	a4,-48(s0)
    80200bd0:	fcf43c23          	sd	a5,-40(s0)
    80200bd4:	fd043703          	ld	a4,-48(s0)
    80200bd8:	fd843783          	ld	a5,-40(s0)
    80200bdc:	00070913          	mv	s2,a4
    80200be0:	00078993          	mv	s3,a5
    80200be4:	00090713          	mv	a4,s2
    80200be8:	00098793          	mv	a5,s3
}
    80200bec:	00070513          	mv	a0,a4
    80200bf0:	00078593          	mv	a1,a5
    80200bf4:	03813083          	ld	ra,56(sp)
    80200bf8:	03013403          	ld	s0,48(sp)
    80200bfc:	02813903          	ld	s2,40(sp)
    80200c00:	02013983          	ld	s3,32(sp)
    80200c04:	04010113          	add	sp,sp,64
    80200c08:	00008067          	ret

0000000080200c0c <sbi_system_reset>:

struct sbiret sbi_system_reset(uint32_t reset_type, uint32_t reset_reason) {
    80200c0c:	fc010113          	add	sp,sp,-64
    80200c10:	02113c23          	sd	ra,56(sp)
    80200c14:	02813823          	sd	s0,48(sp)
    80200c18:	03213423          	sd	s2,40(sp)
    80200c1c:	03313023          	sd	s3,32(sp)
    80200c20:	04010413          	add	s0,sp,64
    80200c24:	00050793          	mv	a5,a0
    80200c28:	00058713          	mv	a4,a1
    80200c2c:	fcf42623          	sw	a5,-52(s0)
    80200c30:	00070793          	mv	a5,a4
    80200c34:	fcf42423          	sw	a5,-56(s0)
    return sbi_ecall(0x53525354, 0x0, reset_type, reset_reason, 0, 0, 0, 0);
    80200c38:	fcc46603          	lwu	a2,-52(s0)
    80200c3c:	fc846683          	lwu	a3,-56(s0)
    80200c40:	00000893          	li	a7,0
    80200c44:	00000813          	li	a6,0
    80200c48:	00000793          	li	a5,0
    80200c4c:	00000713          	li	a4,0
    80200c50:	00000593          	li	a1,0
    80200c54:	53525537          	lui	a0,0x53525
    80200c58:	35450513          	add	a0,a0,852 # 53525354 <_skernel-0x2ccdacac>
    80200c5c:	e55ff0ef          	jal	80200ab0 <sbi_ecall>
    80200c60:	00050713          	mv	a4,a0
    80200c64:	00058793          	mv	a5,a1
    80200c68:	fce43823          	sd	a4,-48(s0)
    80200c6c:	fcf43c23          	sd	a5,-40(s0)
    80200c70:	fd043703          	ld	a4,-48(s0)
    80200c74:	fd843783          	ld	a5,-40(s0)
    80200c78:	00070913          	mv	s2,a4
    80200c7c:	00078993          	mv	s3,a5
    80200c80:	00090713          	mv	a4,s2
    80200c84:	00098793          	mv	a5,s3
}
    80200c88:	00070513          	mv	a0,a4
    80200c8c:	00078593          	mv	a1,a5
    80200c90:	03813083          	ld	ra,56(sp)
    80200c94:	03013403          	ld	s0,48(sp)
    80200c98:	02813903          	ld	s2,40(sp)
    80200c9c:	02013983          	ld	s3,32(sp)
    80200ca0:	04010113          	add	sp,sp,64
    80200ca4:	00008067          	ret

0000000080200ca8 <sbi_set_timer>:
struct sbiret sbi_set_timer(uint64_t stime_value) {
    80200ca8:	fc010113          	add	sp,sp,-64
    80200cac:	02113c23          	sd	ra,56(sp)
    80200cb0:	02813823          	sd	s0,48(sp)
    80200cb4:	03213423          	sd	s2,40(sp)
    80200cb8:	03313023          	sd	s3,32(sp)
    80200cbc:	04010413          	add	s0,sp,64
    80200cc0:	fca43423          	sd	a0,-56(s0)
    return sbi_ecall(0x54494d45, 0x0, stime_value, 0, 0, 0, 0, 0);
    80200cc4:	00000893          	li	a7,0
    80200cc8:	00000813          	li	a6,0
    80200ccc:	00000793          	li	a5,0
    80200cd0:	00000713          	li	a4,0
    80200cd4:	00000693          	li	a3,0
    80200cd8:	fc843603          	ld	a2,-56(s0)
    80200cdc:	00000593          	li	a1,0
    80200ce0:	54495537          	lui	a0,0x54495
    80200ce4:	d4550513          	add	a0,a0,-699 # 54494d45 <_skernel-0x2bd6b2bb>
    80200ce8:	dc9ff0ef          	jal	80200ab0 <sbi_ecall>
    80200cec:	00050713          	mv	a4,a0
    80200cf0:	00058793          	mv	a5,a1
    80200cf4:	fce43823          	sd	a4,-48(s0)
    80200cf8:	fcf43c23          	sd	a5,-40(s0)
    80200cfc:	fd043703          	ld	a4,-48(s0)
    80200d00:	fd843783          	ld	a5,-40(s0)
    80200d04:	00070913          	mv	s2,a4
    80200d08:	00078993          	mv	s3,a5
    80200d0c:	00090713          	mv	a4,s2
    80200d10:	00098793          	mv	a5,s3
    80200d14:	00070513          	mv	a0,a4
    80200d18:	00078593          	mv	a1,a5
    80200d1c:	03813083          	ld	ra,56(sp)
    80200d20:	03013403          	ld	s0,48(sp)
    80200d24:	02813903          	ld	s2,40(sp)
    80200d28:	02013983          	ld	s3,32(sp)
    80200d2c:	04010113          	add	sp,sp,64
    80200d30:	00008067          	ret

0000000080200d34 <trap_handler>:
#include "stdint.h"
#include "printk.h"
#include "clock.h"
#include "proc.h"
void trap_handler(uint64_t scause, uint64_t sepc) {
    80200d34:	fe010113          	add	sp,sp,-32
    80200d38:	00113c23          	sd	ra,24(sp)
    80200d3c:	00813823          	sd	s0,16(sp)
    80200d40:	02010413          	add	s0,sp,32
    80200d44:	fea43423          	sd	a0,-24(s0)
    80200d48:	feb43023          	sd	a1,-32(s0)
    // 通过 `scause` 判断 trap 类型
    // 如果是 interrupt 判断是否是 timer interrupt
    // 如果是 timer interrupt 则打印输出相关信息，并通过 `clock_set_next_event()` 设置下一次时钟中断
    // `clock_set_next_event()` 见 4.3.4 节
    // 其他 interrupt / exception 可以直接忽略，推荐打印出来供以后调试
    if (scause >> 63 == 1) {
    80200d4c:	fe843783          	ld	a5,-24(s0)
    80200d50:	03f7d713          	srl	a4,a5,0x3f
    80200d54:	00100793          	li	a5,1
    80200d58:	02f71c63          	bne	a4,a5,80200d90 <trap_handler+0x5c>
        // printk("%x %x\n", scause, scause & 0x7fffffffffffffff);
        if ((scause & 0x7fffffffffffffff) == 5) {
    80200d5c:	fe843703          	ld	a4,-24(s0)
    80200d60:	fff00793          	li	a5,-1
    80200d64:	0017d793          	srl	a5,a5,0x1
    80200d68:	00f77733          	and	a4,a4,a5
    80200d6c:	00500793          	li	a5,5
    80200d70:	00f71863          	bne	a4,a5,80200d80 <trap_handler+0x4c>
            // printk("[S] Supervisor Mode Timer Interrupt\n");
            clock_set_next_event();
    80200d74:	c88ff0ef          	jal	802001fc <clock_set_next_event>
            do_timer();
    80200d78:	8e1ff0ef          	jal	80200658 <do_timer>
            printk("Other Interrupt\n");
            clock_set_next_event();
        }
    }

    80200d7c:	0140006f          	j	80200d90 <trap_handler+0x5c>
            printk("Other Interrupt\n");
    80200d80:	00001517          	auipc	a0,0x1
    80200d84:	3b050513          	add	a0,a0,944 # 80202130 <_srodata+0x130>
    80200d88:	775000ef          	jal	80201cfc <printk>
            clock_set_next_event();
    80200d8c:	c70ff0ef          	jal	802001fc <clock_set_next_event>
    80200d90:	00000013          	nop
    80200d94:	01813083          	ld	ra,24(sp)
    80200d98:	01013403          	ld	s0,16(sp)
    80200d9c:	02010113          	add	sp,sp,32
    80200da0:	00008067          	ret

0000000080200da4 <start_kernel>:
#include "printk.h"
#include "defs.h"
extern void test();

int start_kernel() {
    80200da4:	ff010113          	add	sp,sp,-16
    80200da8:	00113423          	sd	ra,8(sp)
    80200dac:	00813023          	sd	s0,0(sp)
    80200db0:	01010413          	add	s0,sp,16
    printk("2024");
    80200db4:	00001517          	auipc	a0,0x1
    80200db8:	39450513          	add	a0,a0,916 # 80202148 <_srodata+0x148>
    80200dbc:	741000ef          	jal	80201cfc <printk>
    printk(" ZJU Operating System\n");
    80200dc0:	00001517          	auipc	a0,0x1
    80200dc4:	39050513          	add	a0,a0,912 # 80202150 <_srodata+0x150>
    80200dc8:	735000ef          	jal	80201cfc <printk>

    // uint64_t sscratch_val = 9;
    // csr_write(sscratch, sscratch_val);
    // sscratch_val_read = csr_read(sscratch);
    // printk("after write sscratch = %x\n", sscratch_val_read);
    test();
    80200dcc:	01c000ef          	jal	80200de8 <test>
    return 0;
    80200dd0:	00000793          	li	a5,0
}
    80200dd4:	00078513          	mv	a0,a5
    80200dd8:	00813083          	ld	ra,8(sp)
    80200ddc:	00013403          	ld	s0,0(sp)
    80200de0:	01010113          	add	sp,sp,16
    80200de4:	00008067          	ret

0000000080200de8 <test>:
#include "printk.h"

void test() {
    80200de8:	fe010113          	add	sp,sp,-32
    80200dec:	00113c23          	sd	ra,24(sp)
    80200df0:	00813823          	sd	s0,16(sp)
    80200df4:	02010413          	add	s0,sp,32
    int i = 0;
    80200df8:	fe042623          	sw	zero,-20(s0)
    // int t = 0;
    while (1) {
        if ((++i) % 200000000 == 0) {
    80200dfc:	fec42783          	lw	a5,-20(s0)
    80200e00:	0017879b          	addw	a5,a5,1
    80200e04:	fef42623          	sw	a5,-20(s0)
    80200e08:	fec42783          	lw	a5,-20(s0)
    80200e0c:	00078713          	mv	a4,a5
    80200e10:	0bebc7b7          	lui	a5,0xbebc
    80200e14:	2007879b          	addw	a5,a5,512 # bebc200 <_skernel-0x74343e00>
    80200e18:	02f767bb          	remw	a5,a4,a5
    80200e1c:	0007879b          	sext.w	a5,a5
    80200e20:	fc079ee3          	bnez	a5,80200dfc <test+0x14>
            printk("kernel is running!\n");
    80200e24:	00001517          	auipc	a0,0x1
    80200e28:	34450513          	add	a0,a0,836 # 80202168 <_srodata+0x168>
    80200e2c:	6d1000ef          	jal	80201cfc <printk>
            i = 0;
    80200e30:	fe042623          	sw	zero,-20(s0)
        if ((++i) % 200000000 == 0) {
    80200e34:	fc9ff06f          	j	80200dfc <test+0x14>

0000000080200e38 <putc>:
// credit: 45gfg9 <45gfg9@45gfg9.net>

#include "printk.h"
#include "sbi.h"

int putc(int c) {
    80200e38:	fe010113          	add	sp,sp,-32
    80200e3c:	00113c23          	sd	ra,24(sp)
    80200e40:	00813823          	sd	s0,16(sp)
    80200e44:	02010413          	add	s0,sp,32
    80200e48:	00050793          	mv	a5,a0
    80200e4c:	fef42623          	sw	a5,-20(s0)
    sbi_debug_console_write_byte(c);
    80200e50:	fec42783          	lw	a5,-20(s0)
    80200e54:	0ff7f793          	zext.b	a5,a5
    80200e58:	00078513          	mv	a0,a5
    80200e5c:	d21ff0ef          	jal	80200b7c <sbi_debug_console_write_byte>
    return (char)c;
    80200e60:	fec42783          	lw	a5,-20(s0)
    80200e64:	0ff7f793          	zext.b	a5,a5
    80200e68:	0007879b          	sext.w	a5,a5
}
    80200e6c:	00078513          	mv	a0,a5
    80200e70:	01813083          	ld	ra,24(sp)
    80200e74:	01013403          	ld	s0,16(sp)
    80200e78:	02010113          	add	sp,sp,32
    80200e7c:	00008067          	ret

0000000080200e80 <isspace>:
    bool sign;
    int width;
    int prec;
};

int isspace(int c) {
    80200e80:	fe010113          	add	sp,sp,-32
    80200e84:	00813c23          	sd	s0,24(sp)
    80200e88:	02010413          	add	s0,sp,32
    80200e8c:	00050793          	mv	a5,a0
    80200e90:	fef42623          	sw	a5,-20(s0)
    return c == ' ' || (c >= '\t' && c <= '\r');
    80200e94:	fec42783          	lw	a5,-20(s0)
    80200e98:	0007871b          	sext.w	a4,a5
    80200e9c:	02000793          	li	a5,32
    80200ea0:	02f70263          	beq	a4,a5,80200ec4 <isspace+0x44>
    80200ea4:	fec42783          	lw	a5,-20(s0)
    80200ea8:	0007871b          	sext.w	a4,a5
    80200eac:	00800793          	li	a5,8
    80200eb0:	00e7de63          	bge	a5,a4,80200ecc <isspace+0x4c>
    80200eb4:	fec42783          	lw	a5,-20(s0)
    80200eb8:	0007871b          	sext.w	a4,a5
    80200ebc:	00d00793          	li	a5,13
    80200ec0:	00e7c663          	blt	a5,a4,80200ecc <isspace+0x4c>
    80200ec4:	00100793          	li	a5,1
    80200ec8:	0080006f          	j	80200ed0 <isspace+0x50>
    80200ecc:	00000793          	li	a5,0
}
    80200ed0:	00078513          	mv	a0,a5
    80200ed4:	01813403          	ld	s0,24(sp)
    80200ed8:	02010113          	add	sp,sp,32
    80200edc:	00008067          	ret

0000000080200ee0 <strtol>:

long strtol(const char *restrict nptr, char **restrict endptr, int base) {
    80200ee0:	fb010113          	add	sp,sp,-80
    80200ee4:	04113423          	sd	ra,72(sp)
    80200ee8:	04813023          	sd	s0,64(sp)
    80200eec:	05010413          	add	s0,sp,80
    80200ef0:	fca43423          	sd	a0,-56(s0)
    80200ef4:	fcb43023          	sd	a1,-64(s0)
    80200ef8:	00060793          	mv	a5,a2
    80200efc:	faf42e23          	sw	a5,-68(s0)
    long ret = 0;
    80200f00:	fe043423          	sd	zero,-24(s0)
    bool neg = false;
    80200f04:	fe0403a3          	sb	zero,-25(s0)
    const char *p = nptr;
    80200f08:	fc843783          	ld	a5,-56(s0)
    80200f0c:	fcf43c23          	sd	a5,-40(s0)

    while (isspace(*p)) {
    80200f10:	0100006f          	j	80200f20 <strtol+0x40>
        p++;
    80200f14:	fd843783          	ld	a5,-40(s0)
    80200f18:	00178793          	add	a5,a5,1
    80200f1c:	fcf43c23          	sd	a5,-40(s0)
    while (isspace(*p)) {
    80200f20:	fd843783          	ld	a5,-40(s0)
    80200f24:	0007c783          	lbu	a5,0(a5)
    80200f28:	0007879b          	sext.w	a5,a5
    80200f2c:	00078513          	mv	a0,a5
    80200f30:	f51ff0ef          	jal	80200e80 <isspace>
    80200f34:	00050793          	mv	a5,a0
    80200f38:	fc079ee3          	bnez	a5,80200f14 <strtol+0x34>
    }

    if (*p == '-') {
    80200f3c:	fd843783          	ld	a5,-40(s0)
    80200f40:	0007c783          	lbu	a5,0(a5)
    80200f44:	00078713          	mv	a4,a5
    80200f48:	02d00793          	li	a5,45
    80200f4c:	00f71e63          	bne	a4,a5,80200f68 <strtol+0x88>
        neg = true;
    80200f50:	00100793          	li	a5,1
    80200f54:	fef403a3          	sb	a5,-25(s0)
        p++;
    80200f58:	fd843783          	ld	a5,-40(s0)
    80200f5c:	00178793          	add	a5,a5,1
    80200f60:	fcf43c23          	sd	a5,-40(s0)
    80200f64:	0240006f          	j	80200f88 <strtol+0xa8>
    } else if (*p == '+') {
    80200f68:	fd843783          	ld	a5,-40(s0)
    80200f6c:	0007c783          	lbu	a5,0(a5)
    80200f70:	00078713          	mv	a4,a5
    80200f74:	02b00793          	li	a5,43
    80200f78:	00f71863          	bne	a4,a5,80200f88 <strtol+0xa8>
        p++;
    80200f7c:	fd843783          	ld	a5,-40(s0)
    80200f80:	00178793          	add	a5,a5,1
    80200f84:	fcf43c23          	sd	a5,-40(s0)
    }

    if (base == 0) {
    80200f88:	fbc42783          	lw	a5,-68(s0)
    80200f8c:	0007879b          	sext.w	a5,a5
    80200f90:	06079c63          	bnez	a5,80201008 <strtol+0x128>
        if (*p == '0') {
    80200f94:	fd843783          	ld	a5,-40(s0)
    80200f98:	0007c783          	lbu	a5,0(a5)
    80200f9c:	00078713          	mv	a4,a5
    80200fa0:	03000793          	li	a5,48
    80200fa4:	04f71e63          	bne	a4,a5,80201000 <strtol+0x120>
            p++;
    80200fa8:	fd843783          	ld	a5,-40(s0)
    80200fac:	00178793          	add	a5,a5,1
    80200fb0:	fcf43c23          	sd	a5,-40(s0)
            if (*p == 'x' || *p == 'X') {
    80200fb4:	fd843783          	ld	a5,-40(s0)
    80200fb8:	0007c783          	lbu	a5,0(a5)
    80200fbc:	00078713          	mv	a4,a5
    80200fc0:	07800793          	li	a5,120
    80200fc4:	00f70c63          	beq	a4,a5,80200fdc <strtol+0xfc>
    80200fc8:	fd843783          	ld	a5,-40(s0)
    80200fcc:	0007c783          	lbu	a5,0(a5)
    80200fd0:	00078713          	mv	a4,a5
    80200fd4:	05800793          	li	a5,88
    80200fd8:	00f71e63          	bne	a4,a5,80200ff4 <strtol+0x114>
                base = 16;
    80200fdc:	01000793          	li	a5,16
    80200fe0:	faf42e23          	sw	a5,-68(s0)
                p++;
    80200fe4:	fd843783          	ld	a5,-40(s0)
    80200fe8:	00178793          	add	a5,a5,1
    80200fec:	fcf43c23          	sd	a5,-40(s0)
    80200ff0:	0180006f          	j	80201008 <strtol+0x128>
            } else {
                base = 8;
    80200ff4:	00800793          	li	a5,8
    80200ff8:	faf42e23          	sw	a5,-68(s0)
    80200ffc:	00c0006f          	j	80201008 <strtol+0x128>
            }
        } else {
            base = 10;
    80201000:	00a00793          	li	a5,10
    80201004:	faf42e23          	sw	a5,-68(s0)
        }
    }

    while (1) {
        int digit;
        if (*p >= '0' && *p <= '9') {
    80201008:	fd843783          	ld	a5,-40(s0)
    8020100c:	0007c783          	lbu	a5,0(a5)
    80201010:	00078713          	mv	a4,a5
    80201014:	02f00793          	li	a5,47
    80201018:	02e7f863          	bgeu	a5,a4,80201048 <strtol+0x168>
    8020101c:	fd843783          	ld	a5,-40(s0)
    80201020:	0007c783          	lbu	a5,0(a5)
    80201024:	00078713          	mv	a4,a5
    80201028:	03900793          	li	a5,57
    8020102c:	00e7ee63          	bltu	a5,a4,80201048 <strtol+0x168>
            digit = *p - '0';
    80201030:	fd843783          	ld	a5,-40(s0)
    80201034:	0007c783          	lbu	a5,0(a5)
    80201038:	0007879b          	sext.w	a5,a5
    8020103c:	fd07879b          	addw	a5,a5,-48
    80201040:	fcf42a23          	sw	a5,-44(s0)
    80201044:	0800006f          	j	802010c4 <strtol+0x1e4>
        } else if (*p >= 'a' && *p <= 'z') {
    80201048:	fd843783          	ld	a5,-40(s0)
    8020104c:	0007c783          	lbu	a5,0(a5)
    80201050:	00078713          	mv	a4,a5
    80201054:	06000793          	li	a5,96
    80201058:	02e7f863          	bgeu	a5,a4,80201088 <strtol+0x1a8>
    8020105c:	fd843783          	ld	a5,-40(s0)
    80201060:	0007c783          	lbu	a5,0(a5)
    80201064:	00078713          	mv	a4,a5
    80201068:	07a00793          	li	a5,122
    8020106c:	00e7ee63          	bltu	a5,a4,80201088 <strtol+0x1a8>
            digit = *p - ('a' - 10);
    80201070:	fd843783          	ld	a5,-40(s0)
    80201074:	0007c783          	lbu	a5,0(a5)
    80201078:	0007879b          	sext.w	a5,a5
    8020107c:	fa97879b          	addw	a5,a5,-87
    80201080:	fcf42a23          	sw	a5,-44(s0)
    80201084:	0400006f          	j	802010c4 <strtol+0x1e4>
        } else if (*p >= 'A' && *p <= 'Z') {
    80201088:	fd843783          	ld	a5,-40(s0)
    8020108c:	0007c783          	lbu	a5,0(a5)
    80201090:	00078713          	mv	a4,a5
    80201094:	04000793          	li	a5,64
    80201098:	06e7f863          	bgeu	a5,a4,80201108 <strtol+0x228>
    8020109c:	fd843783          	ld	a5,-40(s0)
    802010a0:	0007c783          	lbu	a5,0(a5)
    802010a4:	00078713          	mv	a4,a5
    802010a8:	05a00793          	li	a5,90
    802010ac:	04e7ee63          	bltu	a5,a4,80201108 <strtol+0x228>
            digit = *p - ('A' - 10);
    802010b0:	fd843783          	ld	a5,-40(s0)
    802010b4:	0007c783          	lbu	a5,0(a5)
    802010b8:	0007879b          	sext.w	a5,a5
    802010bc:	fc97879b          	addw	a5,a5,-55
    802010c0:	fcf42a23          	sw	a5,-44(s0)
        } else {
            break;
        }

        if (digit >= base) {
    802010c4:	fd442783          	lw	a5,-44(s0)
    802010c8:	00078713          	mv	a4,a5
    802010cc:	fbc42783          	lw	a5,-68(s0)
    802010d0:	0007071b          	sext.w	a4,a4
    802010d4:	0007879b          	sext.w	a5,a5
    802010d8:	02f75663          	bge	a4,a5,80201104 <strtol+0x224>
            break;
        }

        ret = ret * base + digit;
    802010dc:	fbc42703          	lw	a4,-68(s0)
    802010e0:	fe843783          	ld	a5,-24(s0)
    802010e4:	02f70733          	mul	a4,a4,a5
    802010e8:	fd442783          	lw	a5,-44(s0)
    802010ec:	00f707b3          	add	a5,a4,a5
    802010f0:	fef43423          	sd	a5,-24(s0)
        p++;
    802010f4:	fd843783          	ld	a5,-40(s0)
    802010f8:	00178793          	add	a5,a5,1
    802010fc:	fcf43c23          	sd	a5,-40(s0)
    while (1) {
    80201100:	f09ff06f          	j	80201008 <strtol+0x128>
            break;
    80201104:	00000013          	nop
    }

    if (endptr) {
    80201108:	fc043783          	ld	a5,-64(s0)
    8020110c:	00078863          	beqz	a5,8020111c <strtol+0x23c>
        *endptr = (char *)p;
    80201110:	fc043783          	ld	a5,-64(s0)
    80201114:	fd843703          	ld	a4,-40(s0)
    80201118:	00e7b023          	sd	a4,0(a5)
    }

    return neg ? -ret : ret;
    8020111c:	fe744783          	lbu	a5,-25(s0)
    80201120:	0ff7f793          	zext.b	a5,a5
    80201124:	00078863          	beqz	a5,80201134 <strtol+0x254>
    80201128:	fe843783          	ld	a5,-24(s0)
    8020112c:	40f007b3          	neg	a5,a5
    80201130:	0080006f          	j	80201138 <strtol+0x258>
    80201134:	fe843783          	ld	a5,-24(s0)
}
    80201138:	00078513          	mv	a0,a5
    8020113c:	04813083          	ld	ra,72(sp)
    80201140:	04013403          	ld	s0,64(sp)
    80201144:	05010113          	add	sp,sp,80
    80201148:	00008067          	ret

000000008020114c <puts_wo_nl>:

// puts without newline
static int puts_wo_nl(int (*putch)(int), const char *s) {
    8020114c:	fd010113          	add	sp,sp,-48
    80201150:	02113423          	sd	ra,40(sp)
    80201154:	02813023          	sd	s0,32(sp)
    80201158:	03010413          	add	s0,sp,48
    8020115c:	fca43c23          	sd	a0,-40(s0)
    80201160:	fcb43823          	sd	a1,-48(s0)
    if (!s) {
    80201164:	fd043783          	ld	a5,-48(s0)
    80201168:	00079863          	bnez	a5,80201178 <puts_wo_nl+0x2c>
        s = "(null)";
    8020116c:	00001797          	auipc	a5,0x1
    80201170:	01478793          	add	a5,a5,20 # 80202180 <_srodata+0x180>
    80201174:	fcf43823          	sd	a5,-48(s0)
    }
    const char *p = s;
    80201178:	fd043783          	ld	a5,-48(s0)
    8020117c:	fef43423          	sd	a5,-24(s0)
    while (*p) {
    80201180:	0240006f          	j	802011a4 <puts_wo_nl+0x58>
        putch(*p++);
    80201184:	fe843783          	ld	a5,-24(s0)
    80201188:	00178713          	add	a4,a5,1
    8020118c:	fee43423          	sd	a4,-24(s0)
    80201190:	0007c783          	lbu	a5,0(a5)
    80201194:	0007871b          	sext.w	a4,a5
    80201198:	fd843783          	ld	a5,-40(s0)
    8020119c:	00070513          	mv	a0,a4
    802011a0:	000780e7          	jalr	a5
    while (*p) {
    802011a4:	fe843783          	ld	a5,-24(s0)
    802011a8:	0007c783          	lbu	a5,0(a5)
    802011ac:	fc079ce3          	bnez	a5,80201184 <puts_wo_nl+0x38>
    }
    return p - s;
    802011b0:	fe843703          	ld	a4,-24(s0)
    802011b4:	fd043783          	ld	a5,-48(s0)
    802011b8:	40f707b3          	sub	a5,a4,a5
    802011bc:	0007879b          	sext.w	a5,a5
}
    802011c0:	00078513          	mv	a0,a5
    802011c4:	02813083          	ld	ra,40(sp)
    802011c8:	02013403          	ld	s0,32(sp)
    802011cc:	03010113          	add	sp,sp,48
    802011d0:	00008067          	ret

00000000802011d4 <print_dec_int>:

static int print_dec_int(int (*putch)(int), unsigned long num, bool is_signed, struct fmt_flags *flags) {
    802011d4:	f9010113          	add	sp,sp,-112
    802011d8:	06113423          	sd	ra,104(sp)
    802011dc:	06813023          	sd	s0,96(sp)
    802011e0:	07010413          	add	s0,sp,112
    802011e4:	faa43423          	sd	a0,-88(s0)
    802011e8:	fab43023          	sd	a1,-96(s0)
    802011ec:	00060793          	mv	a5,a2
    802011f0:	f8d43823          	sd	a3,-112(s0)
    802011f4:	f8f40fa3          	sb	a5,-97(s0)
    if (is_signed && num == 0x8000000000000000UL) {
    802011f8:	f9f44783          	lbu	a5,-97(s0)
    802011fc:	0ff7f793          	zext.b	a5,a5
    80201200:	02078663          	beqz	a5,8020122c <print_dec_int+0x58>
    80201204:	fa043703          	ld	a4,-96(s0)
    80201208:	fff00793          	li	a5,-1
    8020120c:	03f79793          	sll	a5,a5,0x3f
    80201210:	00f71e63          	bne	a4,a5,8020122c <print_dec_int+0x58>
        // special case for 0x8000000000000000
        return puts_wo_nl(putch, "-9223372036854775808");
    80201214:	00001597          	auipc	a1,0x1
    80201218:	f7458593          	add	a1,a1,-140 # 80202188 <_srodata+0x188>
    8020121c:	fa843503          	ld	a0,-88(s0)
    80201220:	f2dff0ef          	jal	8020114c <puts_wo_nl>
    80201224:	00050793          	mv	a5,a0
    80201228:	2a00006f          	j	802014c8 <print_dec_int+0x2f4>
    }

    if (flags->prec == 0 && num == 0) {
    8020122c:	f9043783          	ld	a5,-112(s0)
    80201230:	00c7a783          	lw	a5,12(a5)
    80201234:	00079a63          	bnez	a5,80201248 <print_dec_int+0x74>
    80201238:	fa043783          	ld	a5,-96(s0)
    8020123c:	00079663          	bnez	a5,80201248 <print_dec_int+0x74>
        return 0;
    80201240:	00000793          	li	a5,0
    80201244:	2840006f          	j	802014c8 <print_dec_int+0x2f4>
    }

    bool neg = false;
    80201248:	fe0407a3          	sb	zero,-17(s0)

    if (is_signed && (long)num < 0) {
    8020124c:	f9f44783          	lbu	a5,-97(s0)
    80201250:	0ff7f793          	zext.b	a5,a5
    80201254:	02078063          	beqz	a5,80201274 <print_dec_int+0xa0>
    80201258:	fa043783          	ld	a5,-96(s0)
    8020125c:	0007dc63          	bgez	a5,80201274 <print_dec_int+0xa0>
        neg = true;
    80201260:	00100793          	li	a5,1
    80201264:	fef407a3          	sb	a5,-17(s0)
        num = -num;
    80201268:	fa043783          	ld	a5,-96(s0)
    8020126c:	40f007b3          	neg	a5,a5
    80201270:	faf43023          	sd	a5,-96(s0)
    }

    char buf[20];
    int decdigits = 0;
    80201274:	fe042423          	sw	zero,-24(s0)

    bool has_sign_char = is_signed && (neg || flags->sign || flags->spaceflag);
    80201278:	f9f44783          	lbu	a5,-97(s0)
    8020127c:	0ff7f793          	zext.b	a5,a5
    80201280:	02078863          	beqz	a5,802012b0 <print_dec_int+0xdc>
    80201284:	fef44783          	lbu	a5,-17(s0)
    80201288:	0ff7f793          	zext.b	a5,a5
    8020128c:	00079e63          	bnez	a5,802012a8 <print_dec_int+0xd4>
    80201290:	f9043783          	ld	a5,-112(s0)
    80201294:	0057c783          	lbu	a5,5(a5)
    80201298:	00079863          	bnez	a5,802012a8 <print_dec_int+0xd4>
    8020129c:	f9043783          	ld	a5,-112(s0)
    802012a0:	0047c783          	lbu	a5,4(a5)
    802012a4:	00078663          	beqz	a5,802012b0 <print_dec_int+0xdc>
    802012a8:	00100793          	li	a5,1
    802012ac:	0080006f          	j	802012b4 <print_dec_int+0xe0>
    802012b0:	00000793          	li	a5,0
    802012b4:	fcf40ba3          	sb	a5,-41(s0)
    802012b8:	fd744783          	lbu	a5,-41(s0)
    802012bc:	0017f793          	and	a5,a5,1
    802012c0:	fcf40ba3          	sb	a5,-41(s0)

    do {
        buf[decdigits++] = num % 10 + '0';
    802012c4:	fa043703          	ld	a4,-96(s0)
    802012c8:	00a00793          	li	a5,10
    802012cc:	02f777b3          	remu	a5,a4,a5
    802012d0:	0ff7f713          	zext.b	a4,a5
    802012d4:	fe842783          	lw	a5,-24(s0)
    802012d8:	0017869b          	addw	a3,a5,1
    802012dc:	fed42423          	sw	a3,-24(s0)
    802012e0:	0307071b          	addw	a4,a4,48
    802012e4:	0ff77713          	zext.b	a4,a4
    802012e8:	ff078793          	add	a5,a5,-16
    802012ec:	008787b3          	add	a5,a5,s0
    802012f0:	fce78423          	sb	a4,-56(a5)
        num /= 10;
    802012f4:	fa043703          	ld	a4,-96(s0)
    802012f8:	00a00793          	li	a5,10
    802012fc:	02f757b3          	divu	a5,a4,a5
    80201300:	faf43023          	sd	a5,-96(s0)
    } while (num);
    80201304:	fa043783          	ld	a5,-96(s0)
    80201308:	fa079ee3          	bnez	a5,802012c4 <print_dec_int+0xf0>

    if (flags->prec == -1 && flags->zeroflag) {
    8020130c:	f9043783          	ld	a5,-112(s0)
    80201310:	00c7a783          	lw	a5,12(a5)
    80201314:	00078713          	mv	a4,a5
    80201318:	fff00793          	li	a5,-1
    8020131c:	02f71063          	bne	a4,a5,8020133c <print_dec_int+0x168>
    80201320:	f9043783          	ld	a5,-112(s0)
    80201324:	0037c783          	lbu	a5,3(a5)
    80201328:	00078a63          	beqz	a5,8020133c <print_dec_int+0x168>
        flags->prec = flags->width;
    8020132c:	f9043783          	ld	a5,-112(s0)
    80201330:	0087a703          	lw	a4,8(a5)
    80201334:	f9043783          	ld	a5,-112(s0)
    80201338:	00e7a623          	sw	a4,12(a5)
    }

    int written = 0;
    8020133c:	fe042223          	sw	zero,-28(s0)

    for (int i = flags->width - __MAX(decdigits, flags->prec) - has_sign_char; i > 0; i--) {
    80201340:	f9043783          	ld	a5,-112(s0)
    80201344:	0087a703          	lw	a4,8(a5)
    80201348:	fe842783          	lw	a5,-24(s0)
    8020134c:	fcf42823          	sw	a5,-48(s0)
    80201350:	f9043783          	ld	a5,-112(s0)
    80201354:	00c7a783          	lw	a5,12(a5)
    80201358:	fcf42623          	sw	a5,-52(s0)
    8020135c:	fd042783          	lw	a5,-48(s0)
    80201360:	00078593          	mv	a1,a5
    80201364:	fcc42783          	lw	a5,-52(s0)
    80201368:	00078613          	mv	a2,a5
    8020136c:	0006069b          	sext.w	a3,a2
    80201370:	0005879b          	sext.w	a5,a1
    80201374:	00f6d463          	bge	a3,a5,8020137c <print_dec_int+0x1a8>
    80201378:	00058613          	mv	a2,a1
    8020137c:	0006079b          	sext.w	a5,a2
    80201380:	40f707bb          	subw	a5,a4,a5
    80201384:	0007871b          	sext.w	a4,a5
    80201388:	fd744783          	lbu	a5,-41(s0)
    8020138c:	0007879b          	sext.w	a5,a5
    80201390:	40f707bb          	subw	a5,a4,a5
    80201394:	fef42023          	sw	a5,-32(s0)
    80201398:	0280006f          	j	802013c0 <print_dec_int+0x1ec>
        putch(' ');
    8020139c:	fa843783          	ld	a5,-88(s0)
    802013a0:	02000513          	li	a0,32
    802013a4:	000780e7          	jalr	a5
        ++written;
    802013a8:	fe442783          	lw	a5,-28(s0)
    802013ac:	0017879b          	addw	a5,a5,1
    802013b0:	fef42223          	sw	a5,-28(s0)
    for (int i = flags->width - __MAX(decdigits, flags->prec) - has_sign_char; i > 0; i--) {
    802013b4:	fe042783          	lw	a5,-32(s0)
    802013b8:	fff7879b          	addw	a5,a5,-1
    802013bc:	fef42023          	sw	a5,-32(s0)
    802013c0:	fe042783          	lw	a5,-32(s0)
    802013c4:	0007879b          	sext.w	a5,a5
    802013c8:	fcf04ae3          	bgtz	a5,8020139c <print_dec_int+0x1c8>
    }

    if (has_sign_char) {
    802013cc:	fd744783          	lbu	a5,-41(s0)
    802013d0:	0ff7f793          	zext.b	a5,a5
    802013d4:	04078463          	beqz	a5,8020141c <print_dec_int+0x248>
        putch(neg ? '-' : flags->sign ? '+' : ' ');
    802013d8:	fef44783          	lbu	a5,-17(s0)
    802013dc:	0ff7f793          	zext.b	a5,a5
    802013e0:	00078663          	beqz	a5,802013ec <print_dec_int+0x218>
    802013e4:	02d00793          	li	a5,45
    802013e8:	01c0006f          	j	80201404 <print_dec_int+0x230>
    802013ec:	f9043783          	ld	a5,-112(s0)
    802013f0:	0057c783          	lbu	a5,5(a5)
    802013f4:	00078663          	beqz	a5,80201400 <print_dec_int+0x22c>
    802013f8:	02b00793          	li	a5,43
    802013fc:	0080006f          	j	80201404 <print_dec_int+0x230>
    80201400:	02000793          	li	a5,32
    80201404:	fa843703          	ld	a4,-88(s0)
    80201408:	00078513          	mv	a0,a5
    8020140c:	000700e7          	jalr	a4
        ++written;
    80201410:	fe442783          	lw	a5,-28(s0)
    80201414:	0017879b          	addw	a5,a5,1
    80201418:	fef42223          	sw	a5,-28(s0)
    }

    for (int i = decdigits; i < flags->prec - has_sign_char; i++) {
    8020141c:	fe842783          	lw	a5,-24(s0)
    80201420:	fcf42e23          	sw	a5,-36(s0)
    80201424:	0280006f          	j	8020144c <print_dec_int+0x278>
        putch('0');
    80201428:	fa843783          	ld	a5,-88(s0)
    8020142c:	03000513          	li	a0,48
    80201430:	000780e7          	jalr	a5
        ++written;
    80201434:	fe442783          	lw	a5,-28(s0)
    80201438:	0017879b          	addw	a5,a5,1
    8020143c:	fef42223          	sw	a5,-28(s0)
    for (int i = decdigits; i < flags->prec - has_sign_char; i++) {
    80201440:	fdc42783          	lw	a5,-36(s0)
    80201444:	0017879b          	addw	a5,a5,1
    80201448:	fcf42e23          	sw	a5,-36(s0)
    8020144c:	f9043783          	ld	a5,-112(s0)
    80201450:	00c7a703          	lw	a4,12(a5)
    80201454:	fd744783          	lbu	a5,-41(s0)
    80201458:	0007879b          	sext.w	a5,a5
    8020145c:	40f707bb          	subw	a5,a4,a5
    80201460:	0007871b          	sext.w	a4,a5
    80201464:	fdc42783          	lw	a5,-36(s0)
    80201468:	0007879b          	sext.w	a5,a5
    8020146c:	fae7cee3          	blt	a5,a4,80201428 <print_dec_int+0x254>
    }

    for (int i = decdigits - 1; i >= 0; i--) {
    80201470:	fe842783          	lw	a5,-24(s0)
    80201474:	fff7879b          	addw	a5,a5,-1
    80201478:	fcf42c23          	sw	a5,-40(s0)
    8020147c:	03c0006f          	j	802014b8 <print_dec_int+0x2e4>
        putch(buf[i]);
    80201480:	fd842783          	lw	a5,-40(s0)
    80201484:	ff078793          	add	a5,a5,-16
    80201488:	008787b3          	add	a5,a5,s0
    8020148c:	fc87c783          	lbu	a5,-56(a5)
    80201490:	0007871b          	sext.w	a4,a5
    80201494:	fa843783          	ld	a5,-88(s0)
    80201498:	00070513          	mv	a0,a4
    8020149c:	000780e7          	jalr	a5
        ++written;
    802014a0:	fe442783          	lw	a5,-28(s0)
    802014a4:	0017879b          	addw	a5,a5,1
    802014a8:	fef42223          	sw	a5,-28(s0)
    for (int i = decdigits - 1; i >= 0; i--) {
    802014ac:	fd842783          	lw	a5,-40(s0)
    802014b0:	fff7879b          	addw	a5,a5,-1
    802014b4:	fcf42c23          	sw	a5,-40(s0)
    802014b8:	fd842783          	lw	a5,-40(s0)
    802014bc:	0007879b          	sext.w	a5,a5
    802014c0:	fc07d0e3          	bgez	a5,80201480 <print_dec_int+0x2ac>
    }

    return written;
    802014c4:	fe442783          	lw	a5,-28(s0)
}
    802014c8:	00078513          	mv	a0,a5
    802014cc:	06813083          	ld	ra,104(sp)
    802014d0:	06013403          	ld	s0,96(sp)
    802014d4:	07010113          	add	sp,sp,112
    802014d8:	00008067          	ret

00000000802014dc <vprintfmt>:

int vprintfmt(int (*putch)(int), const char *fmt, va_list vl) {
    802014dc:	f4010113          	add	sp,sp,-192
    802014e0:	0a113c23          	sd	ra,184(sp)
    802014e4:	0a813823          	sd	s0,176(sp)
    802014e8:	0c010413          	add	s0,sp,192
    802014ec:	f4a43c23          	sd	a0,-168(s0)
    802014f0:	f4b43823          	sd	a1,-176(s0)
    802014f4:	f4c43423          	sd	a2,-184(s0)
    static const char lowerxdigits[] = "0123456789abcdef";
    static const char upperxdigits[] = "0123456789ABCDEF";

    struct fmt_flags flags = {};
    802014f8:	f8043023          	sd	zero,-128(s0)
    802014fc:	f8043423          	sd	zero,-120(s0)

    int written = 0;
    80201500:	fe042623          	sw	zero,-20(s0)

    for (; *fmt; fmt++) {
    80201504:	7a40006f          	j	80201ca8 <vprintfmt+0x7cc>
        if (flags.in_format) {
    80201508:	f8044783          	lbu	a5,-128(s0)
    8020150c:	72078e63          	beqz	a5,80201c48 <vprintfmt+0x76c>
            if (*fmt == '#') {
    80201510:	f5043783          	ld	a5,-176(s0)
    80201514:	0007c783          	lbu	a5,0(a5)
    80201518:	00078713          	mv	a4,a5
    8020151c:	02300793          	li	a5,35
    80201520:	00f71863          	bne	a4,a5,80201530 <vprintfmt+0x54>
                flags.sharpflag = true;
    80201524:	00100793          	li	a5,1
    80201528:	f8f40123          	sb	a5,-126(s0)
    8020152c:	7700006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == '0') {
    80201530:	f5043783          	ld	a5,-176(s0)
    80201534:	0007c783          	lbu	a5,0(a5)
    80201538:	00078713          	mv	a4,a5
    8020153c:	03000793          	li	a5,48
    80201540:	00f71863          	bne	a4,a5,80201550 <vprintfmt+0x74>
                flags.zeroflag = true;
    80201544:	00100793          	li	a5,1
    80201548:	f8f401a3          	sb	a5,-125(s0)
    8020154c:	7500006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == 'l' || *fmt == 'z' || *fmt == 't' || *fmt == 'j') {
    80201550:	f5043783          	ld	a5,-176(s0)
    80201554:	0007c783          	lbu	a5,0(a5)
    80201558:	00078713          	mv	a4,a5
    8020155c:	06c00793          	li	a5,108
    80201560:	04f70063          	beq	a4,a5,802015a0 <vprintfmt+0xc4>
    80201564:	f5043783          	ld	a5,-176(s0)
    80201568:	0007c783          	lbu	a5,0(a5)
    8020156c:	00078713          	mv	a4,a5
    80201570:	07a00793          	li	a5,122
    80201574:	02f70663          	beq	a4,a5,802015a0 <vprintfmt+0xc4>
    80201578:	f5043783          	ld	a5,-176(s0)
    8020157c:	0007c783          	lbu	a5,0(a5)
    80201580:	00078713          	mv	a4,a5
    80201584:	07400793          	li	a5,116
    80201588:	00f70c63          	beq	a4,a5,802015a0 <vprintfmt+0xc4>
    8020158c:	f5043783          	ld	a5,-176(s0)
    80201590:	0007c783          	lbu	a5,0(a5)
    80201594:	00078713          	mv	a4,a5
    80201598:	06a00793          	li	a5,106
    8020159c:	00f71863          	bne	a4,a5,802015ac <vprintfmt+0xd0>
                // l: long, z: size_t, t: ptrdiff_t, j: intmax_t
                flags.longflag = true;
    802015a0:	00100793          	li	a5,1
    802015a4:	f8f400a3          	sb	a5,-127(s0)
    802015a8:	6f40006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == '+') {
    802015ac:	f5043783          	ld	a5,-176(s0)
    802015b0:	0007c783          	lbu	a5,0(a5)
    802015b4:	00078713          	mv	a4,a5
    802015b8:	02b00793          	li	a5,43
    802015bc:	00f71863          	bne	a4,a5,802015cc <vprintfmt+0xf0>
                flags.sign = true;
    802015c0:	00100793          	li	a5,1
    802015c4:	f8f402a3          	sb	a5,-123(s0)
    802015c8:	6d40006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == ' ') {
    802015cc:	f5043783          	ld	a5,-176(s0)
    802015d0:	0007c783          	lbu	a5,0(a5)
    802015d4:	00078713          	mv	a4,a5
    802015d8:	02000793          	li	a5,32
    802015dc:	00f71863          	bne	a4,a5,802015ec <vprintfmt+0x110>
                flags.spaceflag = true;
    802015e0:	00100793          	li	a5,1
    802015e4:	f8f40223          	sb	a5,-124(s0)
    802015e8:	6b40006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == '*') {
    802015ec:	f5043783          	ld	a5,-176(s0)
    802015f0:	0007c783          	lbu	a5,0(a5)
    802015f4:	00078713          	mv	a4,a5
    802015f8:	02a00793          	li	a5,42
    802015fc:	00f71e63          	bne	a4,a5,80201618 <vprintfmt+0x13c>
                flags.width = va_arg(vl, int);
    80201600:	f4843783          	ld	a5,-184(s0)
    80201604:	00878713          	add	a4,a5,8
    80201608:	f4e43423          	sd	a4,-184(s0)
    8020160c:	0007a783          	lw	a5,0(a5)
    80201610:	f8f42423          	sw	a5,-120(s0)
    80201614:	6880006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt >= '1' && *fmt <= '9') {
    80201618:	f5043783          	ld	a5,-176(s0)
    8020161c:	0007c783          	lbu	a5,0(a5)
    80201620:	00078713          	mv	a4,a5
    80201624:	03000793          	li	a5,48
    80201628:	04e7f663          	bgeu	a5,a4,80201674 <vprintfmt+0x198>
    8020162c:	f5043783          	ld	a5,-176(s0)
    80201630:	0007c783          	lbu	a5,0(a5)
    80201634:	00078713          	mv	a4,a5
    80201638:	03900793          	li	a5,57
    8020163c:	02e7ec63          	bltu	a5,a4,80201674 <vprintfmt+0x198>
                flags.width = strtol(fmt, (char **)&fmt, 10);
    80201640:	f5043783          	ld	a5,-176(s0)
    80201644:	f5040713          	add	a4,s0,-176
    80201648:	00a00613          	li	a2,10
    8020164c:	00070593          	mv	a1,a4
    80201650:	00078513          	mv	a0,a5
    80201654:	88dff0ef          	jal	80200ee0 <strtol>
    80201658:	00050793          	mv	a5,a0
    8020165c:	0007879b          	sext.w	a5,a5
    80201660:	f8f42423          	sw	a5,-120(s0)
                fmt--;
    80201664:	f5043783          	ld	a5,-176(s0)
    80201668:	fff78793          	add	a5,a5,-1
    8020166c:	f4f43823          	sd	a5,-176(s0)
    80201670:	62c0006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == '.') {
    80201674:	f5043783          	ld	a5,-176(s0)
    80201678:	0007c783          	lbu	a5,0(a5)
    8020167c:	00078713          	mv	a4,a5
    80201680:	02e00793          	li	a5,46
    80201684:	06f71863          	bne	a4,a5,802016f4 <vprintfmt+0x218>
                fmt++;
    80201688:	f5043783          	ld	a5,-176(s0)
    8020168c:	00178793          	add	a5,a5,1
    80201690:	f4f43823          	sd	a5,-176(s0)
                if (*fmt == '*') {
    80201694:	f5043783          	ld	a5,-176(s0)
    80201698:	0007c783          	lbu	a5,0(a5)
    8020169c:	00078713          	mv	a4,a5
    802016a0:	02a00793          	li	a5,42
    802016a4:	00f71e63          	bne	a4,a5,802016c0 <vprintfmt+0x1e4>
                    flags.prec = va_arg(vl, int);
    802016a8:	f4843783          	ld	a5,-184(s0)
    802016ac:	00878713          	add	a4,a5,8
    802016b0:	f4e43423          	sd	a4,-184(s0)
    802016b4:	0007a783          	lw	a5,0(a5)
    802016b8:	f8f42623          	sw	a5,-116(s0)
    802016bc:	5e00006f          	j	80201c9c <vprintfmt+0x7c0>
                } else {
                    flags.prec = strtol(fmt, (char **)&fmt, 10);
    802016c0:	f5043783          	ld	a5,-176(s0)
    802016c4:	f5040713          	add	a4,s0,-176
    802016c8:	00a00613          	li	a2,10
    802016cc:	00070593          	mv	a1,a4
    802016d0:	00078513          	mv	a0,a5
    802016d4:	80dff0ef          	jal	80200ee0 <strtol>
    802016d8:	00050793          	mv	a5,a0
    802016dc:	0007879b          	sext.w	a5,a5
    802016e0:	f8f42623          	sw	a5,-116(s0)
                    fmt--;
    802016e4:	f5043783          	ld	a5,-176(s0)
    802016e8:	fff78793          	add	a5,a5,-1
    802016ec:	f4f43823          	sd	a5,-176(s0)
    802016f0:	5ac0006f          	j	80201c9c <vprintfmt+0x7c0>
                }
            } else if (*fmt == 'x' || *fmt == 'X' || *fmt == 'p') {
    802016f4:	f5043783          	ld	a5,-176(s0)
    802016f8:	0007c783          	lbu	a5,0(a5)
    802016fc:	00078713          	mv	a4,a5
    80201700:	07800793          	li	a5,120
    80201704:	02f70663          	beq	a4,a5,80201730 <vprintfmt+0x254>
    80201708:	f5043783          	ld	a5,-176(s0)
    8020170c:	0007c783          	lbu	a5,0(a5)
    80201710:	00078713          	mv	a4,a5
    80201714:	05800793          	li	a5,88
    80201718:	00f70c63          	beq	a4,a5,80201730 <vprintfmt+0x254>
    8020171c:	f5043783          	ld	a5,-176(s0)
    80201720:	0007c783          	lbu	a5,0(a5)
    80201724:	00078713          	mv	a4,a5
    80201728:	07000793          	li	a5,112
    8020172c:	30f71263          	bne	a4,a5,80201a30 <vprintfmt+0x554>
                bool is_long = *fmt == 'p' || flags.longflag;
    80201730:	f5043783          	ld	a5,-176(s0)
    80201734:	0007c783          	lbu	a5,0(a5)
    80201738:	00078713          	mv	a4,a5
    8020173c:	07000793          	li	a5,112
    80201740:	00f70663          	beq	a4,a5,8020174c <vprintfmt+0x270>
    80201744:	f8144783          	lbu	a5,-127(s0)
    80201748:	00078663          	beqz	a5,80201754 <vprintfmt+0x278>
    8020174c:	00100793          	li	a5,1
    80201750:	0080006f          	j	80201758 <vprintfmt+0x27c>
    80201754:	00000793          	li	a5,0
    80201758:	faf403a3          	sb	a5,-89(s0)
    8020175c:	fa744783          	lbu	a5,-89(s0)
    80201760:	0017f793          	and	a5,a5,1
    80201764:	faf403a3          	sb	a5,-89(s0)

                unsigned long num = is_long ? va_arg(vl, unsigned long) : va_arg(vl, unsigned int);
    80201768:	fa744783          	lbu	a5,-89(s0)
    8020176c:	0ff7f793          	zext.b	a5,a5
    80201770:	00078c63          	beqz	a5,80201788 <vprintfmt+0x2ac>
    80201774:	f4843783          	ld	a5,-184(s0)
    80201778:	00878713          	add	a4,a5,8
    8020177c:	f4e43423          	sd	a4,-184(s0)
    80201780:	0007b783          	ld	a5,0(a5)
    80201784:	01c0006f          	j	802017a0 <vprintfmt+0x2c4>
    80201788:	f4843783          	ld	a5,-184(s0)
    8020178c:	00878713          	add	a4,a5,8
    80201790:	f4e43423          	sd	a4,-184(s0)
    80201794:	0007a783          	lw	a5,0(a5)
    80201798:	02079793          	sll	a5,a5,0x20
    8020179c:	0207d793          	srl	a5,a5,0x20
    802017a0:	fef43023          	sd	a5,-32(s0)

                if (flags.prec == 0 && num == 0 && *fmt != 'p') {
    802017a4:	f8c42783          	lw	a5,-116(s0)
    802017a8:	02079463          	bnez	a5,802017d0 <vprintfmt+0x2f4>
    802017ac:	fe043783          	ld	a5,-32(s0)
    802017b0:	02079063          	bnez	a5,802017d0 <vprintfmt+0x2f4>
    802017b4:	f5043783          	ld	a5,-176(s0)
    802017b8:	0007c783          	lbu	a5,0(a5)
    802017bc:	00078713          	mv	a4,a5
    802017c0:	07000793          	li	a5,112
    802017c4:	00f70663          	beq	a4,a5,802017d0 <vprintfmt+0x2f4>
                    flags.in_format = false;
    802017c8:	f8040023          	sb	zero,-128(s0)
    802017cc:	4d00006f          	j	80201c9c <vprintfmt+0x7c0>
                    continue;
                }

                // 0x prefix for pointers, or, if # flag is set and non-zero
                bool prefix = *fmt == 'p' || (flags.sharpflag && num != 0);
    802017d0:	f5043783          	ld	a5,-176(s0)
    802017d4:	0007c783          	lbu	a5,0(a5)
    802017d8:	00078713          	mv	a4,a5
    802017dc:	07000793          	li	a5,112
    802017e0:	00f70a63          	beq	a4,a5,802017f4 <vprintfmt+0x318>
    802017e4:	f8244783          	lbu	a5,-126(s0)
    802017e8:	00078a63          	beqz	a5,802017fc <vprintfmt+0x320>
    802017ec:	fe043783          	ld	a5,-32(s0)
    802017f0:	00078663          	beqz	a5,802017fc <vprintfmt+0x320>
    802017f4:	00100793          	li	a5,1
    802017f8:	0080006f          	j	80201800 <vprintfmt+0x324>
    802017fc:	00000793          	li	a5,0
    80201800:	faf40323          	sb	a5,-90(s0)
    80201804:	fa644783          	lbu	a5,-90(s0)
    80201808:	0017f793          	and	a5,a5,1
    8020180c:	faf40323          	sb	a5,-90(s0)

                int hexdigits = 0;
    80201810:	fc042e23          	sw	zero,-36(s0)
                const char *xdigits = *fmt == 'X' ? upperxdigits : lowerxdigits;
    80201814:	f5043783          	ld	a5,-176(s0)
    80201818:	0007c783          	lbu	a5,0(a5)
    8020181c:	00078713          	mv	a4,a5
    80201820:	05800793          	li	a5,88
    80201824:	00f71863          	bne	a4,a5,80201834 <vprintfmt+0x358>
    80201828:	00001797          	auipc	a5,0x1
    8020182c:	98078793          	add	a5,a5,-1664 # 802021a8 <upperxdigits.1>
    80201830:	00c0006f          	j	8020183c <vprintfmt+0x360>
    80201834:	00001797          	auipc	a5,0x1
    80201838:	98c78793          	add	a5,a5,-1652 # 802021c0 <lowerxdigits.0>
    8020183c:	f8f43c23          	sd	a5,-104(s0)
                char buf[2 * sizeof(unsigned long)];

                do {
                    buf[hexdigits++] = xdigits[num & 0xf];
    80201840:	fe043783          	ld	a5,-32(s0)
    80201844:	00f7f793          	and	a5,a5,15
    80201848:	f9843703          	ld	a4,-104(s0)
    8020184c:	00f70733          	add	a4,a4,a5
    80201850:	fdc42783          	lw	a5,-36(s0)
    80201854:	0017869b          	addw	a3,a5,1
    80201858:	fcd42e23          	sw	a3,-36(s0)
    8020185c:	00074703          	lbu	a4,0(a4)
    80201860:	ff078793          	add	a5,a5,-16
    80201864:	008787b3          	add	a5,a5,s0
    80201868:	f8e78023          	sb	a4,-128(a5)
                    num >>= 4;
    8020186c:	fe043783          	ld	a5,-32(s0)
    80201870:	0047d793          	srl	a5,a5,0x4
    80201874:	fef43023          	sd	a5,-32(s0)
                } while (num);
    80201878:	fe043783          	ld	a5,-32(s0)
    8020187c:	fc0792e3          	bnez	a5,80201840 <vprintfmt+0x364>

                if (flags.prec == -1 && flags.zeroflag) {
    80201880:	f8c42783          	lw	a5,-116(s0)
    80201884:	00078713          	mv	a4,a5
    80201888:	fff00793          	li	a5,-1
    8020188c:	02f71663          	bne	a4,a5,802018b8 <vprintfmt+0x3dc>
    80201890:	f8344783          	lbu	a5,-125(s0)
    80201894:	02078263          	beqz	a5,802018b8 <vprintfmt+0x3dc>
                    flags.prec = flags.width - 2 * prefix;
    80201898:	f8842703          	lw	a4,-120(s0)
    8020189c:	fa644783          	lbu	a5,-90(s0)
    802018a0:	0007879b          	sext.w	a5,a5
    802018a4:	0017979b          	sllw	a5,a5,0x1
    802018a8:	0007879b          	sext.w	a5,a5
    802018ac:	40f707bb          	subw	a5,a4,a5
    802018b0:	0007879b          	sext.w	a5,a5
    802018b4:	f8f42623          	sw	a5,-116(s0)
                }

                for (int i = flags.width - 2 * prefix - __MAX(hexdigits, flags.prec); i > 0; i--) {
    802018b8:	f8842703          	lw	a4,-120(s0)
    802018bc:	fa644783          	lbu	a5,-90(s0)
    802018c0:	0007879b          	sext.w	a5,a5
    802018c4:	0017979b          	sllw	a5,a5,0x1
    802018c8:	0007879b          	sext.w	a5,a5
    802018cc:	40f707bb          	subw	a5,a4,a5
    802018d0:	0007871b          	sext.w	a4,a5
    802018d4:	fdc42783          	lw	a5,-36(s0)
    802018d8:	f8f42a23          	sw	a5,-108(s0)
    802018dc:	f8c42783          	lw	a5,-116(s0)
    802018e0:	f8f42823          	sw	a5,-112(s0)
    802018e4:	f9442783          	lw	a5,-108(s0)
    802018e8:	00078593          	mv	a1,a5
    802018ec:	f9042783          	lw	a5,-112(s0)
    802018f0:	00078613          	mv	a2,a5
    802018f4:	0006069b          	sext.w	a3,a2
    802018f8:	0005879b          	sext.w	a5,a1
    802018fc:	00f6d463          	bge	a3,a5,80201904 <vprintfmt+0x428>
    80201900:	00058613          	mv	a2,a1
    80201904:	0006079b          	sext.w	a5,a2
    80201908:	40f707bb          	subw	a5,a4,a5
    8020190c:	fcf42c23          	sw	a5,-40(s0)
    80201910:	0280006f          	j	80201938 <vprintfmt+0x45c>
                    putch(' ');
    80201914:	f5843783          	ld	a5,-168(s0)
    80201918:	02000513          	li	a0,32
    8020191c:	000780e7          	jalr	a5
                    ++written;
    80201920:	fec42783          	lw	a5,-20(s0)
    80201924:	0017879b          	addw	a5,a5,1
    80201928:	fef42623          	sw	a5,-20(s0)
                for (int i = flags.width - 2 * prefix - __MAX(hexdigits, flags.prec); i > 0; i--) {
    8020192c:	fd842783          	lw	a5,-40(s0)
    80201930:	fff7879b          	addw	a5,a5,-1
    80201934:	fcf42c23          	sw	a5,-40(s0)
    80201938:	fd842783          	lw	a5,-40(s0)
    8020193c:	0007879b          	sext.w	a5,a5
    80201940:	fcf04ae3          	bgtz	a5,80201914 <vprintfmt+0x438>
                }

                if (prefix) {
    80201944:	fa644783          	lbu	a5,-90(s0)
    80201948:	0ff7f793          	zext.b	a5,a5
    8020194c:	04078463          	beqz	a5,80201994 <vprintfmt+0x4b8>
                    putch('0');
    80201950:	f5843783          	ld	a5,-168(s0)
    80201954:	03000513          	li	a0,48
    80201958:	000780e7          	jalr	a5
                    putch(*fmt == 'X' ? 'X' : 'x');
    8020195c:	f5043783          	ld	a5,-176(s0)
    80201960:	0007c783          	lbu	a5,0(a5)
    80201964:	00078713          	mv	a4,a5
    80201968:	05800793          	li	a5,88
    8020196c:	00f71663          	bne	a4,a5,80201978 <vprintfmt+0x49c>
    80201970:	05800793          	li	a5,88
    80201974:	0080006f          	j	8020197c <vprintfmt+0x4a0>
    80201978:	07800793          	li	a5,120
    8020197c:	f5843703          	ld	a4,-168(s0)
    80201980:	00078513          	mv	a0,a5
    80201984:	000700e7          	jalr	a4
                    written += 2;
    80201988:	fec42783          	lw	a5,-20(s0)
    8020198c:	0027879b          	addw	a5,a5,2
    80201990:	fef42623          	sw	a5,-20(s0)
                }

                for (int i = hexdigits; i < flags.prec; i++) {
    80201994:	fdc42783          	lw	a5,-36(s0)
    80201998:	fcf42a23          	sw	a5,-44(s0)
    8020199c:	0280006f          	j	802019c4 <vprintfmt+0x4e8>
                    putch('0');
    802019a0:	f5843783          	ld	a5,-168(s0)
    802019a4:	03000513          	li	a0,48
    802019a8:	000780e7          	jalr	a5
                    ++written;
    802019ac:	fec42783          	lw	a5,-20(s0)
    802019b0:	0017879b          	addw	a5,a5,1
    802019b4:	fef42623          	sw	a5,-20(s0)
                for (int i = hexdigits; i < flags.prec; i++) {
    802019b8:	fd442783          	lw	a5,-44(s0)
    802019bc:	0017879b          	addw	a5,a5,1
    802019c0:	fcf42a23          	sw	a5,-44(s0)
    802019c4:	f8c42703          	lw	a4,-116(s0)
    802019c8:	fd442783          	lw	a5,-44(s0)
    802019cc:	0007879b          	sext.w	a5,a5
    802019d0:	fce7c8e3          	blt	a5,a4,802019a0 <vprintfmt+0x4c4>
                }

                for (int i = hexdigits - 1; i >= 0; i--) {
    802019d4:	fdc42783          	lw	a5,-36(s0)
    802019d8:	fff7879b          	addw	a5,a5,-1
    802019dc:	fcf42823          	sw	a5,-48(s0)
    802019e0:	03c0006f          	j	80201a1c <vprintfmt+0x540>
                    putch(buf[i]);
    802019e4:	fd042783          	lw	a5,-48(s0)
    802019e8:	ff078793          	add	a5,a5,-16
    802019ec:	008787b3          	add	a5,a5,s0
    802019f0:	f807c783          	lbu	a5,-128(a5)
    802019f4:	0007871b          	sext.w	a4,a5
    802019f8:	f5843783          	ld	a5,-168(s0)
    802019fc:	00070513          	mv	a0,a4
    80201a00:	000780e7          	jalr	a5
                    ++written;
    80201a04:	fec42783          	lw	a5,-20(s0)
    80201a08:	0017879b          	addw	a5,a5,1
    80201a0c:	fef42623          	sw	a5,-20(s0)
                for (int i = hexdigits - 1; i >= 0; i--) {
    80201a10:	fd042783          	lw	a5,-48(s0)
    80201a14:	fff7879b          	addw	a5,a5,-1
    80201a18:	fcf42823          	sw	a5,-48(s0)
    80201a1c:	fd042783          	lw	a5,-48(s0)
    80201a20:	0007879b          	sext.w	a5,a5
    80201a24:	fc07d0e3          	bgez	a5,802019e4 <vprintfmt+0x508>
                }

                flags.in_format = false;
    80201a28:	f8040023          	sb	zero,-128(s0)
            } else if (*fmt == 'x' || *fmt == 'X' || *fmt == 'p') {
    80201a2c:	2700006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == 'd' || *fmt == 'i' || *fmt == 'u') {
    80201a30:	f5043783          	ld	a5,-176(s0)
    80201a34:	0007c783          	lbu	a5,0(a5)
    80201a38:	00078713          	mv	a4,a5
    80201a3c:	06400793          	li	a5,100
    80201a40:	02f70663          	beq	a4,a5,80201a6c <vprintfmt+0x590>
    80201a44:	f5043783          	ld	a5,-176(s0)
    80201a48:	0007c783          	lbu	a5,0(a5)
    80201a4c:	00078713          	mv	a4,a5
    80201a50:	06900793          	li	a5,105
    80201a54:	00f70c63          	beq	a4,a5,80201a6c <vprintfmt+0x590>
    80201a58:	f5043783          	ld	a5,-176(s0)
    80201a5c:	0007c783          	lbu	a5,0(a5)
    80201a60:	00078713          	mv	a4,a5
    80201a64:	07500793          	li	a5,117
    80201a68:	08f71063          	bne	a4,a5,80201ae8 <vprintfmt+0x60c>
                long num = flags.longflag ? va_arg(vl, long) : va_arg(vl, int);
    80201a6c:	f8144783          	lbu	a5,-127(s0)
    80201a70:	00078c63          	beqz	a5,80201a88 <vprintfmt+0x5ac>
    80201a74:	f4843783          	ld	a5,-184(s0)
    80201a78:	00878713          	add	a4,a5,8
    80201a7c:	f4e43423          	sd	a4,-184(s0)
    80201a80:	0007b783          	ld	a5,0(a5)
    80201a84:	0140006f          	j	80201a98 <vprintfmt+0x5bc>
    80201a88:	f4843783          	ld	a5,-184(s0)
    80201a8c:	00878713          	add	a4,a5,8
    80201a90:	f4e43423          	sd	a4,-184(s0)
    80201a94:	0007a783          	lw	a5,0(a5)
    80201a98:	faf43423          	sd	a5,-88(s0)

                written += print_dec_int(putch, num, *fmt != 'u', &flags);
    80201a9c:	fa843583          	ld	a1,-88(s0)
    80201aa0:	f5043783          	ld	a5,-176(s0)
    80201aa4:	0007c783          	lbu	a5,0(a5)
    80201aa8:	0007871b          	sext.w	a4,a5
    80201aac:	07500793          	li	a5,117
    80201ab0:	40f707b3          	sub	a5,a4,a5
    80201ab4:	00f037b3          	snez	a5,a5
    80201ab8:	0ff7f793          	zext.b	a5,a5
    80201abc:	f8040713          	add	a4,s0,-128
    80201ac0:	00070693          	mv	a3,a4
    80201ac4:	00078613          	mv	a2,a5
    80201ac8:	f5843503          	ld	a0,-168(s0)
    80201acc:	f08ff0ef          	jal	802011d4 <print_dec_int>
    80201ad0:	00050793          	mv	a5,a0
    80201ad4:	fec42703          	lw	a4,-20(s0)
    80201ad8:	00f707bb          	addw	a5,a4,a5
    80201adc:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    80201ae0:	f8040023          	sb	zero,-128(s0)
            } else if (*fmt == 'd' || *fmt == 'i' || *fmt == 'u') {
    80201ae4:	1b80006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == 'n') {
    80201ae8:	f5043783          	ld	a5,-176(s0)
    80201aec:	0007c783          	lbu	a5,0(a5)
    80201af0:	00078713          	mv	a4,a5
    80201af4:	06e00793          	li	a5,110
    80201af8:	04f71c63          	bne	a4,a5,80201b50 <vprintfmt+0x674>
                if (flags.longflag) {
    80201afc:	f8144783          	lbu	a5,-127(s0)
    80201b00:	02078463          	beqz	a5,80201b28 <vprintfmt+0x64c>
                    long *n = va_arg(vl, long *);
    80201b04:	f4843783          	ld	a5,-184(s0)
    80201b08:	00878713          	add	a4,a5,8
    80201b0c:	f4e43423          	sd	a4,-184(s0)
    80201b10:	0007b783          	ld	a5,0(a5)
    80201b14:	faf43823          	sd	a5,-80(s0)
                    *n = written;
    80201b18:	fec42703          	lw	a4,-20(s0)
    80201b1c:	fb043783          	ld	a5,-80(s0)
    80201b20:	00e7b023          	sd	a4,0(a5)
    80201b24:	0240006f          	j	80201b48 <vprintfmt+0x66c>
                } else {
                    int *n = va_arg(vl, int *);
    80201b28:	f4843783          	ld	a5,-184(s0)
    80201b2c:	00878713          	add	a4,a5,8
    80201b30:	f4e43423          	sd	a4,-184(s0)
    80201b34:	0007b783          	ld	a5,0(a5)
    80201b38:	faf43c23          	sd	a5,-72(s0)
                    *n = written;
    80201b3c:	fb843783          	ld	a5,-72(s0)
    80201b40:	fec42703          	lw	a4,-20(s0)
    80201b44:	00e7a023          	sw	a4,0(a5)
                }
                flags.in_format = false;
    80201b48:	f8040023          	sb	zero,-128(s0)
    80201b4c:	1500006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == 's') {
    80201b50:	f5043783          	ld	a5,-176(s0)
    80201b54:	0007c783          	lbu	a5,0(a5)
    80201b58:	00078713          	mv	a4,a5
    80201b5c:	07300793          	li	a5,115
    80201b60:	02f71e63          	bne	a4,a5,80201b9c <vprintfmt+0x6c0>
                const char *s = va_arg(vl, const char *);
    80201b64:	f4843783          	ld	a5,-184(s0)
    80201b68:	00878713          	add	a4,a5,8
    80201b6c:	f4e43423          	sd	a4,-184(s0)
    80201b70:	0007b783          	ld	a5,0(a5)
    80201b74:	fcf43023          	sd	a5,-64(s0)
                written += puts_wo_nl(putch, s);
    80201b78:	fc043583          	ld	a1,-64(s0)
    80201b7c:	f5843503          	ld	a0,-168(s0)
    80201b80:	dccff0ef          	jal	8020114c <puts_wo_nl>
    80201b84:	00050793          	mv	a5,a0
    80201b88:	fec42703          	lw	a4,-20(s0)
    80201b8c:	00f707bb          	addw	a5,a4,a5
    80201b90:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    80201b94:	f8040023          	sb	zero,-128(s0)
    80201b98:	1040006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == 'c') {
    80201b9c:	f5043783          	ld	a5,-176(s0)
    80201ba0:	0007c783          	lbu	a5,0(a5)
    80201ba4:	00078713          	mv	a4,a5
    80201ba8:	06300793          	li	a5,99
    80201bac:	02f71e63          	bne	a4,a5,80201be8 <vprintfmt+0x70c>
                int ch = va_arg(vl, int);
    80201bb0:	f4843783          	ld	a5,-184(s0)
    80201bb4:	00878713          	add	a4,a5,8
    80201bb8:	f4e43423          	sd	a4,-184(s0)
    80201bbc:	0007a783          	lw	a5,0(a5)
    80201bc0:	fcf42623          	sw	a5,-52(s0)
                putch(ch);
    80201bc4:	fcc42703          	lw	a4,-52(s0)
    80201bc8:	f5843783          	ld	a5,-168(s0)
    80201bcc:	00070513          	mv	a0,a4
    80201bd0:	000780e7          	jalr	a5
                ++written;
    80201bd4:	fec42783          	lw	a5,-20(s0)
    80201bd8:	0017879b          	addw	a5,a5,1
    80201bdc:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    80201be0:	f8040023          	sb	zero,-128(s0)
    80201be4:	0b80006f          	j	80201c9c <vprintfmt+0x7c0>
            } else if (*fmt == '%') {
    80201be8:	f5043783          	ld	a5,-176(s0)
    80201bec:	0007c783          	lbu	a5,0(a5)
    80201bf0:	00078713          	mv	a4,a5
    80201bf4:	02500793          	li	a5,37
    80201bf8:	02f71263          	bne	a4,a5,80201c1c <vprintfmt+0x740>
                putch('%');
    80201bfc:	f5843783          	ld	a5,-168(s0)
    80201c00:	02500513          	li	a0,37
    80201c04:	000780e7          	jalr	a5
                ++written;
    80201c08:	fec42783          	lw	a5,-20(s0)
    80201c0c:	0017879b          	addw	a5,a5,1
    80201c10:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    80201c14:	f8040023          	sb	zero,-128(s0)
    80201c18:	0840006f          	j	80201c9c <vprintfmt+0x7c0>
            } else {
                putch(*fmt);
    80201c1c:	f5043783          	ld	a5,-176(s0)
    80201c20:	0007c783          	lbu	a5,0(a5)
    80201c24:	0007871b          	sext.w	a4,a5
    80201c28:	f5843783          	ld	a5,-168(s0)
    80201c2c:	00070513          	mv	a0,a4
    80201c30:	000780e7          	jalr	a5
                ++written;
    80201c34:	fec42783          	lw	a5,-20(s0)
    80201c38:	0017879b          	addw	a5,a5,1
    80201c3c:	fef42623          	sw	a5,-20(s0)
                flags.in_format = false;
    80201c40:	f8040023          	sb	zero,-128(s0)
    80201c44:	0580006f          	j	80201c9c <vprintfmt+0x7c0>
            }
        } else if (*fmt == '%') {
    80201c48:	f5043783          	ld	a5,-176(s0)
    80201c4c:	0007c783          	lbu	a5,0(a5)
    80201c50:	00078713          	mv	a4,a5
    80201c54:	02500793          	li	a5,37
    80201c58:	02f71063          	bne	a4,a5,80201c78 <vprintfmt+0x79c>
            flags = (struct fmt_flags) {.in_format = true, .prec = -1};
    80201c5c:	f8043023          	sd	zero,-128(s0)
    80201c60:	f8043423          	sd	zero,-120(s0)
    80201c64:	00100793          	li	a5,1
    80201c68:	f8f40023          	sb	a5,-128(s0)
    80201c6c:	fff00793          	li	a5,-1
    80201c70:	f8f42623          	sw	a5,-116(s0)
    80201c74:	0280006f          	j	80201c9c <vprintfmt+0x7c0>
        } else {
            putch(*fmt);
    80201c78:	f5043783          	ld	a5,-176(s0)
    80201c7c:	0007c783          	lbu	a5,0(a5)
    80201c80:	0007871b          	sext.w	a4,a5
    80201c84:	f5843783          	ld	a5,-168(s0)
    80201c88:	00070513          	mv	a0,a4
    80201c8c:	000780e7          	jalr	a5
            ++written;
    80201c90:	fec42783          	lw	a5,-20(s0)
    80201c94:	0017879b          	addw	a5,a5,1
    80201c98:	fef42623          	sw	a5,-20(s0)
    for (; *fmt; fmt++) {
    80201c9c:	f5043783          	ld	a5,-176(s0)
    80201ca0:	00178793          	add	a5,a5,1
    80201ca4:	f4f43823          	sd	a5,-176(s0)
    80201ca8:	f5043783          	ld	a5,-176(s0)
    80201cac:	0007c783          	lbu	a5,0(a5)
    80201cb0:	84079ce3          	bnez	a5,80201508 <vprintfmt+0x2c>
        }
    }

    return written;
    80201cb4:	fec42783          	lw	a5,-20(s0)
}
    80201cb8:	00078513          	mv	a0,a5
    80201cbc:	0b813083          	ld	ra,184(sp)
    80201cc0:	0b013403          	ld	s0,176(sp)
    80201cc4:	0c010113          	add	sp,sp,192
    80201cc8:	00008067          	ret

0000000080201ccc <call_print>:
void call_print() {
    80201ccc:	ff010113          	add	sp,sp,-16
    80201cd0:	00113423          	sd	ra,8(sp)
    80201cd4:	00813023          	sd	s0,0(sp)
    80201cd8:	01010413          	add	s0,sp,16
    printk("here!\n");
    80201cdc:	00000517          	auipc	a0,0x0
    80201ce0:	4c450513          	add	a0,a0,1220 # 802021a0 <_srodata+0x1a0>
    80201ce4:	018000ef          	jal	80201cfc <printk>
}
    80201ce8:	00000013          	nop
    80201cec:	00813083          	ld	ra,8(sp)
    80201cf0:	00013403          	ld	s0,0(sp)
    80201cf4:	01010113          	add	sp,sp,16
    80201cf8:	00008067          	ret

0000000080201cfc <printk>:
int printk(const char* s, ...) {
    80201cfc:	f9010113          	add	sp,sp,-112
    80201d00:	02113423          	sd	ra,40(sp)
    80201d04:	02813023          	sd	s0,32(sp)
    80201d08:	03010413          	add	s0,sp,48
    80201d0c:	fca43c23          	sd	a0,-40(s0)
    80201d10:	00b43423          	sd	a1,8(s0)
    80201d14:	00c43823          	sd	a2,16(s0)
    80201d18:	00d43c23          	sd	a3,24(s0)
    80201d1c:	02e43023          	sd	a4,32(s0)
    80201d20:	02f43423          	sd	a5,40(s0)
    80201d24:	03043823          	sd	a6,48(s0)
    80201d28:	03143c23          	sd	a7,56(s0)
    int res = 0;
    80201d2c:	fe042623          	sw	zero,-20(s0)
    va_list vl;
    va_start(vl, s);
    80201d30:	04040793          	add	a5,s0,64
    80201d34:	fcf43823          	sd	a5,-48(s0)
    80201d38:	fd043783          	ld	a5,-48(s0)
    80201d3c:	fc878793          	add	a5,a5,-56
    80201d40:	fef43023          	sd	a5,-32(s0)
    res = vprintfmt(putc, s, vl);
    80201d44:	fe043783          	ld	a5,-32(s0)
    80201d48:	00078613          	mv	a2,a5
    80201d4c:	fd843583          	ld	a1,-40(s0)
    80201d50:	fffff517          	auipc	a0,0xfffff
    80201d54:	0e850513          	add	a0,a0,232 # 80200e38 <putc>
    80201d58:	f84ff0ef          	jal	802014dc <vprintfmt>
    80201d5c:	00050793          	mv	a5,a0
    80201d60:	fef42623          	sw	a5,-20(s0)
    va_end(vl);
    return res;
    80201d64:	fec42783          	lw	a5,-20(s0)
}
    80201d68:	00078513          	mv	a0,a5
    80201d6c:	02813083          	ld	ra,40(sp)
    80201d70:	02013403          	ld	s0,32(sp)
    80201d74:	07010113          	add	sp,sp,112
    80201d78:	00008067          	ret

0000000080201d7c <srand>:
#include "stdint.h"
#include "stdlib.h"

static uint64_t seed;

void srand(unsigned s) {
    80201d7c:	fe010113          	add	sp,sp,-32
    80201d80:	00813c23          	sd	s0,24(sp)
    80201d84:	02010413          	add	s0,sp,32
    80201d88:	00050793          	mv	a5,a0
    80201d8c:	fef42623          	sw	a5,-20(s0)
    seed = s - 1;
    80201d90:	fec42783          	lw	a5,-20(s0)
    80201d94:	fff7879b          	addw	a5,a5,-1
    80201d98:	0007879b          	sext.w	a5,a5
    80201d9c:	02079713          	sll	a4,a5,0x20
    80201da0:	02075713          	srl	a4,a4,0x20
    80201da4:	00003797          	auipc	a5,0x3
    80201da8:	2cc78793          	add	a5,a5,716 # 80205070 <seed>
    80201dac:	00e7b023          	sd	a4,0(a5)
}
    80201db0:	00000013          	nop
    80201db4:	01813403          	ld	s0,24(sp)
    80201db8:	02010113          	add	sp,sp,32
    80201dbc:	00008067          	ret

0000000080201dc0 <rand>:

int rand(void) {
    80201dc0:	ff010113          	add	sp,sp,-16
    80201dc4:	00813423          	sd	s0,8(sp)
    80201dc8:	01010413          	add	s0,sp,16
    seed = 6364136223846793005ULL * seed + 1;
    80201dcc:	00003797          	auipc	a5,0x3
    80201dd0:	2a478793          	add	a5,a5,676 # 80205070 <seed>
    80201dd4:	0007b703          	ld	a4,0(a5)
    80201dd8:	00000797          	auipc	a5,0x0
    80201ddc:	40078793          	add	a5,a5,1024 # 802021d8 <lowerxdigits.0+0x18>
    80201de0:	0007b783          	ld	a5,0(a5)
    80201de4:	02f707b3          	mul	a5,a4,a5
    80201de8:	00178713          	add	a4,a5,1
    80201dec:	00003797          	auipc	a5,0x3
    80201df0:	28478793          	add	a5,a5,644 # 80205070 <seed>
    80201df4:	00e7b023          	sd	a4,0(a5)
    return seed >> 33;
    80201df8:	00003797          	auipc	a5,0x3
    80201dfc:	27878793          	add	a5,a5,632 # 80205070 <seed>
    80201e00:	0007b783          	ld	a5,0(a5)
    80201e04:	0217d793          	srl	a5,a5,0x21
    80201e08:	0007879b          	sext.w	a5,a5
}
    80201e0c:	00078513          	mv	a0,a5
    80201e10:	00813403          	ld	s0,8(sp)
    80201e14:	01010113          	add	sp,sp,16
    80201e18:	00008067          	ret

0000000080201e1c <memset>:
#include "string.h"
#include "stdint.h"

void *memset(void *dest, int c, uint64_t n) {
    80201e1c:	fc010113          	add	sp,sp,-64
    80201e20:	02813c23          	sd	s0,56(sp)
    80201e24:	04010413          	add	s0,sp,64
    80201e28:	fca43c23          	sd	a0,-40(s0)
    80201e2c:	00058793          	mv	a5,a1
    80201e30:	fcc43423          	sd	a2,-56(s0)
    80201e34:	fcf42a23          	sw	a5,-44(s0)
    char *s = (char *)dest;
    80201e38:	fd843783          	ld	a5,-40(s0)
    80201e3c:	fef43023          	sd	a5,-32(s0)
    for (uint64_t i = 0; i < n; ++i) {
    80201e40:	fe043423          	sd	zero,-24(s0)
    80201e44:	0280006f          	j	80201e6c <memset+0x50>
        s[i] = c;
    80201e48:	fe043703          	ld	a4,-32(s0)
    80201e4c:	fe843783          	ld	a5,-24(s0)
    80201e50:	00f707b3          	add	a5,a4,a5
    80201e54:	fd442703          	lw	a4,-44(s0)
    80201e58:	0ff77713          	zext.b	a4,a4
    80201e5c:	00e78023          	sb	a4,0(a5)
    for (uint64_t i = 0; i < n; ++i) {
    80201e60:	fe843783          	ld	a5,-24(s0)
    80201e64:	00178793          	add	a5,a5,1
    80201e68:	fef43423          	sd	a5,-24(s0)
    80201e6c:	fe843703          	ld	a4,-24(s0)
    80201e70:	fc843783          	ld	a5,-56(s0)
    80201e74:	fcf76ae3          	bltu	a4,a5,80201e48 <memset+0x2c>
    }
    return dest;
    80201e78:	fd843783          	ld	a5,-40(s0)
}
    80201e7c:	00078513          	mv	a0,a5
    80201e80:	03813403          	ld	s0,56(sp)
    80201e84:	04010113          	add	sp,sp,64
    80201e88:	00008067          	ret
