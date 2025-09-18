include

hijack_nmi = $008366
hijack_turn_reset = $029122
hijack_battle_start = $0084A0
hijack_damage_enemy = $00DCA4
hijack_kill_enemy = $00DCAB
hijack_every_frame = $1C8069



org hijack_nmi
	JSL upload_custom_text_to_vram
	WDM

org hijack_turn_reset
	JSL increment_turn_counter
	WDM

org hijack_battle_start
	JSL clear_new_battle_ram
	WDM

org hijack_damage_enemy
	JSL update_last_turn_damage
	NOP

org hijack_kill_enemy
	JSL update_last_turn_damage_2
	NOP

org hijack_every_frame
	JSL populate_custom_text_buffer