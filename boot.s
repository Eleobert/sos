.option norvc

.section .text.init
.global _start


_start:
    call park_harts
    la   sp, stack_top 
    call kmain

park_harts:
    csrr t0, mhartid
    bnez t0, park
    ret
park:
    wfi
