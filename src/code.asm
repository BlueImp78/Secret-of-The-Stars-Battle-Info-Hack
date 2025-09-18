populate_custom_text_buffer:
	LDA $20
	CMP #$05
	BNE .return

	PHP
	PHB
	PEA wram_base>>8
	PLB
	PLB

	REP #$30
	LDA player_pressed
	BIT #$0040			;Check if X button pressed
	BEQ .no_press
	LDA info_display_toggle
	INC
	CMP #$0004
	BCC .update_toggle
	LDA #$0000
.update_toggle:
	STA info_display_toggle
	STA previous_info_display
	INC full_info_block_clear_flag
.no_press:
	STZ enemy_slot_iteration_count
	LDX #enemy_slot_base
	LDY #$0000
.next_slot:
	SEP #$20
	LDA $7E0000,x			;Get enemy ID
	BPL .enemy_found
	REP #$20
	CPX #$6100
	BEQ .done			;Bandaid fix, prevent nasty post battle stuff if missing enemy is first one
	JSR clear_slot_info
.next_slot_2:
	TXA
	CLC
	ADC #$001C
	TAX
	LDA enemy_slot_iteration_count
	INC
	STA enemy_slot_iteration_count
	CMP #$0004
	BCC .next_slot
.done:
	LDA #$FFFF
	STA custom_text_buffer,y	;Write terminator
	PLB
	PLP
.return:
  	LDX $54				;Hijacked instruction
  	CPX $53				;Hijacked instruction
	RTL


.enemy_found:
	REP #$20
	PHX				;Preserve found enemy's index
	LDA enemy_slot_iteration_count
	ASL
	TAX
.loop:
	LDA $02B5			;Check bg3 scroll 
	BEQ .default_addresses		;If 0, we're idling in menus, load default vram addresses
	CMP #$002C
	BNE ..no_clear
	INC full_info_block_clear_flag
	STZ damage_tally
..no_clear:
	LDA.l text_vram_alt_addresses,x ;Else we're actively fighting, load alt vram addresses
	STZ info_display_toggle		;Default info preset to HP
	BRA +

.default_addresses:
	LDA previous_info_display
	STA info_display_toggle
	LDA.l text_vram_base_addresses,x
+:
	STA custom_text_buffer,y
	INY
	INY
	LDA info_display_toggle
	ASL
	TAX
	JMP (.shit,x)


.shit:
	dw .display_hp
	dw .display_xp_and_gold
	dw .display_item_drop
	dw .display_turn_and_dps






.display_hp:
	LDX #$0000
..loop:
	LDA.l enemy_hp_text,x
	BMI ..label_text_done
	STA custom_text_buffer,y
	INX
	INX
	INY
	INY
	BRA ..loop

..label_text_done:
	PLX
	LDA $7E0001,x			;Get enemy's current HP
	JSR write_4_digits
	LDA #$206D			;Write "/"
	STA custom_text_buffer,y
	INY
	INY
	LDA $7E0003,x			;Get enemy's max HP
	JSR write_4_digits
	LDA #$FFFF
	STA custom_text_buffer,y	;Write terminator
	BRL .next_slot_2
	


.display_xp_and_gold:
	LDX #$0000
..loop:
	LDA.l enemy_xp_and_gold_text,x
	BMI ..label_text_done
	STA custom_text_buffer,y
	INX
	INX
	INY
	INY
	BRL ..loop

..label_text_done:
	PLX
	LDA $7E0000,x			;Get enemy's ID
	AND #$00FF
	PHX
	ASL
	ASL
	ASL
	TAX
	LDA.l enemy_xp_table,x
	JSR write_4_digits
	LDA #$206D			;Write "/"
	STA custom_text_buffer,y
	INY
	INY
	PLX
	LDA $7E0000,x			;Get enemy's ID
	AND #$00FF
	PHX
	ASL
	ASL
	ASL
	TAX
	LDA.l enemy_gold_table,x
	JSR write_4_digits
	LDA #$FFFF
	STA custom_text_buffer,y	;Write terminator
	PLX
	BRL .next_slot_2



.display_item_drop:
	LDA #$00B2
	STA $AE
	LDX #$0000
