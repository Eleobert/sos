#include "uart.h"

void poweroff();

void kmain()
{
    uart_putsln("Booting SOS");
    poweroff();
}