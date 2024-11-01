#include "mm.h"
#include "defs.h"
#include "proc.h"
#include "stdlib.h"
#include "printk.h"

extern void __dummy();

struct task_struct *idle;           // idle process
struct task_struct *current;        // 指向当前运行线程的 task_struct
struct task_struct *task[NR_TASKS]; // 线程数组，所有的线程都保存在此

void task_init() {
    srand(2024);

    // 1. 调用 kalloc() 为 idle 分配一个物理页
    idle = (struct task_struct*)kalloc();
    // idle->thread.sp = (uint64_t)idle + PGSIZE;
    // idle->thread.ra = (uint64_t)__dummy;
    // 2. 设置 state 为 TASK_RUNNING;
    idle->state = TASK_RUNNING;
    // 3. 由于 idle 不参与调度，可以将其 counter / priority 设置为 0
    idle->counter = 0;
    idle->priority = 0;
    // 4. 设置 idle 的 pid 为 0
    idle->pid = 0;
    // 5. 将 current 和 task[0] 指向 idle
    current = idle;
    task[0] = idle;

    // 1. 参考 idle 的设置，为 task[1] ~ task[NR_TASKS - 1] 进行初始化
    // 2. 其中每个线程的 state 为 TASK_RUNNING, 此外，counter 和 priority 进行如下赋值：
    //     - counter  = 0;
    //     - priority = rand() 产生的随机数（控制范围在 [PRIORITY_MIN, PRIORITY_MAX] 之间）
    // 3. 为 task[1] ~ task[NR_TASKS - 1] 设置 thread_struct 中的 ra 和 sp
    //     - ra 设置为 __dummy（见 4.2.2）的地址
    //     - sp 设置为该线程申请的物理页的高地址
    for (int i = 1; i < NR_TASKS; i ++) {
        task[i] = (struct task_struct*)kalloc();
        task[i]->thread.sp = (uint64_t)task[i] + PGSIZE;
        task[i]->thread.ra = (uint64_t)__dummy;
        task[i]->state = TASK_RUNNING;
        task[i]->counter = 0;
        task[i]->priority = PRIORITY_MIN + rand() % (PRIORITY_MAX - PRIORITY_MIN + 1);
        task[i]->pid = i;
    }
    

    /* YOUR CODE HERE */

    printk("...task_init done!\n");
}
extern void __switch_to(struct task_struct *prev, struct task_struct *next);
/*判断下一个执行的线程 next 与当前的线程 current 是否为同一个线程，
如果是同一个线程，则无需做任何处理，否则调用 __switch_to 进行线程切换 */
void switch_to(struct task_struct *next) {
    // YOUR CODE HERE
    if (current != next) {
        struct task_struct *prev = current;
        // printk("switch now!\n");
        // 因为 __switch_to 改变了 ra，所以得在前面赋值
        current = next;
        __switch_to(prev, next);
    }
}

/* 在时钟中断处理中被调用，用于判断是否需要进行调度 */
void do_timer() {
    if (current == idle || current->counter == 0) { // 1. 如果当前线程是 idle 线程或当前线程时间片耗尽则直接进行调度
        // printk("schedule!\n");
        schedule();
    } else { // 2. 否则对当前线程的运行剩余时间减 1，若剩余时间仍然大于 0 则直接返回，否则进行调度
         current->counter --;
        if (current->counter > 0) return ;
        else schedule();
    }
    // YOUR CODE HERE
}

/* 调度程序，选择出下一个运行的线程 */
void schedule() {
    int k = 0;
    for (int i = 1; i < NR_TASKS; i ++) { // 调度时选择 counter 最大的线程运行
        if (task[i]->counter > 0) {
            if (k == 0) k = i;
            else if (task[i]->counter > task[k]->counter) {
                k = i;
            }
        }
        // printk("i = %d, counter = %d\n", i, task[i]->counter);
    }
    // printk("k = %d, counter = %d\n", k, task[k]->counter);
    if (k == 0) { // 如果所有线程 counter 都为 0，则令所有线程 counter = priority
        for (int i = 1; i < NR_TASKS; i ++) { // 调度时选择 counter 最大的线程运行
            task[i]->counter = task[i]->priority;
            printk("SET [PID = %d PRIORITY = %d COUNTER = %d]\n", i, task[i]->priority, task[i]->counter);
        }
        schedule();
        return ;
    }
    switch_to(task[k]);
}

#if TEST_SCHED
#define MAX_OUTPUT ((NR_TASKS - 1) * 10)
char tasks_output[MAX_OUTPUT];
int tasks_output_index = 0;
char expected_output[] = "2222222222111111133334222222222211111113";
#include "sbi.h"
#endif

void dummy() {
    uint64_t MOD = 1000000007;
    uint64_t auto_inc_local_var = 0;
    int last_counter = -1;
    // printk("dummy!");
    while (1) {
        if ((last_counter == -1 || current->counter != last_counter) && current->counter > 0) {
            if (current->counter == 1) {
                --(current->counter);   // forced the counter to be zero if this thread is going to be scheduled
            }                           // in case that the new counter is also 1, leading the information not printed.
            last_counter = current->counter;
            auto_inc_local_var = (auto_inc_local_var + 1) % MOD;
            printk("[PID = %d] is running. COUNTER = %d, auto_inc_local_var = %d\n", current->pid, current->counter, auto_inc_local_var);
            #if TEST_SCHED
            tasks_output[tasks_output_index++] = current->pid + '0';
            if (tasks_output_index == MAX_OUTPUT) {
                for (int i = 0; i < MAX_OUTPUT; ++i) {
                    if (tasks_output[i] != expected_output[i]) {
                        printk("\033[31mTest failed!\033[0m\n");
                        printk("\033[31m    Expected: %s\033[0m\n", expected_output);
                        printk("\033[31m    Got:      %s\033[0m\n", tasks_output);
                        sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN, SBI_SRST_RESET_REASON_NONE);
                    }
                }
                printk("\033[32mTest passed!\033[0m\n");
                printk("\033[32m    Output: %s\033[0m\n", expected_output);
                sbi_system_reset(SBI_SRST_RESET_TYPE_SHUTDOWN, SBI_SRST_RESET_REASON_NONE);
            }
            #endif
        }
    }
}