..loop:
	LDA.l enemy_drop_text,x
	
	BMI ..label_text_done
	STA custom_text_buffer,y
	INX
	INX
	INY
	INY
	BRA ..loop

..label_text_done:
	PLX
	LDA $7E0000,x			;Get enemy's ID
	AND #$00FF
	PHX
	ASL
	ASL
	ASL
	TAX
	LDA.l enemy_drop_table,x
	ASL
	TAX
	LDA.l item_name_table,x
	STA $AC
	TYX				;Preserve text buffer index in X
	LDY #$0000
..loop2:
	LDA [$AC],y
	BMI ..item_name_done
	STA custom_text_buffer,x
	INX
	INX
	INY
	INY
	BRA ..loop2

..item_name_done:
	TXY				;Retrieve text buffer index from X
	PLX
	BRL .next_slot_2



.display_turn_and_dps:
	LDX #$0000
	LDA #$5021
	STA custom_text_buffer,y
	INY
	INY
	LDX #$0000
..loop:
	LDA.l turn_text,x
	BMI ..turn_number
	STA custom_text_buffer,y
	INX
	INX
	INY
	INY
	BRA ..loop


..turn_number:
	LDA turn_counter
	STA hex_to_dec_input
	JSR hex_word_to_decimal
	LDA hex_to_dec_result
	AND #$00F0
	BEQ ..single_digit
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC #$2033
	STA custom_text_buffer,y
	INY
	INY
..single_digit:
	LDA hex_to_dec_result
	AND #$000F
	CLC
	ADC #$2033
	STA custom_text_buffer,y
	INY
	INY
..last_turn_text:
	LDA #$5061
	STA custom_text_buffer,y
	INY
	INY
	LDX #$0000
...loop:
	LDA.l damage_last_turn_text,x
	BMI ..last_turn_numbers
	STA custom_text_buffer,y
	INX
	INX
	INY
	INY
	BRA ...loop

..last_turn_numbers:
	LDA damage_tally
	JSR write_4_digits
..avg_dps_text:
	LDA #$50A1
	STA custom_text_buffer,y
	INY
	INY
	LDX #$0000
...loop:
	LDA.l average_damage_text,x
	BMI ..avg_numbers
	STA custom_text_buffer,y
	INX
	INX
	INY
	INY
	BRA ...loop

..avg_numbers:
	;LDA avg_damage_count_done_flag
	;BNE ..done
	STZ average_damage_tally
	PHK
	PLB
	LDA turn_counter
	DEC
	BEQ ..done
	BMI ..done
	LDX #$0000
...loop:
	LDA $7E3000,x
	BMI ...divide
	CLC
	ADC average_damage_tally
	STA average_damage_tally
	INX
	INX
	BRA ...loop

...divide:
	LDA average_damage_tally
	STA CPU.dividen
	SEP #$20
	LDA turn_counter
	DEC
	STA CPU.divisor
	REP #$20
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	LDA CPU.divide_result
	STA hex_to_dec_input
	JSR write_4_digits
	;INC avg_damage_count_done_flag
..done:
	PLX
	BRL .done







write_4_digits:
	PHX
	STA hex_to_dec_input
	JSR hex_word_to_decimal
	LDA hex_to_dec_result
	AND #$F000
	XBA
	LSR
	LSR
	LSR
	LSR
	ASL
	TAX
	LDA.l number_tile_indexes,x
	STA custom_text_buffer,y
	INY
	INY
	LDA hex_to_dec_result
	AND #$0F00
	XBA
	ASL
	TAX
	LDA.l number_tile_indexes,x
	STA custom_text_buffer,y
	INY
	INY
	LDA hex_to_dec_result
	AND #$00F0
	LSR
	LSR
	LSR
	LSR
	ASL
	TAX
	LDA.l number_tile_indexes,x
	STA custom_text_buffer,y
	INY
	INY
	LDA hex_to_dec_result
	AND #$000F
	ASL
	TAX
	LDA.l number_tile_indexes,x
	STA custom_text_buffer,y
	INY
	INY
	PLX
	RTS


clear_slot_info:
	PHX
	LDA enemy_slot_iteration_count
	ASL
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC custom_text_buffer			;Initial vram address
	STA custom_text_buffer,y
	INY
	INY
	LDX #$0021
	LDA #$0000
