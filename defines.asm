.vdefinelabel sfx_play, 0x080005CC, 0x080005CC
.vdefinelabel memory_zero8, 0x080008B4, 0x080008B4
.vdefinelabel memory_copy8, 0x08000920, 0x08000920
.vdefinelabel list_shuffle_byte, 0x08000C72, 0x08000C72
.vdefinelabel math_get_thow_speeds, 0x08001330, 0x08001330
.vdefinelabel rng1_get_int, 0x08001532, 0x08001532
.vdefinelabel sprite_load_animation_data, 0x080026A4, 0x080026A4
.vdefinelabel sprite_load, 0x080026E4, 0x080026E4
.vdefinelabel sprite_decompress, 0x08002A64, 0x08002A64
.vdefinelabel sprite_set_animation, 0x08002DA4, 0x08002DA4
.vdefinelabel sprite_has_shadow, 0x08002E3C, 0x08002E3C
.vdefinelabel sprite_set_color_shader, 0x08002ED0, 0x08002ED0
.vdefinelabel sprite_set_flip, 0x08002F5C, 0x08002F5C
.vdefinelabel sprite_no_shadow, 0x08002F90, 0x08002F90
.vdefinelabel object_type1_allocate, 0x08003320, 0x08003320

.vdefinelabel ow_begin_battle, 0x08005BC8, 0x08005B98
.vdefinelabel screen_transition_begin, 0x08006270, 0x08006264
.vdefinelabel object_crack_panel, 0x0800C938, 0x0800CF54
.vdefinelabel object_highlight_panel, 0x0800CBD8, 0x0800D1F4
.vdefinelabel object_is_current_panel_valid, 0x0800CC66, 0x0800D282
.vdefinelabel object_check_panel_parameters, 0x0800CC86, 0x0800D2A2
.vdefinelabel object_is_current_panel_solid, 0x0800CCA6, 0x0800D2C2
.vdefinelabel object_is_panel_solid, 0x0800CCB2, 0x0800D2CE
.vdefinelabel object_highlight_current_collision_panels, 0x0800CCBE, 0x0800D2DA
.vdefinelabel object_highlight_panel_region, 0x0800CCD4, 0x0800D2F0
.vdefinelabel object_get_panels_except_current_filtered, 0x0800CE64, 0x0800D480
.vdefinelabel object_get_panels_filtered, 0x0800CEA0, 0x0800D4BC
.vdefinelabel object_get_panels_in_row_filtered, 0x0800D012, 0x0800D62E
.vdefinelabel object_get_panel_region, 0x0800D3FE, 0x0800DA1A
.vdefinelabel object_get_coordinates_for_panels, 0x0800E276, 0x0800E892
.vdefinelabel object_set_coordinates_from_panels, 0x0800E29C, 0x0800E8B8
.vdefinelabel object_set_panels_from_coordinates, 0x0800E2AC, 0x0800E8C8
.vdefinelabel object_get_front_direction, 0x0800E2CA, 0x0800E8E6
.vdefinelabel object_get_flip_direction, 0x0800E2CE, 0x0800E8EA
.vdefinelabel object_get_flip, 0x0800E456, 0x0800EA72
.vdefinelabel object_can_move, 0x0800E5E2, 0x0800EBFE
.vdefinelabel object_set_counter_time, 0x0800E9DC, 0x0800EFF8
.vdefinelabel object_set_invulnerable_time, 0x0800EAFA, 0x0800F116
.vdefinelabel object_clear_invulnerable_time, 0x0800EB08, 0x0800F124
.vdefinelabel object_set_default_counter_time, 0x0800FDB6, 0x080103BE
.vdefinelabel battle_find_player, 0x080103BC, 0x080109C4
.vdefinelabel object_setattack0, 0x08011680, 0x08011C90
.vdefinelabel object_exit_attack_state, 0x08011714, 0x08011D24
.vdefinelabel object_generic_destroy, 0x08016C8A, 0x0801721A
.vdefinelabel object_update_collision_panels, 0x0801A04C, 0x0801A5CC
.vdefinelabel object_clear_collision_region, 0x0801A074, 0x0801A5F4
.vdefinelabel object_set_collision_region, 0x0801A07C, 0x0801A5FC
.vdefinelabel object_update_collision_data, 0x0801A082, 0x0801A602
.vdefinelabel object_set_flag, 0x0801A152, 0x0801A6D2
.vdefinelabel object_clear_flag, 0x0801A15C, 0x0801A6DC
.vdefinelabel object_reserve_panel, 0x0801BB1C, 0x0801BF38
.vdefinelabel object_remove_panel_reserve, 0x0801BB46, 0x0801BF62
.vdefinelabel object_update_sprite_timestop, 0x0801BBF4, 0x0801C010
.vdefinelabel camera_shake, 0x080302A8, 0x08031264
.vdefinelabel temp_attack_object_spawn, 0x080B8E30, 0x080BAEC0
.vdefinelabel collision_region_spawn, 0x080C536A, 0x080C82BC
.vdefinelabel collision_region_spawn_timefreeze, 0x080C53A6, 0x080C82FA
.vdefinelabel thunderbolt_object_spawn, 0x080C7D50, 0x080CB650
.vdefinelabel thunderball_object_spawn, 0x080C954C, 0x080CCE4C
.vdefinelabel diveman_wave_object_spawn, 0x080CB1E2, 0x080CEAD6
.vdefinelabel effect_object_spawn, 0x080E05F6, 0x080E3E5E
.vdefinelabel illusion_object_spawn, 0x080E33FA, 0x080E7FD2
.vdefinelabel illusion_object_no_flicker, 0x080E3422, 0x080E7FFA
.vdefinelabel judgeman_choose_panel, 0x080FCCBC, 0x08102678

.definelabel ZeroFillByEightWords, 0x08000900
.definelabel battle_is_paused, 0x0800a03c
.definelabel battle_is_timestop, 0x0800a098
.definelabel object_setattack4, 0x08011690
.definelabel CheckIfOpposingAllianceInObjectRow, 0x8109746
.definelabel armadilo_choose_panel, 0x81156AC
.definelabel GetAllianceDependentPanelParamArgs, 0x81096FA
.definelabel spawnChargeShotChargeObject_80E0F02, 0x80E0F02
