
.globl chat3
chat3:
	mov x1, 0x80000
	mov x3, 0x1234
	ldr x2, [x1]
	ldr x2, [x1, #8]
	ldr x2, [x1, x3]
	ldr x2, [x1, x3, LSL #3]
	ret

