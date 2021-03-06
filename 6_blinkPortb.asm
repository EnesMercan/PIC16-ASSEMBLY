;   program :	PICTEST1.ASM
;    date :	OCT, 2020
;  written by :	ENES MERCAN
;  scenerio :	Turn on pins RB0, RB1, RB2, RB3
;   purpose :	using the 'W'orking register for w/r operations
;----------------------------------------------------------------------
    
; indicate what pic we're using to the complier    
    
    LIST    P = 16F628A
    INCLUDE "P16F628A.INC"

;----------------------------------------------------------------------
;configuration bits
	
    __CONFIG	_XT_OSC	& _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _BODEN_OFF & 
    _LVP_OFF & _DATA_CP_OFF & _CP_OFF
 
    ;_XT_OSC	--> external crystal oscillator
    ;_WDT_OFF	--> watchdog timer off
    ;_PWRTE_ON	--> power up timer is on (will wait 72ms when powered)
    ;_MCLRE_ON	--> external reset is active
    ;_BODEN_OFF --> low voltage protection is off (diff to handle for beginners)
    ;_LVP_OFF	--> low power programming is disabled
    ; _DATA_CP_OFF  --> no eeprom data protection (it's readable)
    ;_CP_OFF	--> no rom code protection (anyone can read)
    
    
;----------------------------------------------------------------------
; starts the program from this address
	
    ORG	H'0000'

;----------------------------------------------------------------------
; This is basically SETUP block of our program
	
    CLRF    PORTB
    BANKSEL TRISB
    CLRF    TRISB
    BANKSEL PORTB
    
	
;----------------------------------------------------------------------
; The program execution block (main program flow block)
	
START
    
    MOVLW   H'0F'
    MOVWF   PORTB
	
;----------------------------------------------------------------------
; Ending the program
	
LOOP
    
    GOTO LOOP
    END
	
;----------------------------------------------------------------------
 