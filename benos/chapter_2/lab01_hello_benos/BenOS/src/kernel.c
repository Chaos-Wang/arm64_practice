#include "uart.h"
#include "mm.h"

void *unalign_addr = 0x80004;
void *unalign_addr1 = 0x80001;
void *unalign_addr2 = 0x80008;

void kernel_main(void)
{
	char src[132] = "Welcome, Benosi\n";
	char dst[16];
	uart_init();
	uart_send_string("Welcome BenOS!\r\n");

	memcpy(src, dst, 16);
	char *ret = memset(unalign_addr1, 'c', 53);
	memcpy(unalign_addr, unalign_addr1, 16);
	memcpy(unalign_addr1, unalign_addr2, 16);
	memcpy(unalign_addr2, unalign_addr1, 16);

	uart_send_string(src);
	uart_send_string(dst);
	
	while (1) {
		uart_send(uart_recv());
	}
}
