#include "mm.h"


#define MY_LABLE	0x1999a9aaa1aa11a0
my_lable:
	.word	0xbb
string:
	.string "boot in benos"

.section ".text.boot"
.globl _start
_start:
	mrs	x0, mpidr_el1		
	and	x0, x0,#0xFF		// 检查处理器核心ID
	cbz	x0, master		// 除了CPU0，其他CPU都会在这里死循环等待
	b	proc_hang

proc_hang: 
	b 	proc_hang

master:
	mov 	x0, 0xffff0000ffff
	mov 	x0, 0x12bc0000
	ldr 	x0, =MY_LABLE
	ldr 	x0, [x1, 1]
	ldr 	x0, [x1, 8]
	ldr 	x0, [x1, 1]!
	ldr 	x0, [x1, 255]!
	ldr	x1, =my_lable
//	ldr 	x0, MY_LABLE
	ldr 	x1, my_lable
	ldr 	x0, =string
	ldr 	x1, string
	adr	x0, bss_begin
	adr	x1, bss_end
	sub	x1, x1, x0
	bl 	memzero

	mov	sp, #LOW_MEMORY 
	bl	kernel_main
	b 	proc_hang
