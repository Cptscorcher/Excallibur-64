; Excalibur 64 ][ Test
;	Make SST LEDs flash
; All four LEDs work
;
;	Video Mode select bits:
;	D0 - *ROM/SCREEN
;	D1 - RAM ON
;	D2 - *LOW/HIGH RES
;	D3 - 2nd Colour pallete
;
;	Status Read Bits
;	D0 - *ROM/SCREEN
;	D1 - RAM ON
;	D2 - *LOW/HIGH RES
;	D3 - Display Enabled ?
;	D4 - VSYNC ?
;	D5 - ?

	ORG 0x0000          ; Starting point of the program
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop


; A11 = 800h
; A12 = 1000h

;	Variable Area
; IO Ports
CS0	EQU	00h		; keyboard
CS1 EQU 10h		; Serial
CS2 EQU	20h		; Timer
CS3	EQU	30h		; CRTC
CS4	EQU 40h		; NC
CS5	EQU	50h		; Status read
CS6 EQU 60h		; Parallel
CS7 EQU 70h		; Video mode select.

	;call INIT_8253_UART_CLOCK
	;call UART_INIT
	LD A, 0x00
MainLoop:
	
	LD A, 0x01       ; D7=0, D0=1
	LD BC, 0x2070    ; SST0 A12 = 0 A11 = 0 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70
	OUT (C), A       ; Will select O5 of 74HC138 if E2 and E3 allow
	nop
	nop
	LD BC, 0x2870    ; SST1  A12 = 0 A11 = 1 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70
	OUT (C), A       ; Will select O5 of 74HC138 if E2 and E3 allow
	nop
	nop
	LD BC, 0x3070    ; SST2  A12 = 1 A11 = 0 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70
	OUT (C), A       ; Will select O5 of 74HC138 if E2 and E3 allow
	nop
	nop
	LD BC, 0x3870    ; SST3  A12 = 1 A11 = 1 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70
	OUT (C), A       ; Will select O5 of 74HC138 if E2 and E3 allow
	nop
	nop
		
	JP   MainLoop   ; Loop until A wraps to 0
	HALT

