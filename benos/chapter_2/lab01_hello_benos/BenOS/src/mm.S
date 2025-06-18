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
	orr 	x3, x1, x1, LSL #8
	orr 	x3, x3, x3, LSL #16
	orr 	x3, x3, x3, LSL #32
	mov 	x1, x3
	mov     x4, x0
	
	ands 	x5, x0, #0x0f
	b.eq 	2f
	mov 	x6, #16
	sub 	x5, x6, x5
	sub 	x2, x2, x5
1:
	strb 	w1, [x4], #1
	subs 	x5, x5, #1
	b.gt 	1b
2:
	stp 	x1, x3, [x4], #16
	sub 	x2, x2, #16
	cmp 	x2, #16
	b.ge 	2b
1:
	strb 	w1, [x4], #1
	subs 	x2, x2, #1
	b.gt 	1b


	ret
	
