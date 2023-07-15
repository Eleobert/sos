.equ UART_BASE, 0x10000000

.option norvc

.section .data
msg: .string "Booting SOS.\n"

.section .text.init
.global _start


_start:
    call park_harts
    la   a0, msg
    call uart_puts
    wfi


uart_putc:
    li t2, UART_BASE
    sb a0, (t2)
    ret


uart_puts:
    li t1, UART_BASE
cont:
    lb   t2, (a0)
    beqz t2, break
    sb   t2, (t1)
    addi a0, a0, 1
    j    cont
break:
    ret

park_harts:
    csrr t0, mhartid
    bnez t0, park
    ret
park:
    wfi
