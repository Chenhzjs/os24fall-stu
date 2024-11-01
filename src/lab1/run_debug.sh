#!/bin/bash
qemu-system-riscv64 -nographic -machine virt -kernel ./arch/riscv/boot/Image \
    -device virtio-blk-device,drive=hd0 -append "root=/dev/vda ro console=ttyS0" \
    -bios default -drive file=~/os_course/os24fall-stu/src/lab0/rootfs.img,format=raw,id=hd0 -S -s
