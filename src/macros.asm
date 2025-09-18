include

macro offset(label, offset)
	?tmp:
	pushpc
	org ?tmp+<offset>
	<label>:
	pullpc
endmacro


;Need this because devs are idiots and don't have their text in VRAM in a way that allows for proper ASCII
macro get_char()
        !i #= 0
        ' ' = $2080
        'A' = $2081
        'B' = $2082
        'C' = $2083
        'D' = $2084
        'E' = $2085
        'F' = $2086
        'G' = $2087
        'H' = $2088
        'I' = $2089
        'J' = $208A
        'K' = $208B
        'L' = $208C
        'M' = $208D
        'N' = $208E
        'O' = $208F
        'P' = $2090
        'Q' = $2091
        'R' = $2092
        'S' = $2093
        'T' = $2094
        'U' = $2095
        'V' = $2096
        'W' = $2097
        'X' = $2098
        'Y' = $2099
        'Z' = $209A
        '0' = $2033
        '1' = $2034
        '2' = $2035
        '3' = $2036
        '4' = $2037
        '5' = $2038
        '6' = $2039
        '7' = $203A
        '8' = $203B
        '9' = $203C
        ':' = $2064
        '/' = $206D
endmacro