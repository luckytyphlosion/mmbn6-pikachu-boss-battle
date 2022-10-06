
oBattleObject_PanelX equ 0x12
oBattleObject_PanelY equ 0x13
oBattleObject_PanelXY equ 0x12
	
oBattleObject_Alliance equ 0x16
oBattleObject_RelatedObject1Ptr equ 0x4c
oBattleObject_AIDataPtr equ 0x58

oAIData_Unk_58 equ 0x58

oAIState_CurState equ 0x0

oAIAttackVars_playerObject_2c equ 0x2c

eToolkit_ShopData equ 0x20032c8
eToolkit_ShopDataEnd equ 0x200414c

eTrackedMovementCount equ 0x20032c8
eTrackedMovementStartPos equ eTrackedMovementCount + 2
eTrackedMovement equ eTrackedMovementStartPos + 2 ; 0x20032cc
eTrackedMovementEnd equ 0x2004148

oTrackedMovement_PlayerPanelX equ 0
oTrackedMovement_PlayerPanelY equ 1
oTrackedMovement_PlayerPanelXY equ 0

oTrackedMovement_OpponentPanelX equ 2
oTrackedMovement_OpponentPanelY equ 3
oTrackedMovement_OpponentPanelXY equ 2

oTrackedMovement_Duration equ 4 ; 2 bytes

TRACKED_MOVEMENT_MAX_ENTRIES equ 16
