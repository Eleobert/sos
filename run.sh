riscv64-unknown-elf-as boot.s -o boot.o
riscv64-unknown-elf-ld -Tlink.lds boot.o -o boot.elf
qemu-system-riscv64 -machine virt -m 100M -smp 1 -nographic -bios none -kernel boot.elf