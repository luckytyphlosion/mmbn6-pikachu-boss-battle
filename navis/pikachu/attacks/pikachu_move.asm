pikachu_move:
	push r7, r14
	ldr r1, =@@pikachu_move_pool
	ldrb r0, [r7, 0x00]
	ldr r1, [r0, r1]
	mov r14, r15
	bx r1
	pop r7, r15
	.pool
@@pikachu_move_pool:
	.word pikachu_move_start|1
	.word pikachu_move_end|1
	.word pikachu_move_end_idle|1

pikachu_move_start:
	push r4,r14
	ldrb r0, [r7, 0x01]
	tst r0, r0
	bne @@step_initialized
	mov r0, 0x04
	strb r0, [r7, 0x01]
	bl object_can_move
	beq @@doNotMove
; get movement direction
	ldr r1, =@@DirectionToPanelOffsets
	ldrb r0, [r7, 0xc]
	lsl r0, r0, 1
	add r1, r1, r0
	; get panel offsets
	mov r2, 0
	ldrsb r0, [r1, r2]
	mov r2, 1
	ldrsb r1, [r1, r2]

	; panel x, y
	ldrb r2, [r5, oBattleObject_PanelX]
	ldrb r3, [r5, oBattleObject_PanelY]
	add r2, r2, r0
	add r4, r2, 1 ; negative check
	beq @@doNotMove
	cmp r2, 8
	bge @@doNotMove

	add r3, r3, r1
	add r4, r3, 1 ; negative check
	beq @@doNotMove
	cmp r3, 5
	bge @@doNotMove

	mov r0, r2
	mov r1, r3

	strb r0, [r5, oBattleObject_FuturePanelX]
	strb r1, [r5, oBattleObject_FuturePanelY]
	bl object_reserve_panel
	mov r0, 0x40
	bl object_set_flag
	mov r0, PIKACHU_ANIMATION_MOVE_OUT
	strb r0, [r5, 0x10]
	mov r0, 0x02
	strb r0, [r7, 0x10]
@@step_initialized:
	ldrb r0, [r7, 0x10]
	sub r0,1
	strb r0, [r7, 0x10]
	bge @@endroutine
	mov r0, 0x04
	strh r0, [r7, 0x00]
	b @@endroutine
@@doNotMove:
	bl object_exit_attack_state
@@endroutine:
	pop r4,r15

	.align 4
@@DirectionToPanelOffsets:
	.byte 0, -1
	.byte 0, 1
	.byte -1, 0
	.byte 1, 0

FindPanelYOfFirstOpposingAllianceInFrontOfObject:
	push r4,r6,r7,lr
	bl object_get_front_direction
	mov r4, r0
	mov r7, 1
@@findOpposingAllianceColumnLoop:
	ldrb r6, [r5, 0x14]
	add r6, r6, r4
	; r4 - facing direction
	; r6 - panel X in front of object
	; r7 - panel Y to look through
@@findOpposingAllianceRowLoop:
	mov r0, r6
	mov r1, r7
	ldr r3, =pikachu_opposing_alliance_parameters
	bl GetAllianceDependentPanelParamArgs
	bl object_check_panel_parameters
	cmp r0, 0
	bne @@foundOpposingAlliance
	add r6, r6, r4
	beq @@reachedPanelX0
	cmp r6, 7
	bne @@findOpposingAllianceRowLoop
@@reachedPanelX0:
	add r7, 1
	cmp r7, 4
	bne @@findOpposingAllianceColumnLoop
	mov r0, 0
	b @@failure
@@foundOpposingAlliance:
	mov r0, r7
@@failure:
	pop r4,r6,r7,pc
	.pool

pikachu_move_end:
	push r4,r14
	ldrb r0,[r7, 0x01]
	tst r0,r0
	bne @@step_initialized
	mov r0, 0x04
	strb r0,[r7, 0x01]
	ldrb r0, [r5, 0x14]
	ldrb r1, [r5, 0x15]
	strb r0, [r5, 0x12]
	strb r1, [r5, 0x13]
	bl object_remove_panel_reserve
	bl object_set_coordinates_from_panels
	bl object_update_collision_panels
	mov r0, 0x40
	bl object_clear_flag
	mov r0, 0x01
	lsl r0, r0, 0x13
	bl object_set_flag
	mov r0, PIKACHU_ANIMATION_MOVE_IN
	strb r0, [r5, 0x10]
	mov r0, 0x04
	strh r0, [r7, 0x10]
@@step_initialized:
	ldrh r0, [r7, 0x10]
	sub r0, 0x01
	strh r0, [r7, 0x10]
	bgt @@endroutine
	mov r0, 0x08
	strh r0, [r7, 0x00]
@@endroutine:
	pop r4,r15

pikachu_move_end_idle:
	push r14
	ldrb r0, [r7, 0x01]
	tst r0, r0
	bne @@step_initialized
	mov r0, 0x04 
	strb r0, [r7, 0x01]
	mov r0, PIKACHU_ANIMATION_IDLE
	strb r0, [r5, 0x10]
	mov r0, 5
	strh r0, [r7, 0x10]
	b @@endroutine
@@step_initialized:
	ldrh r0, [r7,0x10]
	sub r0, 0x01
	strb r0, [r7,0x10]
	bgt @@endroutine
	bl object_exit_attack_state
@@endroutine:
	pop r15
.pool
;eof