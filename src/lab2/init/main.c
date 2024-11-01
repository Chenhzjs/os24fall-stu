#include "printk.h"
#include "defs.h"
extern void test();

int start_kernel() {
    printk("2024");
    printk(" ZJU Operating System\n");
    // uint64_t sstatus_val = csr_read(sstatus);
    // printk("sstatus = %x\n", sstatus_val);

    // uint64_t sscratch_val_read = csr_read(sscratch);
    // printk("before write sscratch = %x\n", sscratch_val_read);

    // uint64_t sscratch_val = 9;
    // csr_write(sscratch, sscratch_val);
    // sscratch_val_read = csr_read(sscratch);
    // printk("after write sscratch = %x\n", sscratch_val_read);
    test();
    return 0;
}
