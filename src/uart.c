#define UART_BASE 0x10000000

void uart_putchar(char c)
{
    *(char*) UART_BASE = c;
}

void uart_puts(char* s)
{
    while(*s != '\0')
    {
        uart_putchar(*s);
        s++;
    }
}

void uart_putsln(char* s)
{
    uart_puts(s);
    uart_putchar('\n');
}