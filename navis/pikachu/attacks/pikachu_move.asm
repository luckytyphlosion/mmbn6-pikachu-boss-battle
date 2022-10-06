pikachu_move:
	push r7, r14
	ldr r1, =@@pikachu_move_pool
	ldrb r0, [r7, 0x00]
	ldr r1, [r0, r1]
	mov r14, r15
	bx r1
	bl pikachu_track_movement
	bl pikachu_update_charge
	pop r7, r15
	.pool
@@pikachu_move_pool:
	.word pikachu_move_start_idle|1
	.word pikachu_move_start|1
	.word pikachu_move_end|1
	.word pikachu_move_end_idle|1

pikachu_move_start_idle:
	push r14
	mov r0, 0x04
	strh r0, [r7, 0x00]
	bl pikachu_move_start
	pop r15

;	push r14
;	ldrb r0, [r7, 0x01]
;	tst r0, r0
;	bne @@step_initialized
;	; check if panel Y is 2 before deciding whether to fake out
;	ldrb r0, [r5, 0x15]
;	cmp r0, 2
;	bne @@noDelay
;	bl rng1_get_int
;	lsl r1, r0, 32-2
;	lsr r1, r1, 32-2
;	tst r1, r1
;	bne @@noDelay
;	mov r0, 0x04 
;	strb r0, [r7, 0x01]
;	mov r0, 13
;	strh r0, [r7, 0x10]
;	b @@endroutine
;@@step_initialized:
;	ldrh r0, [r7,0x10]
;	sub r0, 0x01
;	strb r0, [r7,0x10]
;	bgt @@endroutine
;	mov r0, 0x04
;	strh r0, [r7, 0x00]
;	b @@endroutine
;@@noDelay:
;	mov r0, 0x04
;	strh r0, [r7, 0x00]
;	bl pikachu_move_start
;@@endroutine:
;	pop r15

pikachu_move_start:
	push r4,r14
	ldrb r0, [r7, 0x01]
	tst r0, r0
	bne @@step_initialized
	mov r0, 0x04
	strb r0, [r7, 0x01]
	bl object_can_move
	beq @@cantmove
;Get move parameters based on which side pikachu is on
	bl FindPanelYOfFirstOpposingAllianceInFrontOfObject
	tst r0, r0
	bne @@foundPanelY
@@cantmove:
	mov r0, 0x08
	strh r0, [r7, 0x00]
	b @@endroutine
@@foundPanelY:
	ldrb r1, [r5, 0x15]
	; r0 = opposing panel y
	; r1 = object panel y
	mov r2, -1 ; minus 1 from current panel
	cmp r0, r1
	blt @@gotPanelYOffset
	mov r2, 1
	cmp r0, r1
	bgt @@gotPanelYOffset
	; same row, but we have to move anyway for footsies to confuse opponent
	cmp r1, 1
	beq @@gotPanelYOffset
	mov r2, -1
	cmp r1, 3
	beq @@gotPanelYOffset
	; in center, 50/50
	push r1
	bl rng1_get_int
	; random bit to avoid RNG carryover maybe
	lsl r0, r0, 32-9
	lsr r0, r0, 32-1
	mov r2, -1
	tst r0, r0
	pop r1
	beq @@gotPanelYOffset
	mov r2, 1
@@gotPanelYOffset:
	add r1, r1, r2
	strb r1, [r5, 0x15]
	ldrb r0, [r5, 0x14]
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
	mov r0, 0x08
	strh r0, [r7, 0x00]
@@endroutine:
	pop r4,r15

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
	mov r0, 0x0c
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
	mov r0, 7
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