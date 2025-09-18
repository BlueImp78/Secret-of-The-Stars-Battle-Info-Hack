number_tile_indexes:
	dw $2033		;0	
	dw $2034		;1
	dw $2035		;2
	dw $2036		;3
	dw $2037		;4
	dw $2038		;5
	dw $2039		;6
	dw $203A		;7
	dw $203B		;8
	dw $203C		;9


%get_char()
enemy_hp_text:
	dw "HP:", $FFFF


enemy_xp_and_gold_text:
	dw "XP/GOLD:", $FFFF


enemy_drop_text:
	dw "DROP:", $FFFF


turn_text:
	dw "TURN ", $FFFF


damage_last_turn_text:
	dw "LAST:", $FFFF


average_damage_text:
	dw "AVG:", $FFFF



text_vram_base_addresses:
	dw $5021
	dw $5041
	dw $5061
	dw $5081

text_vram_alt_addresses:
	dw $5421
	dw $5441
	dw $5461
	dw $5481


enemy_xp_table:
%offset(enemy_gold_table, 2)
%offset(enemy_drop_table, 4)
%offset(enemy_drop_rate_table, 6)
	dw $0001, $0001, $0033, $0012			;00 Slime
	dw $0002, $0002, $0033, $0010			;01 Red Slime
	dw $0003, $0004, $0018, $0008			;02 Bat
	dw $0004, $0005, $0029, $000A			;03 Hedgehog
	dw $0006, $0007, $0000, $0000			;04 Pig Man
	dw $0004, $0005, $0033, $0010			;05 Quill
	dw $0010, $0006, $0033, $001F			;06 Cat Boo
	dw $0074, $0002, $0042, $0000			;07 DR. Gari
	dw $0007, $0003, $0001, $0008			;08 Stun Rat
	dw $000C, $000A, $0000, $0004			;09 Goblin
	dw $0008, $0006, $0034, $001F			;0A Bad Slime
	dw $000E, $0008, $0001, $0008			;0B BadMan
	dw $000F, $000B, $002E, $0008			;0C Ghost
	dw $0011, $000C, $002A, $000A			;0D Bone
	dw $0012, $000E, $0036, $0010			;0E Zombi
	dw $0013, $000F, $0002, $0008			;0F Holo Bird


	dw $0014, $0014, $003C, $0020			;10 Bad Bunny
	dw $0015, $001A, $0009, $0028			;11 Echo Cat
	dw $0018, $0017, $003D, $000A			;12 PumpKing
	dw $021E, $0000, $0042, $0000			;13 BadBad
	dw $001E, $0018, $0034, $0008			;14 Killer Bug
	dw $0023, $0019, $0003, $0008			;15 Wolf
	dw $2E61, $0000, $0042, $0000			;16 Bio Gara
	dw $0025, $001A, $001D, $0010			;17 Bandit
	dw $0026, $001B, $0039, $0008			;18 Rock Bird
	dw $0027, $001D, $0034, $0010			;19 Spider
	dw $002B, $001F, $001B, $0008			;1A Pig King
	dw $02AF, $0000, $0042, $0000			;1B Leach
	dw $0078, $0020, $0033, $0008			;1C Cat Boo
	dw $043F, $0000, $0042, $0000			;1D Bingo
	dw $002F, $0021, $0034, $0010			;1E Man-Trap
	dw $002E, $0022, $0035, $0008			;1F Fire Fly


	dw $0030, $0025, $0034, $0010			;20 Talanchula
	dw $0032, $003C, $0033, $0010			;21 Goldog
	dw $0037, $002A, $001D, $0008			;22 Grizley
	dw $0024, $0027, $0036, $0010			;23 Zombie
	dw $0040, $0031, $003F, $0010			;24 King Cat
	dw $0000, $0000, $0042, $0000			;25 Golan
	dw $04AB, $0000, $0042, $0000			;26 Golan JR.
	dw $002F, $0035, $000A, $0008			;27 Big Worm
	dw $0032, $0038, $003E, $0010			;28 Val Eagle
	dw $0035, $003A, $0015, $0010			;29 Ice Bear
	dw $0044, $003C, $0010, $0004			;2A Dragon
	dw $0041, $003D, $0036, $0010			;2B Spector
	dw $0046, $003E, $001E, $0010			;2C Armor
	dw $0923, $0000, $0042, $0000			;2D Garados
	dw $05DC, $0000, $0042, $0000			;2E Sidon
	dw $0041, $003F, $002F, $0008			;2F Trap


	dw $0046, $0066, $0035, $0010			;30 GasDragon
	dw $0044, $0042, $0036, $0010			;31 EyeBall
	dw $0048, $0045, $003E, $0010			;32 MadBird
	dw $0049, $0047, $0042, $0000			;33 Bohr
	dw $0054, $004B, $0011, $0008			;34 Vegilisk
	dw $0B70, $0000, $0042, $0000			;35 Arthur
	dw $0A49, $0000, $0042, $0000			;36 Andy
	dw $004B, $004E, $0035, $0010			;37 Scorpion
	dw $004C, $0050, $001F, $0010			;38 Rock
	dw $004E, $0052, $0016, $0001			;39 Antlion
	dw $0050, $0054, $000F, $0004			;3A Beetle
	dw $0054, $0057, $0020, $0008			;3B Falcon
	dw $1213, $0000, $0042, $0000			;3C Dram
	dw $0E46, $0000, $0042, $0000			;3D Fire
	dw $0F57, $0000, $0042, $0000			;3E Mermaid
	dw $080A, $0000, $0042, $0000			;3F Cold Wind


	dw $080A, $0000, $0042, $0000			;40 Hot Wind
	dw $1070, $0000, $0042, $0000			;41 Clay
	dw $0056, $0050, $0013, $0001			;42 Bolt Fish
	dw $0058, $0052, $0012, $0001			;43 Blade Fish
	dw $005A, $0053, $0042, $0000			;44 Shark
	dw $005D, $0056, $0042, $0000			;45 Seahorse
	dw $005F, $0058, $003E, $0010			;46 Seadragon
	dw $0065, $005A, $0039, $0002			;47 Seasnake
	dw $006A, $0060, $0037, $0004			;48 Tentacles
	dw $1457, $0000, $0042, $0000			;49 Jubei
	dw $16DF, $0000, $0042, $0000			;4A Undead
	dw $19BC, $0000, $0042, $0000			;4B Clarken
	dw $005A, $0064, $002C, $0010			;4C Spy Eye
	dw $005B, $006F, $0042, $0000			;4D Crawler
	dw $005D, $0070, $0038, $0012			;4E Summoner
	dw $005F, $0072, $001F, $000A			;4F Warrior


	dw $006B, $0062, $002B, $0008			;50 Moth
	dw $0073, $016A, $0021, $0008			;51 Gold Mo
	dw $006E, $00DD, $0036, $0010			;52 Vampire
	dw $0062, $0063, $0036, $0010			;53 Gust
	dw $0001, $0001, $0042, $0000			;54 Shera (Unused)
	dw $1CF2, $0000, $0042, $0000			;55 Booth
	dw $0072, $00DF, $0017, $0002			;56 Gas Slag
	dw $0070, $00E0, $000B, $0001			;57 Sourseris
	dw $0074, $00E1, $000C, $0001			;58 Cleric
	dw $0078, $0116, $0023, $0008			;59 Ghost
	dw $0057, $00D2, $0030, $0008			;5A Roper
	dw $0061, $00DC, $0035, $0010			;5B Ochu
	dw $0091, $00DD, $0043, $0008			;5C Golbird
	dw $00C9, $0141, $0014, $0010			;5D Iron Ox
	dw $1E87, $0000, $0042, $0000			;5E Gara
	dw $0070, $00E3, $0042, $0000			;5F Vambat


	dw $0083, $00E6, $0042, $0000			;60 Pattloid
	dw $0087, $0101, $0042, $0000			;61 Legs
	dw $008E, $0104, $0042, $0000			;62 Robot A
	dw $0093, $010B, $0031, $0004			;63 Robot B
	dw $0098, $0120, $0034, $0010			;64 Morpho
	dw $00A3, $0126, $0024, $0008			;65 New Moon
	dw $0136, $0226, $0006, $0010			;66 AL Beta
	dw $00AD, $00D7, $0007, $0001			;67 Dragoon
	dw $00B4, $00D8, $000D, $0002			;68 Galuda
	dw $00D2, $0191, $000E, $0001			;69 Trool
	dw $00E2, $019D, $0028, $0001			;6A Oga
	dw $00D4, $01A7, $003F, $0008			;6B Servant
	dw $00D9, $01B4, $0006, $0003			;6C Guardian
	dw $2030, $0000, $0042, $0000			;6D Godem
	dw $00DA, $01B5, $0004, $0001			;6E Iron Man
	dw $0195, $00D2, $0005, $0002			;6F King Bull


	dw $00DC, $01BA, $002D, $0004			;70 Zeratin
	dw $00D5, $01A8, $0027, $0002			;71 Ice Dragon
	dw $00EB, $0198, $0006, $0002			;72 Wyte
	dw $00ED, $019A, $0040, $0002			;73 Lace
	dw $24A7, $0000, $0042, $0000			;74 Bio Dram
	dw $0136, $01A4, $003A, $0001			;75 Pilder
	dw $019A, $01FD, $0019, $0001			;76 Bull Head
	dw $292F, $0000, $0042, $0000			;77 Bio Booth
	dw $00F0, $01F4, $0026, $0004			;78 RedDragon
	dw $00F2, $01FF, $0038, $0004			;79 Lord
	dw $34B2, $0000, $0042, $0000			;7A Bio Godem
	dw $00FB, $0201, $0025, $0004			;7B Rich
	dw $0259, $020C, $0008, $0001			;7C Arch Bull
	dw $0000, $0000, $0042, $0000			;7D Homncruse
	dw $0000, $0000, $0042, $0000			;7E Homncruse
	dw $0000, $0000, $0042, $0000			;7F Homncruse


