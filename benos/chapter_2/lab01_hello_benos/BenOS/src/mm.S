.globl memzero
memzero:
	str xzr, [x0], #8
	subs x1, x1, #8
	b.gt memzero
	ret

.globl memcpy
memcpy:
	ldr 	x3, [x0], #8
	str 	x3, [x1], #8
	subs 	x2, x2, #8
	b.gt 	memcpy
	ret

.globl memset
memset:
	mov 	x4, x0
	orr 	x3, x1, x1, LSL #8
	orr 	x3, x3, x3, LSL #16
	orr 	x3, x3, x3, LSL #32
	mov 	x1, x3
1:
	stp 	x1, x3, [x4], #16
	subs 	x2, x2, #16
	b.gt 	1b
	ret
	
