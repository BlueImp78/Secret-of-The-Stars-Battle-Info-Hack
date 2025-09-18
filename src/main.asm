lorom

optimize dp always
optimize address mirrors


	incsrc "rom.asm"
	incsrc "ram.asm"
	incsrc "macros.asm"
	incsrc "mmio.asm"
	incsrc "hijacks.asm"


org freerom
	incsrc "code.asm"
	incsrc "data.asm"
	

;warnpc freerom|$FFFF