item_name_table:
	dw .KNIFE
	dw .DAGGER
	dw .SHRTSWRD
	dw .MIDSWRD
	dw .FIRESWRD
	dw .DRAGSWRD
	dw .ROYALSWRD
	dw .AGEDSWRD
	dw .SPACEBLADE
	dw .STEELCANE
	dw .HOLYCANE
	dw .FIRECANE
	dw .CALMCANE
	dw .BOLTCANE
	dw .CURECANE
	dw .WARHAMR
	dw .HANDAXE
	dw .SHORTBOW
	dw .ELFINBOW
	dw .DISCARMR
	dw .NINJASWRD
	dw .MITTENS
	dw .WILDCLAW
	dw .BESTCLAW
	dw .CLOTHROBE
	dw .ICESWRD
	dw .LETHSUIT
	dw .HARDSUIT
	dw .CHAINMAIL
	dw .FURCOAT
	dw .ARMOR
	dw .QUICKROBE
	dw .LIFEVEST
	dw .IRONSUIT
	dw .NINJASUIT
	dw .MAGROBE
	dw .MUSAYASUIT
	dw .WIZROBE
	dw .FIREARMR
	dw .ICEARMR
	dw .SPACESUIT
	dw .NORMALHAT
	dw .DERBY
	dw .CROWN
	dw .REDHOOD
	dw .MUSAYAHAT
	dw .LETHSHOES
	dw .HEELS
	dw .ROSESHOES
	dw .WINDSHOES
	dw .MOUSTACHE
	dw .PLUMPLUM
	dw .ANTIDOTE
	dw .ASPIRIN
	dw .ANTISTOP
	dw .RESTORE
	dw .BRKNMOON
	dw .MAGBRANCH
	dw .BOLTSWRD
	dw .TACOSMIN
	dw .RATTAIL
	dw .MAGICLEAF
	dw .TELEPO
	dw .MOONDROP
	dw .MIRROR
	dw .BARRIER
	dw .NONE
	dw .EAGLEARMR



