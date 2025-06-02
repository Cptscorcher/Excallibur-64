; Program to read a byte from ROM location and fire SST0
; E0 - connected to A14 and 15 via ORG
; E1 - Connected to MREQ
; E2 - Connected Ground ( no need for refresh) 
; CE of ROM connected to pin 8 of IC29
; All SST LEDS light up and Y4 pulses

    ORG 0000h          ; Start of ROM 
	
	LD A, 0x01       ; D7=0, D0=1
	LD BC, 0x2070    ; SST0 A12 = 0 A11 = 0 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70
	OUT (C), A       ; Will select O5 of 74HC138 if E2 and E3 allow

start:
    LD HL, rom_data0    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	
	LD HL, rom_data1    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	
	LD HL, rom_data2    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	
	LD HL, rom_data3    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	
	LD HL, rom_data4    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	
	LD HL, rom_data5    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	
	LD HL, rom_data6    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	
	LD HL, rom_data7    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	
	LD HL, rom_data8    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A

	LD HL, rom_data9    ; Load address of ROM data
    LD A, (HL)         ; Load value at that ROM location into A
	;OUT  (0x70), A     ; Send current value to port
	LD BC, 0x2070    ; SST0 A12 = 0 A11 = 0 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70  
	LD A, (BC)         ; Load value at that ROM location into A
	
	LD HL, 0x2870    ; SST1  A12 = 0 A11 = 1 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70
	LD A, (HL)         ; Load value at that ROM location into A
	
	LD BC, 0x3070    ; SST2  A12 = 1 A11 = 0 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70
	LD A, (BC)         ; Load value at that ROM location into A	
	
	LD HL, 0x3870    ; SST3  A12 = 1 A11 = 1 A13 = 1, A14 = 0, A15 = 0, A0–A7 = 0x70
	LD A, (HL)         ; Load value at that ROM location into A
   ; LD (ram_result), A ; Store A into a RAM location

    JP start               ; Infinite loop to halt (or could use HALT)

; -------------------------
; ROM data (read-only)
;rom_data:
   ; DB 42              ; ROM value to be read (e.g., 42 = 0x2A)
rom_data0:
	DB 0x00
rom_data1:
	DB 0x01
rom_data2:
	DB 0x02
rom_data3:
	DB 0x04
rom_data4:
	DB 0x08
rom_data5:
	DB 0x10
rom_data6:
	DB 0x20
rom_data7:
	DB 0x40
rom_data8:
	DB 0x80
rom_data9:
	DB 0xff
	
	

; -------------------------
; RAM section (assumed at $8000 and up)
  ;  ORG 8000h          ; Start of RAM
;ram_result:
  ;  DB 0               ; RAM location to store the read value