.loop:
	STA custom_text_buffer,y
	INY
	INY
	DEX
	DEX
	BPL .loop
	PLX
	RTS






upload_custom_text_to_vram:
 	ADC #$0B0D			;Hijacked instruction
  	STA $048C			;Hijacked instruction
	SEP #$20
	LDA $20
	CMP #$05
	BEQ .in_battle
	BRL .return

.in_battle:
	REP #$20
	LDA full_info_block_clear_flag
	BNE .clear
	BRL .no_clear

.clear:
;Clear left side
	LDX #$0021
	LDA #$5021
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -

+
	LDX #$0021
	LDA #$5041
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -

+
	LDX #$0021
	LDA #$5061
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -

+
	LDX #$0021
	LDA #$5081
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -

+
	LDX #$0021
	LDA #$50A1
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -


;Clear right side
	LDX #$0021
	LDA #$5421
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -

+
	LDX #$0021
	LDA #$5441
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -

+
	LDX #$0021
	LDA #$5461
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -

+
	LDX #$0021
	LDA #$5481
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -

+
	LDX #$0021
	LDA #$54A1
	STA PPU.vram_address
	LDA #$0000
-
	STA PPU.vram_write
	DEX
	DEX
	BMI +
	BRA -
+
	STZ full_info_block_clear_flag
	RTL

.no_clear:
	LDX #$0000
.loop3:
	LDA custom_text_buffer,x
	BMI .return
	BIT #$4000
	BEQ .write
	STA PPU.vram_address
	BRA .next

.write:
	STA PPU.vram_write
.next:
	INX
	INX
	BRA .loop3
.return:
	REP #$20
	RTL




hex_word_to_decimal:
	PHP
        SED
        SEP #$30
        STZ hex_to_dec_result
        STZ temp_1FA1
        STZ temp_1FA2
        LDX #$06
.loop1:         
        ASL hex_to_dec_input
        ROL temp_1FA4
	LDA hex_to_dec_result         
        ADC hex_to_dec_result
        STA hex_to_dec_result
        DEX
        BNE .loop1
 
        LDX #$07
.loop2:
        ASL hex_to_dec_input
        ROL temp_1FA4
        LDA hex_to_dec_result
        ADC hex_to_dec_result
        STA hex_to_dec_result
        LDA temp_1FA1
        ADC temp_1FA1
        STA temp_1FA1
        DEX
        BNE .loop2
 
        LDX #$03
.loop3:
        ASL hex_to_dec_input
        ROL temp_1FA4
        LDA hex_to_dec_result
        ADC hex_to_dec_result
        STA hex_to_dec_result
        LDA temp_1FA1
        ADC temp_1FA1
        STA temp_1FA1
        LDA temp_1FA2
        ADC temp_1FA2
        STA temp_1FA2
        DEX
        BNE .loop3
        CLD
	PLP
	RTS 


increment_turn_counter:
	STA $02B6			;Hijacked istruction
	STA $0534			;Hijacked istruction
	LDA $7E0020
	CMP #$05
	BNE .return
	LDA turn_counter
	CMP #$63
	BCS .return
	REP #$20
	LDA turn_counter
	DEC
	BMI +
	ASL
	TAX
	LDA damage_tally
	STA $7E3000,x
	LDA #$FFFF
	INX
	INX
	STA $7E3000,x
+:
	SEP #$20
	INC turn_counter
.return:
	RTL


update_last_turn_damage:
	LDA $0497
	CLC
	ADC damage_tally
	STA damage_tally
	SEP #$20			;Hijacked instruction
	STZ $0544			;Hijacked instruction
	;STZ avg_damage_count_done_flag
	RTL

update_last_turn_damage_2:
	REP #$20			;Hijacked instruction
	LDA $0497
	CLC
	ADC damage_tally
	STA damage_tally
	LDA #$0000			;Hijacked instruction
	RTL


clear_new_battle_ram:
	LDA #$05			;Hijacked instruction
	STA $7E0010,X			;Hijacked instruction
	REP #$20
	STZ info_display_toggle
	STZ previous_info_display
	STZ turn_counter
	STZ damage_tally
	STZ average_damage_tally
	SEP #$20
	RTL