.KNIFE:
	dw "KNIFE", $FFFF				;00

.DAGGER:
	dw "DAGGER", $FFFF				;01

.SHRTSWRD:
	dw "SHRTSWRD", $FFFF				;02

.MIDSWRD:
	dw "MIDSWRD", $FFFF				;03

.FIRESWRD:
	dw "FIRESWRD", $FFFF				;04

.DRAGSWRD:
	dw "DRAGSWRD", $FFFF				;05

.ROYALSWRD:
	dw "ROYALSWRD", $FFFF				;06

.AGEDSWRD:
	dw "AGEDSWRD", $FFFF				;07

.SPACEBLADE:	
	dw "SPACEBLADE", $FFFF				;08

.STEELCANE:
	dw "STEELCANE", $FFFF				;09

.HOLYCANE:
	dw "HOLYCANE", $FFFF				;0A

.FIRECANE:
	dw "FIRECANE", $FFFF				;0B

.CALMCANE:
	dw "CALMCANE", $FFFF				;0C

.BOLTCANE:
	dw "BOLTCANE", $FFFF				;0D

.CURECANE:
	dw "CURECANE", $FFFF				;0E

.WARHAMR:
	dw "WARHAMR", $FFFF				;0F

.HANDAXE:
	dw "HANDAXE", $FFFF				;10

