riscv64-unknown-elf-as boot.s -o boot.o && \
riscv64-unknown-elf-gcc -Wall -Wextra -c -mcmodel=medany src/kernel.c -o kernel.o -ffreestanding && \
riscv64-unknown-elf-gcc -Wall -Wextra -c -mcmodel=medany src/syscon.c  -o syscon.o -ffreestanding && \
riscv64-unknown-elf-gcc -Wall -Wextra -c -mcmodel=medany src/uart.c -o uart.o -ffreestanding && \
riscv64-unknown-elf-ld -Tlink.lds boot.o kernel.o syscon.o uart.o -o boot.elf && \
qemu-system-riscv64 -machine virt -m 100M -smp 1 -nographic -bios none -kernel boot.elf
