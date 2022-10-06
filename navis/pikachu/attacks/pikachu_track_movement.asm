
pikachu_track_movement:
	push r4-r7, r14
	mov r0, r8
	push r0

	; Find the opponent every time just in case
	ldrb r0, [r5, oBattleObject_Alliance]
	mov r1, 1
	eor r0, r1
	bl battle_find_player
	str r0, [r7, oAIAttackVars_playerObject_2c] ;set found enemy megaman
	mov r8, r7

	ldr r3, =eTrackedMovementCount
	ldrh r0, [r3]
	tst r0, r0
	beq @@addNewEntry	
	cmp r0, TRACKED_MOVEMENT_MAX_ENTRIES
	blt @@notAtMaxEntries
	ldrh r0, [r3, 2] ; eTrackedMovementStartPos
	tst r0, r0
	bne @@dontLoadWithMax
	mov r0, TRACKED_MOVEMENT_MAX_ENTRIES
@@dontLoadWithMax:
@@notAtMaxEntries:
	sub r0, r0, 1
	lsl r0, r0, 3 ; * 8
	add r3, r3, r0
	add r3, r3, 4 ; r3 = &eTrackedMovement[*eTrackedMovementCount - 1]

	mov r7, r8
	ldr r0, [r7, oAIAttackVars_playerObject_2c]
	ldrh r1, [r0, oBattleObject_PanelXY]
	ldrh r2, [r3, oTrackedMovement_PlayerPanelXY]
	cmp r1, r2
	beq @@incrementDuration
@@addNewEntry:
	ldr r3, =eTrackedMovementCount
	ldrh r0, [r3]
	cmp r0, TRACKED_MOVEMENT_MAX_ENTRIES
	bge @@addNewEntry_atMaxEntries
	; increment entry count if not at max
	add r0, r0, 1
	strh r0, [r3]
	sub r0, r0, 1
	b @@addNewEntry_gotEntryIndex
@@addNewEntry_atMaxEntries:
	ldrh r0, [r3, 2] ; eTrackedMovementStartPos
	add r0, r0, 1
	cmp r0, TRACKED_MOVEMENT_MAX_ENTRIES
	blt @@addNewEntry_dontResetStartPos
	mov r0, 0
@@addNewEntry_dontResetStartPos:
	strh r0, [r3, 2]
@@addNewEntry_gotEntryIndex:
	lsl r0, r0, 3
	add r3, r3, r0
	add r3, r3, 4
	mov r7, r8
	ldr r0, [r7, oAIAttackVars_playerObject_2c]
	; copy player panel coords to tracked movement
	ldrh r1, [r0, oBattleObject_PanelXY]
	strh r1, [r3, oTrackedMovement_PlayerPanelXY]
	; copy enemy panel coords to tracked movement
	ldrh r1, [r5, oBattleObject_PanelXY]
	strh r1, [r3, oTrackedMovement_OpponentPanelXY]
	; set initial duration to 1
	mov r1, 1
	b @@storeDuration
@@incrementDuration:
	ldrh r1, [r3, oTrackedMovement_Duration]
	add r1, r1, 1
@@storeDuration:
	strh r1, [r3, oTrackedMovement_Duration]
@@done:
	pop r0
	mov r8, r0
	pop r4-r7, r15
	.pool
