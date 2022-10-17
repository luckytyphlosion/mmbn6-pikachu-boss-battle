
oBattleObject_PanelX equ 0x12
oBattleObject_PanelY equ 0x13
oBattleObject_PanelXY equ 0x12
oBattleObject_FuturePanelX equ 0x14
oBattleObject_FuturePanelY equ 0x15

oBattleObject_Alliance equ 0x16
oBattleObject_HP equ 0x24
oBattleObject_MaxHP equ 0x26
oBattleObject_RelatedObject1Ptr equ 0x4c
oBattleObject_AIDataPtr equ 0x58

oAIData_Unk_1d equ 0x1d
oAIData_Unk_1e equ 0x1e
oAIData_Unk_58 equ 0x58
oAIData_AIState equ 0x80
oAIData_AttackVars equ 0xa0

oAIState_CurState equ 0x0
oAIState_ChargeTimer equ 0x2

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

TRACKED_MOVEMENT_MAX_ENTRIES equ 64

oToolkit_JoypadPtr equ 0x4
oJoypad_Held equ 0x0
oJoypad_Pressed equ 0x2

JOYPAD_DEFAULT equ 0xFC00
JOYPAD_A equ 0x0001
JOYPAD_B equ 0x0002
JOYPAD_SELECT equ 0x0004
JOYPAD_START equ 0x0008
JOYPAD_RIGHT equ 0x0010
JOYPAD_LEFT equ 0x0020
JOYPAD_UP equ 0x0040
JOYPAD_DOWN equ 0x0080
JOYPAD_ARROWS equ JOYPAD_RIGHT | JOYPAD_LEFT | JOYPAD_UP | JOYPAD_DOWN
JOYPAD_R equ 0x0100
JOYPAD_L equ 0x0200
