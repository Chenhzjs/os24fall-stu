#include "stdint.h"
#include "printk.h"
#include "clock.h"
#include "proc.h"
void trap_handler(uint64_t scause, uint64_t sepc) {
    // 通过 `scause` 判断 trap 类型
    // 如果是 interrupt 判断是否是 timer interrupt
    // 如果是 timer interrupt 则打印输出相关信息，并通过 `clock_set_next_event()` 设置下一次时钟中断
    // `clock_set_next_event()` 见 4.3.4 节
    // 其他 interrupt / exception 可以直接忽略，推荐打印出来供以后调试
    if (scause >> 63 == 1) {
        // printk("%x %x\n", scause, scause & 0x7fffffffffffffff);
        if ((scause & 0x7fffffffffffffff) == 5) {
            // printk("[S] Supervisor Mode Timer Interrupt\n");
            clock_set_next_event();
            do_timer();
        } else {
            printk("Other Interrupt\n");
            clock_set_next_event();
        }
    }

}