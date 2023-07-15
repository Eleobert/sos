.equ UART_BASE, 0x10000000

.option norvc

.section .data
msg: .string "Booting SOS."

.section .text.init
.global _start


_start:
    call park_harts
    la   sp, stack_top 
    la   a0, msg
    call uart_putsln
    call power_off

park_harts:
    csrr t0, mhartid
    bnez t0, park
    ret
park:
    wfi

power_off:
    li   a5, 1048576
    li   a4, 20480
    addi a4, a4,1365
    sw   a4, 0(a5)
