#define GPM4BASE 0x11000000
#define GPM4CON  0x2e0
#define GPM4DAT  0x2e4

.text
.align 2
.global _start

_start:
	@保存现场
	mov ip, sp
	push {fp, ip, lr, pc}
	sub fp, ip, #4

	@设置GPM4[0:3]引脚为输出功能
	ldr r0, =GPM4BASE
	ldr r1, [r0, #GPM4CON]
	ldr r2, =0xffff
	bic r1, r1, r2
	ldr r2, =0x1111
	orr r1, r1, r2
	str r1, [r0, #GPM4CON]

	@设置让4个led全亮
	ldr r0, =GPM4BASE
	ldrb r1, [r0, #GPM4DAT]
	bic r1, r1, #0xf
	strb r1, [r0, #GPM4DAT]

	@恢复现场
	sub sp, fp, #12
	ldm sp, {fp, sp, pc}