.SHORTBOW:
	dw "SHORTBOW", $FFFF				;11

.ELFINBOW:
	dw "ELFINBOW", $FFFF				;12

.DISCARMR:
	dw "DISCARMR", $FFFF				;13

.NINJASWRD:
	dw "NINJASWRD", $FFFF				;14

.MITTENS:
	dw "MITTENS", $FFFF				;15

.WILDCLAW:
	dw "WILDCLAW", $FFFF				;16

.BESTCLAW:
	dw "BESTCLAW", $FFFF				;17

.CLOTHROBE:
	dw "CLOTHROBE", $FFFF				;18

.ICESWRD:
	dw "ICESWRD", $FFFF				;19

.LETHSUIT:
	dw "LETHSUIT", $FFFF				;1A

.HARDSUIT:
	dw "HARDSUIT", $FFFF				;1B

.CHAINMAIL:
	dw "CHAINMAIL", $FFFF				;1C

.FURCOAT:
	dw "FURCOAT", $FFFF				;1D

.ARMOR:
	dw "ARMOR", $FFFF				;1E

.QUICKROBE:
	dw "QUICKROBE", $FFFF				;1F

.LIFEVEST:
	dw "LIFEVEST", $FFFF				;20

.IRONSUIT:
	dw "IRONSUIT", $FFFF				;21

.NINJASUIT:
	dw "NINJASUIT", $FFFF				;22

.MAGROBE:
	dw "MAGROBE", $FFFF				;23

.MUSAYASUIT:
	dw "MUSAYASUIT", $FFFF				;24

.WIZROBE:
	dw "WIZROBE", $FFFF				;25

.FIREARMR:
	dw "FIREARMR", $FFFF				;26

.ICEARMR:
	dw "ICEARMR", $FFFF				;27

.SPACESUIT:
	dw "SPACESUIT", $FFFF				;28

.NORMALHAT:
	dw "NORMALHAT", $FFFF				;29

.DERBY:
	dw "DERBY", $FFFF				;2A

.CROWN:
	dw "CROWN", $FFFF				;2B

.REDHOOD:
	dw "REDHOOD", $FFFF				;2C

.MUSAYAHAT:
	dw "MUSAYAHAT", $FFFF				;2D

.LETHSHOES:
	dw "LETHSHOES", $FFFF				;2E

.HEELS:
	dw "HEELS", $FFFF				;2F

.ROSESHOES:
	dw "ROSESHOES", $FFFF				;30

.WINDSHOES:
	dw "WINDSHOES", $FFFF				;31

.MOUSTACHE:
	dw "MOUSTACHE", $FFFF				;32

.PLUMPLUM:
	dw "PLUMPLUM", $FFFF				;33

.ANTIDOTE:
	dw "ANTIDOTE", $FFFF				;34

.ASPIRIN:
	dw "ASPIRIN", $FFFF				;35

.ANTISTOP:
	dw "ANTISTOP", $FFFF				;36

.RESTORE:
	dw "RESTORE", $FFFF				;37

.BRKNMOON:
	dw "BRKNMOON", $FFFF				;38

.MAGBRANCH:
	dw "MAGBRANCH", $FFFF				;39

.BOLTSWRD:
	dw "BOLTSWRD", $FFFF				;3A

.TACOSMIN:
	dw "TACOSMIN", $FFFF				;3B

.RATTAIL:
	dw "RATTAIL", $FFFF				;3C

.MAGICLEAF:
	dw "MAGICLEAF", $FFFF				;3D

.TELEPO:
	dw "TELEPO", $FFFF				;3E

.MOONDROP:
	dw "MOONDROP", $FFFF				;3F

.MIRROR:
	dw "MIRROR", $FFFF				;40

.BARRIER:
	dw "BARRIER", $FFFF				;41

.NONE:
	dw "NONE", $FFFF 				;42

.EAGLEARMR:
	dw "EAGLEARMR", $FFFF				;43



turn_number_text: