
	; patch out when input is read from eJoypad_Held, which eventually makes its way to AI data
	.org 0x801FF84
	ldr r0, =PatchTransferJoypad|1
	bx r0
	.pool

	; custom gauge always full
	.org 0x801DF92
	push lr
	ldr r0, [pc, 0x1c] ; =0x4000
	bl SetCustGauge
	mov r0, #0x10
	bl battle_clear_flags
	pop pc

	; disable folder shuffling
	.org SHUFFLE_FOLDER_SLICE_ADDR
	mov pc, lr

	; treat gigas as standard chips (keeps them in place)
	.org 0x800a590
	nop

	; ignore chip codes when selecting
	.org 0x8028f00
	b 0x8028f3e
