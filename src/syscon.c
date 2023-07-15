#include "uart.h"
#include <stdint.h>

#define SYSCON_ADDR 0x100000

void poweroff() 
{
  uart_putsln("shuting down");
  *(uint32_t*) SYSCON_ADDR = 0x5555;
}