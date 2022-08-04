
_setup:

;ESP_VERI_GONDERIMI_DENEME.c,39 :: 		void setup()
;ESP_VERI_GONDERIMI_DENEME.c,41 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;ESP_VERI_GONDERIMI_DENEME.c,42 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;ESP_VERI_GONDERIMI_DENEME.c,43 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;ESP_VERI_GONDERIMI_DENEME.c,44 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;ESP_VERI_GONDERIMI_DENEME.c,45 :: 		ANSELA = 0;
	CLRF        ANSELA+0 
;ESP_VERI_GONDERIMI_DENEME.c,46 :: 		TRISA = 0X01;
	MOVLW       1
	MOVWF       TRISA+0 
;ESP_VERI_GONDERIMI_DENEME.c,47 :: 		TRISE = 0X00;
	CLRF        TRISE+0 
;ESP_VERI_GONDERIMI_DENEME.c,48 :: 		TRISB = 0X01;
	MOVLW       1
	MOVWF       TRISB+0 
;ESP_VERI_GONDERIMI_DENEME.c,49 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,50 :: 		Keypad_Init();                     // Initialize LCD
	CALL        _Keypad_Init+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,51 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,52 :: 		ADC_Init();                        // Initialize LCD
	CALL        _ADC_Init+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,54 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,55 :: 		INTEDG0_bit  =0;
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;ESP_VERI_GONDERIMI_DENEME.c,56 :: 		INT0IF_bit   =0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;ESP_VERI_GONDERIMI_DENEME.c,57 :: 		INT0IE_bit   =1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;ESP_VERI_GONDERIMI_DENEME.c,58 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;ESP_VERI_GONDERIMI_DENEME.c,59 :: 		Lcd_Out(2,4,"GURKAN TOPKARA");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,60 :: 		Lcd_Out(3,6 ,"SMART HOME ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,61 :: 		Lcd_out(4,1,"gurkantopkara7@gmail");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,62 :: 		UART1_Write_Text("AT\r\n");
	MOVLW       ?lstr4_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,63 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_setup0:
	DECFSZ      R13, 1, 1
	BRA         L_setup0
	DECFSZ      R12, 1, 1
	BRA         L_setup0
	DECFSZ      R11, 1, 1
	BRA         L_setup0
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,64 :: 		UART1_Write_Text("ATE0\r\n");
	MOVLW       ?lstr5_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,65 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_setup1:
	DECFSZ      R13, 1, 1
	BRA         L_setup1
	DECFSZ      R12, 1, 1
	BRA         L_setup1
	DECFSZ      R11, 1, 1
	BRA         L_setup1
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,66 :: 		UART1_Write_Text("AT+CWMODE=3\r\n");
	MOVLW       ?lstr6_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,67 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_setup2:
	DECFSZ      R13, 1, 1
	BRA         L_setup2
	DECFSZ      R12, 1, 1
	BRA         L_setup2
	DECFSZ      R11, 1, 1
	BRA         L_setup2
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,68 :: 		UART1_Write_Text("AT+CIPMODE=0\r\n");
	MOVLW       ?lstr7_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,69 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_setup3:
	DECFSZ      R13, 1, 1
	BRA         L_setup3
	DECFSZ      R12, 1, 1
	BRA         L_setup3
	DECFSZ      R11, 1, 1
	BRA         L_setup3
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,70 :: 		UART1_Write_Text("AT+CIPMUX=0\r\n");
	MOVLW       ?lstr8_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,71 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_setup4:
	DECFSZ      R13, 1, 1
	BRA         L_setup4
	DECFSZ      R12, 1, 1
	BRA         L_setup4
	DECFSZ      R11, 1, 1
	BRA         L_setup4
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,72 :: 		UART1_Write_Text("AT+CWDHCP=1,1\r\n");
	MOVLW       ?lstr9_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,73 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_setup5:
	DECFSZ      R13, 1, 1
	BRA         L_setup5
	DECFSZ      R12, 1, 1
	BRA         L_setup5
	DECFSZ      R11, 1, 1
	BRA         L_setup5
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,74 :: 		UART1_Write_Text("AT+CWJAP=\"elfo11\",\"elfotopkara11\"\r\n");
	MOVLW       ?lstr10_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,75 :: 		Delay_ms(9000);
	MOVLW       46
	MOVWF       R11, 0
	MOVLW       169
	MOVWF       R12, 0
	MOVLW       47
	MOVWF       R13, 0
L_setup6:
	DECFSZ      R13, 1, 1
	BRA         L_setup6
	DECFSZ      R12, 1, 1
	BRA         L_setup6
	DECFSZ      R11, 1, 1
	BRA         L_setup6
;ESP_VERI_GONDERIMI_DENEME.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,78 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,81 :: 		}
L_end_setup:
	RETURN      0
; end of _setup

_show_statu:

;ESP_VERI_GONDERIMI_DENEME.c,85 :: 		void show_statu()
;ESP_VERI_GONDERIMI_DENEME.c,88 :: 		if(PORTA.RA1==1)
	BTFSS       PORTA+0, 1 
	GOTO        L_show_statu7
;ESP_VERI_GONDERIMI_DENEME.c,90 :: 		strcpy(ROOM_1_STATU,"ON");
	MOVLW       _ROOM_1_STATU+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_ROOM_1_STATU+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr11_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr11_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,91 :: 		}
	GOTO        L_show_statu8
L_show_statu7:
;ESP_VERI_GONDERIMI_DENEME.c,95 :: 		strcpy(ROOM_1_STATU,"OFF");
	MOVLW       _ROOM_1_STATU+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_ROOM_1_STATU+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr12_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr12_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,96 :: 		}
L_show_statu8:
;ESP_VERI_GONDERIMI_DENEME.c,98 :: 		if(PORTA.RA2==1)
	BTFSS       PORTA+0, 2 
	GOTO        L_show_statu9
;ESP_VERI_GONDERIMI_DENEME.c,100 :: 		strcpy(ROOM_2_STATU,"ON");
	MOVLW       _ROOM_2_STATU+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_ROOM_2_STATU+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr13_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr13_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,101 :: 		}
	GOTO        L_show_statu10
L_show_statu9:
;ESP_VERI_GONDERIMI_DENEME.c,104 :: 		strcpy(ROOM_2_STATU,"OFF");
	MOVLW       _ROOM_2_STATU+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_ROOM_2_STATU+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr14_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr14_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,105 :: 		}
L_show_statu10:
;ESP_VERI_GONDERIMI_DENEME.c,107 :: 		if(PORTA.RA3==1)
	BTFSS       PORTA+0, 3 
	GOTO        L_show_statu11
;ESP_VERI_GONDERIMI_DENEME.c,109 :: 		strcpy(ROOM_3_STATU,"ON");
	MOVLW       _ROOM_3_STATU+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_ROOM_3_STATU+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr15_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr15_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,110 :: 		}
	GOTO        L_show_statu12
L_show_statu11:
;ESP_VERI_GONDERIMI_DENEME.c,113 :: 		strcpy(ROOM_3_STATU,"OFF");
	MOVLW       _ROOM_3_STATU+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_ROOM_3_STATU+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr16_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr16_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,114 :: 		}
L_show_statu12:
;ESP_VERI_GONDERIMI_DENEME.c,116 :: 		if(PORTA.RA4)
	BTFSS       PORTA+0, 4 
	GOTO        L_show_statu13
;ESP_VERI_GONDERIMI_DENEME.c,118 :: 		strcpy(ROOM_4_STATU,"ON");
	MOVLW       _ROOM_4_STATU+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_ROOM_4_STATU+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr17_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr17_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,119 :: 		}
	GOTO        L_show_statu14
L_show_statu13:
;ESP_VERI_GONDERIMI_DENEME.c,120 :: 		else if(!PORTA.RA4)
	BTFSC       PORTA+0, 4 
	GOTO        L_show_statu15
;ESP_VERI_GONDERIMI_DENEME.c,122 :: 		strcpy(ROOM_4_STATU,"OFF");
	MOVLW       _ROOM_4_STATU+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_ROOM_4_STATU+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr18_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr18_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,124 :: 		}
L_show_statu15:
L_show_statu14:
;ESP_VERI_GONDERIMI_DENEME.c,128 :: 		temperature_value=ADC_Read(AN0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temperature_value+0 
	MOVF        R1, 0 
	MOVWF       _temperature_value+1 
;ESP_VERI_GONDERIMI_DENEME.c,129 :: 		mv=temperature_value*(4998.8699/1024);
	CALL        _word2double+0, 0
	MOVLW       246
	MOVWF       R4 
	MOVLW       54
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _mv+0 
	MOVF        R1, 0 
	MOVWF       _mv+1 
	MOVF        R2, 0 
	MOVWF       _mv+2 
	MOVF        R3, 0 
	MOVWF       _mv+3 
;ESP_VERI_GONDERIMI_DENEME.c,130 :: 		mv=mv/10.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _mv+0 
	MOVF        R1, 0 
	MOVWF       _mv+1 
	MOVF        R2, 0 
	MOVWF       _mv+2 
	MOVF        R3, 0 
	MOVWF       _mv+3 
;ESP_VERI_GONDERIMI_DENEME.c,131 :: 		FloatToStr(mv,tp);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _tp+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_tp+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,132 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_show_statu16:
	DECFSZ      R13, 1, 1
	BRA         L_show_statu16
	DECFSZ      R12, 1, 1
	BRA         L_show_statu16
	DECFSZ      R11, 1, 1
	BRA         L_show_statu16
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,134 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,135 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,136 :: 		Lcd_out(1,1,"TEMP|RO1|RO2|RO3|RO4");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,137 :: 		Lcd_Chr(3,2,tp[0]);
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _tp+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,138 :: 		Lcd_Chr(3,3,tp[1]);
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _tp+1, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,139 :: 		Lcd_Chr(3,5,'|');
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,142 :: 		Lcd_Chr(2,5,'|');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,143 :: 		Lcd_Chr(2,9,'|');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,144 :: 		Lcd_Chr(2,13,'|');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,145 :: 		Lcd_Chr(2,17,'|');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,147 :: 		Lcd_Chr(4,5,'|');
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,148 :: 		Lcd_Chr(4,9,'|');
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,149 :: 		Lcd_Chr(4,13,'|');
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,150 :: 		Lcd_Chr(4,17,'|');
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,152 :: 		Lcd_out(3,6,ROOM_1_STATU);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _ROOM_1_STATU+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_ROOM_1_STATU+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,153 :: 		Lcd_Chr(3,9,'|');
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,154 :: 		Lcd_out(3,10,ROOM_2_STATU);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _ROOM_2_STATU+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_ROOM_2_STATU+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,155 :: 		Lcd_Chr(3,13,'|');
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,156 :: 		Lcd_Out(3,14,ROOM_3_STATU);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _ROOM_3_STATU+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_ROOM_3_STATU+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,157 :: 		Lcd_Chr(3,17,'|');
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       124
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,158 :: 		Lcd_Out(3,18,ROOM_4_STATU);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _ROOM_4_STATU+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_ROOM_4_STATU+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,159 :: 		Delay_ms(3000);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_show_statu17:
	DECFSZ      R13, 1, 1
	BRA         L_show_statu17
	DECFSZ      R12, 1, 1
	BRA         L_show_statu17
	DECFSZ      R11, 1, 1
	BRA         L_show_statu17
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,163 :: 		}
L_end_show_statu:
	RETURN      0
; end of _show_statu

_interrupt:

;ESP_VERI_GONDERIMI_DENEME.c,175 :: 		void interrupt()
;ESP_VERI_GONDERIMI_DENEME.c,177 :: 		if(INT0IF_bit==1)
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt18
;ESP_VERI_GONDERIMI_DENEME.c,180 :: 		counter++;
	INFSNZ      _counter+0, 1 
	INCF        _counter+1, 1 
;ESP_VERI_GONDERIMI_DENEME.c,182 :: 		}
L_interrupt18:
;ESP_VERI_GONDERIMI_DENEME.c,184 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;ESP_VERI_GONDERIMI_DENEME.c,185 :: 		}
L_end_interrupt:
L__interrupt82:
	RETFIE      1
; end of _interrupt

_OpenDoor:

;ESP_VERI_GONDERIMI_DENEME.c,187 :: 		void OpenDoor()
;ESP_VERI_GONDERIMI_DENEME.c,190 :: 		DOOR_INPUT1=1;
	BSF         PORTB+0, 5 
;ESP_VERI_GONDERIMI_DENEME.c,191 :: 		DOOR_INPUT2=0;
	BCF         PORTB+0, 6 
;ESP_VERI_GONDERIMI_DENEME.c,192 :: 		for(buz=0;buz<3;buz++)
	CLRF        _buz+0 
	CLRF        _buz+1 
L_OpenDoor19:
	MOVLW       0
	SUBWF       _buz+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__OpenDoor84
	MOVLW       3
	SUBWF       _buz+0, 0 
L__OpenDoor84:
	BTFSC       STATUS+0, 0 
	GOTO        L_OpenDoor20
;ESP_VERI_GONDERIMI_DENEME.c,194 :: 		BUZZER = 1;
	BSF         PORTE+0, 0 
;ESP_VERI_GONDERIMI_DENEME.c,195 :: 		Delay_ms(150);
	MOVLW       195
	MOVWF       R12, 0
	MOVLW       205
	MOVWF       R13, 0
L_OpenDoor22:
	DECFSZ      R13, 1, 1
	BRA         L_OpenDoor22
	DECFSZ      R12, 1, 1
	BRA         L_OpenDoor22
;ESP_VERI_GONDERIMI_DENEME.c,196 :: 		BUZZER = 0;
	BCF         PORTE+0, 0 
;ESP_VERI_GONDERIMI_DENEME.c,197 :: 		Delay_ms(150);
	MOVLW       195
	MOVWF       R12, 0
	MOVLW       205
	MOVWF       R13, 0
L_OpenDoor23:
	DECFSZ      R13, 1, 1
	BRA         L_OpenDoor23
	DECFSZ      R12, 1, 1
	BRA         L_OpenDoor23
;ESP_VERI_GONDERIMI_DENEME.c,192 :: 		for(buz=0;buz<3;buz++)
	INFSNZ      _buz+0, 1 
	INCF        _buz+1, 1 
;ESP_VERI_GONDERIMI_DENEME.c,198 :: 		}
	GOTO        L_OpenDoor19
L_OpenDoor20:
;ESP_VERI_GONDERIMI_DENEME.c,199 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_OpenDoor24:
	DECFSZ      R13, 1, 1
	BRA         L_OpenDoor24
	DECFSZ      R12, 1, 1
	BRA         L_OpenDoor24
	DECFSZ      R11, 1, 1
	BRA         L_OpenDoor24
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,200 :: 		DOOR_INPUT1=0;
	BCF         PORTB+0, 5 
;ESP_VERI_GONDERIMI_DENEME.c,201 :: 		DOOR_INPUT2=0;
	BCF         PORTB+0, 6 
;ESP_VERI_GONDERIMI_DENEME.c,202 :: 		}
L_end_OpenDoor:
	RETURN      0
; end of _OpenDoor

_CloseDoor:

;ESP_VERI_GONDERIMI_DENEME.c,204 :: 		void CloseDoor(){
;ESP_VERI_GONDERIMI_DENEME.c,206 :: 		BUZZER=1;
	BSF         PORTE+0, 0 
;ESP_VERI_GONDERIMI_DENEME.c,207 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_CloseDoor25:
	DECFSZ      R13, 1, 1
	BRA         L_CloseDoor25
	DECFSZ      R12, 1, 1
	BRA         L_CloseDoor25
	DECFSZ      R11, 1, 1
	BRA         L_CloseDoor25
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,208 :: 		BUZZER=0;
	BCF         PORTE+0, 0 
;ESP_VERI_GONDERIMI_DENEME.c,209 :: 		DOOR_INPUT1=0;
	BCF         PORTB+0, 5 
;ESP_VERI_GONDERIMI_DENEME.c,210 :: 		DOOR_INPUT2=1;
	BSF         PORTB+0, 6 
;ESP_VERI_GONDERIMI_DENEME.c,211 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_CloseDoor26:
	DECFSZ      R13, 1, 1
	BRA         L_CloseDoor26
	DECFSZ      R12, 1, 1
	BRA         L_CloseDoor26
	DECFSZ      R11, 1, 1
	BRA         L_CloseDoor26
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,212 :: 		DOOR_INPUT1=0;
	BCF         PORTB+0, 5 
;ESP_VERI_GONDERIMI_DENEME.c,213 :: 		DOOR_INPUT2=0;
	BCF         PORTB+0, 6 
;ESP_VERI_GONDERIMI_DENEME.c,215 :: 		}
L_end_CloseDoor:
	RETURN      0
; end of _CloseDoor

_get_password:

;ESP_VERI_GONDERIMI_DENEME.c,218 :: 		void get_password()  // char idi önceden bak buna olmazsa deðiþtir.
;ESP_VERI_GONDERIMI_DENEME.c,221 :: 		line1:
___get_password_line1:
;ESP_VERI_GONDERIMI_DENEME.c,222 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,223 :: 		Lcd_Out(1,1,"###ENTER PASSWORD###");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr20_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr20_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,224 :: 		Lcd_Out(3,1,"--------------------");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,226 :: 		for(i=0;i<4;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_get_password27:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_password87
	MOVLW       4
	SUBWF       _i+0, 0 
L__get_password87:
	BTFSC       STATUS+0, 0 
	GOTO        L_get_password28
;ESP_VERI_GONDERIMI_DENEME.c,228 :: 		while (password[i]==0)
L_get_password30:
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password31
;ESP_VERI_GONDERIMI_DENEME.c,230 :: 		password[i]=Keypad_Key_Click();
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__get_password+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__get_password+1 
	CALL        _Keypad_Key_Click+0, 0
	MOVFF       FLOC__get_password+0, FSR1L+0
	MOVFF       FLOC__get_password+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ESP_VERI_GONDERIMI_DENEME.c,231 :: 		}
	GOTO        L_get_password30
L_get_password31:
;ESP_VERI_GONDERIMI_DENEME.c,232 :: 		if(password[i]==1)  password[i]='1';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password32
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       49
	MOVWF       POSTINC1+0 
L_get_password32:
;ESP_VERI_GONDERIMI_DENEME.c,233 :: 		if(password[i]==2)  password[i]='2';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password33
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       50
	MOVWF       POSTINC1+0 
L_get_password33:
;ESP_VERI_GONDERIMI_DENEME.c,234 :: 		if(password[i]==3)  password[i]='3';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password34
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       51
	MOVWF       POSTINC1+0 
L_get_password34:
;ESP_VERI_GONDERIMI_DENEME.c,235 :: 		if(password[i]==5)  password[i]='4';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password35
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       52
	MOVWF       POSTINC1+0 
L_get_password35:
;ESP_VERI_GONDERIMI_DENEME.c,236 :: 		if(password[i]==6)  password[i]='5';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password36
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       53
	MOVWF       POSTINC1+0 
L_get_password36:
;ESP_VERI_GONDERIMI_DENEME.c,237 :: 		if(password[i]==7)  password[i]='6';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password37
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       54
	MOVWF       POSTINC1+0 
L_get_password37:
;ESP_VERI_GONDERIMI_DENEME.c,238 :: 		if(password[i]==9)  password[i]='7';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password38
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       55
	MOVWF       POSTINC1+0 
L_get_password38:
;ESP_VERI_GONDERIMI_DENEME.c,239 :: 		if(password[i]==10)  password[i]='8';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password39
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       56
	MOVWF       POSTINC1+0 
L_get_password39:
;ESP_VERI_GONDERIMI_DENEME.c,240 :: 		if(password[i]==11)  password[i]='9';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       11
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password40
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       57
	MOVWF       POSTINC1+0 
L_get_password40:
;ESP_VERI_GONDERIMI_DENEME.c,241 :: 		if(password[i]==13)  password[i]='*';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       13
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password41
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       42
	MOVWF       POSTINC1+0 
L_get_password41:
;ESP_VERI_GONDERIMI_DENEME.c,242 :: 		if(password[i]==14)  password[i]='0';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       14
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password42
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       48
	MOVWF       POSTINC1+0 
L_get_password42:
;ESP_VERI_GONDERIMI_DENEME.c,243 :: 		if(password[i]==15)  password[i]='#';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       15
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password43
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       35
	MOVWF       POSTINC1+0 
L_get_password43:
;ESP_VERI_GONDERIMI_DENEME.c,245 :: 		Lcd_Chr(2,i+1,'*');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _i+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       42
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,246 :: 		Delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_get_password44:
	DECFSZ      R13, 1, 1
	BRA         L_get_password44
	DECFSZ      R12, 1, 1
	BRA         L_get_password44
	DECFSZ      R11, 1, 1
	BRA         L_get_password44
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,226 :: 		for(i=0;i<4;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;ESP_VERI_GONDERIMI_DENEME.c,248 :: 		}
	GOTO        L_get_password27
L_get_password28:
;ESP_VERI_GONDERIMI_DENEME.c,250 :: 		if(strcmp(password,"1481")==0)
	MOVLW       _password+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_password+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr22_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr22_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_password88
	MOVLW       0
	XORWF       R0, 0 
L__get_password88:
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password45
;ESP_VERI_GONDERIMI_DENEME.c,253 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,254 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,255 :: 		Lcd_Out(1,1,"-----MR.GURKAN------");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr23_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr23_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,256 :: 		Lcd_Out(2,1,"-----WELCOME TO------");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr24_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr24_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,257 :: 		Lcd_Out(3,1,"--YOUR SMART HOME--");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr25_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr25_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,258 :: 		OpenDoor();
	CALL        _OpenDoor+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,259 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password46:
	DECFSZ      R13, 1, 1
	BRA         L_get_password46
	DECFSZ      R12, 1, 1
	BRA         L_get_password46
	DECFSZ      R11, 1, 1
	BRA         L_get_password46
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,260 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,261 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,262 :: 		Lcd_Out(1,1,"DATA LOGGING...");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr26_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr26_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,263 :: 		CloseDoor();
	CALL        _CloseDoor+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,264 :: 		UART_Write_Text("AT\r\n");
	MOVLW       ?lstr27_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr27_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,265 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password47:
	DECFSZ      R13, 1, 1
	BRA         L_get_password47
	DECFSZ      R12, 1, 1
	BRA         L_get_password47
	DECFSZ      R11, 1, 1
	BRA         L_get_password47
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,266 :: 		UART1_Write_Text("AT+CIPSTART=\"TCP\",\"184.106.153.149\",80\r\n");
	MOVLW       ?lstr28_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr28_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,267 :: 		Delay_ms(4000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password48:
	DECFSZ      R13, 1, 1
	BRA         L_get_password48
	DECFSZ      R12, 1, 1
	BRA         L_get_password48
	DECFSZ      R11, 1, 1
	BRA         L_get_password48
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,268 :: 		UART1_Write_Text("AT+CIPSEND=49\r\n");
	MOVLW       ?lstr29_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr29_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,269 :: 		Delay_ms(4000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password49:
	DECFSZ      R13, 1, 1
	BRA         L_get_password49
	DECFSZ      R12, 1, 1
	BRA         L_get_password49
	DECFSZ      R11, 1, 1
	BRA         L_get_password49
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,270 :: 		UART1_Write_Text ("GET /update?api_key=A1WNV4DDSG49HSBE&field1=1\r\n");
	MOVLW       ?lstr30_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr30_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,271 :: 		Delay_ms(5000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_get_password50:
	DECFSZ      R13, 1, 1
	BRA         L_get_password50
	DECFSZ      R12, 1, 1
	BRA         L_get_password50
	DECFSZ      R11, 1, 1
	BRA         L_get_password50
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,272 :: 		UART_Write_Text("AT\r\n");
	MOVLW       ?lstr31_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr31_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,273 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password51:
	DECFSZ      R13, 1, 1
	BRA         L_get_password51
	DECFSZ      R12, 1, 1
	BRA         L_get_password51
	DECFSZ      R11, 1, 1
	BRA         L_get_password51
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,277 :: 		}
	GOTO        L_get_password52
L_get_password45:
;ESP_VERI_GONDERIMI_DENEME.c,279 :: 		else if(strcmp(password,"3526")==0)
	MOVLW       _password+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_password+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr32_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr32_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_password89
	MOVLW       0
	XORWF       R0, 0 
L__get_password89:
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password53
;ESP_VERI_GONDERIMI_DENEME.c,282 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,283 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,284 :: 		Lcd_Out(1,1,"-----MR.VOLKAN------");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr33_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr33_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,285 :: 		Lcd_Out(2,1,"-----WELCOME TO------");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr34_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr34_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,286 :: 		Lcd_Out(3,1,"--YOUR SMART HOME--");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr35_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr35_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,287 :: 		OpenDoor();
	CALL        _OpenDoor+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,288 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password54:
	DECFSZ      R13, 1, 1
	BRA         L_get_password54
	DECFSZ      R12, 1, 1
	BRA         L_get_password54
	DECFSZ      R11, 1, 1
	BRA         L_get_password54
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,289 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,290 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,291 :: 		Lcd_Out(1,1,"DATA LOGGING...");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr36_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr36_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,292 :: 		CloseDoor();
	CALL        _CloseDoor+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,293 :: 		UART_Write_Text("AT\r\n");
	MOVLW       ?lstr37_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr37_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,294 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password55:
	DECFSZ      R13, 1, 1
	BRA         L_get_password55
	DECFSZ      R12, 1, 1
	BRA         L_get_password55
	DECFSZ      R11, 1, 1
	BRA         L_get_password55
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,295 :: 		UART1_Write_Text("AT+CIPSTART=\"TCP\",\"184.106.153.149\",80\r\n");
	MOVLW       ?lstr38_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr38_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,296 :: 		Delay_ms(4000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password56:
	DECFSZ      R13, 1, 1
	BRA         L_get_password56
	DECFSZ      R12, 1, 1
	BRA         L_get_password56
	DECFSZ      R11, 1, 1
	BRA         L_get_password56
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,297 :: 		UART1_Write_Text("AT+CIPSEND=49\r\n");
	MOVLW       ?lstr39_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr39_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,298 :: 		Delay_ms(4000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password57:
	DECFSZ      R13, 1, 1
	BRA         L_get_password57
	DECFSZ      R12, 1, 1
	BRA         L_get_password57
	DECFSZ      R11, 1, 1
	BRA         L_get_password57
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,299 :: 		UART1_Write_Text ("GET /update?api_key=A1WNV4DDSG49HSBE&field1=2\r\n");
	MOVLW       ?lstr40_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr40_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,300 :: 		Delay_ms(5000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_get_password58:
	DECFSZ      R13, 1, 1
	BRA         L_get_password58
	DECFSZ      R12, 1, 1
	BRA         L_get_password58
	DECFSZ      R11, 1, 1
	BRA         L_get_password58
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,301 :: 		UART_Write_Text("AT\r\n");
	MOVLW       ?lstr41_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr41_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,302 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password59:
	DECFSZ      R13, 1, 1
	BRA         L_get_password59
	DECFSZ      R12, 1, 1
	BRA         L_get_password59
	DECFSZ      R11, 1, 1
	BRA         L_get_password59
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,306 :: 		}
	GOTO        L_get_password60
L_get_password53:
;ESP_VERI_GONDERIMI_DENEME.c,308 :: 		else if(strcmp(password,"0614")==0)
	MOVLW       _password+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_password+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr42_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr42_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_password90
	MOVLW       0
	XORWF       R0, 0 
L__get_password90:
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password61
;ESP_VERI_GONDERIMI_DENEME.c,311 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,312 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,313 :: 		Lcd_Out(1,1,"-----MR.YASIN------");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr43_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr43_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,314 :: 		Lcd_Out(2,1,"-----WELCOME TO------");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr44_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr44_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,315 :: 		Lcd_Out(3,1,"--YOUR SMART HOME--");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr45_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr45_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,316 :: 		OpenDoor();
	CALL        _OpenDoor+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,317 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password62:
	DECFSZ      R13, 1, 1
	BRA         L_get_password62
	DECFSZ      R12, 1, 1
	BRA         L_get_password62
	DECFSZ      R11, 1, 1
	BRA         L_get_password62
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,318 :: 		CloseDoor();
	CALL        _CloseDoor+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,319 :: 		UART_Write_Text("AT\r\n");
	MOVLW       ?lstr46_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr46_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,320 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password63:
	DECFSZ      R13, 1, 1
	BRA         L_get_password63
	DECFSZ      R12, 1, 1
	BRA         L_get_password63
	DECFSZ      R11, 1, 1
	BRA         L_get_password63
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,321 :: 		UART1_Write_Text("AT+CIPSTART=\"TCP\",\"184.106.153.149\",80\r\n");
	MOVLW       ?lstr47_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr47_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,322 :: 		Delay_ms(4000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password64:
	DECFSZ      R13, 1, 1
	BRA         L_get_password64
	DECFSZ      R12, 1, 1
	BRA         L_get_password64
	DECFSZ      R11, 1, 1
	BRA         L_get_password64
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,323 :: 		UART1_Write_Text("AT+CIPSEND=49\r\n");
	MOVLW       ?lstr48_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr48_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,324 :: 		Delay_ms(4000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password65:
	DECFSZ      R13, 1, 1
	BRA         L_get_password65
	DECFSZ      R12, 1, 1
	BRA         L_get_password65
	DECFSZ      R11, 1, 1
	BRA         L_get_password65
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,325 :: 		UART1_Write_Text ("GET /update?api_key=A1WNV4DDSG49HSBE&field1=3\r\n");
	MOVLW       ?lstr49_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr49_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,326 :: 		Delay_ms(5000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_get_password66:
	DECFSZ      R13, 1, 1
	BRA         L_get_password66
	DECFSZ      R12, 1, 1
	BRA         L_get_password66
	DECFSZ      R11, 1, 1
	BRA         L_get_password66
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,327 :: 		UART_Write_Text("AT\r\n");
	MOVLW       ?lstr50_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr50_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,328 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password67:
	DECFSZ      R13, 1, 1
	BRA         L_get_password67
	DECFSZ      R12, 1, 1
	BRA         L_get_password67
	DECFSZ      R11, 1, 1
	BRA         L_get_password67
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,329 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,330 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,331 :: 		Lcd_Out(1,1,"DATA LOGGING...");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr51_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr51_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,334 :: 		}
	GOTO        L_get_password68
L_get_password61:
;ESP_VERI_GONDERIMI_DENEME.c,340 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,341 :: 		Lcd_Out(1,1,"WRONG PASSWORD");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr52_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr52_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,342 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_get_password69:
	DECFSZ      R13, 1, 1
	BRA         L_get_password69
	DECFSZ      R12, 1, 1
	BRA         L_get_password69
	DECFSZ      R11, 1, 1
	BRA         L_get_password69
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,343 :: 		password[0]= 0;
	CLRF        _password+0 
;ESP_VERI_GONDERIMI_DENEME.c,344 :: 		password[1]= 0;
	CLRF        _password+1 
;ESP_VERI_GONDERIMI_DENEME.c,345 :: 		password[2]= 0;
	CLRF        _password+2 
;ESP_VERI_GONDERIMI_DENEME.c,346 :: 		password[3]= 0;
	CLRF        _password+3 
;ESP_VERI_GONDERIMI_DENEME.c,347 :: 		password[4]= 0;
	CLRF        _password+4 
;ESP_VERI_GONDERIMI_DENEME.c,348 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,351 :: 		b++;
	INFSNZ      _b+0, 1 
	INCF        _b+1, 1 
;ESP_VERI_GONDERIMI_DENEME.c,352 :: 		if(b==3) goto here;
	MOVLW       0
	XORWF       _b+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_password91
	MOVLW       3
	XORWF       _b+0, 0 
L__get_password91:
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password70
	GOTO        ___get_password_here
L_get_password70:
;ESP_VERI_GONDERIMI_DENEME.c,354 :: 		goto line1;
	GOTO        ___get_password_line1
;ESP_VERI_GONDERIMI_DENEME.c,355 :: 		here:
___get_password_here:
;ESP_VERI_GONDERIMI_DENEME.c,356 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,357 :: 		Lcd_Out(1,1,"SYSTEM IS BLOCKED");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr53_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr53_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,358 :: 		Lcd_Out(2,4,"PLEASE WAIT ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr54_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr54_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,359 :: 		UART_Write_Text("AT\r\n");
	MOVLW       ?lstr55_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr55_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,360 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password71:
	DECFSZ      R13, 1, 1
	BRA         L_get_password71
	DECFSZ      R12, 1, 1
	BRA         L_get_password71
	DECFSZ      R11, 1, 1
	BRA         L_get_password71
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,361 :: 		UART1_Write_Text("AT+CIPSTART=\"TCP\",\"184.106.153.149\",80\r\n");
	MOVLW       ?lstr56_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr56_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,362 :: 		Delay_ms(4000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password72:
	DECFSZ      R13, 1, 1
	BRA         L_get_password72
	DECFSZ      R12, 1, 1
	BRA         L_get_password72
	DECFSZ      R11, 1, 1
	BRA         L_get_password72
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,363 :: 		UART1_Write_Text("AT+CIPSEND=49\r\n");
	MOVLW       ?lstr57_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr57_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,364 :: 		Delay_ms(4000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password73:
	DECFSZ      R13, 1, 1
	BRA         L_get_password73
	DECFSZ      R12, 1, 1
	BRA         L_get_password73
	DECFSZ      R11, 1, 1
	BRA         L_get_password73
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,365 :: 		UART1_Write_Text ("GET /update?api_key=A1WNV4DDSG49HSBE&field1=9\r\n");
	MOVLW       ?lstr58_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr58_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,366 :: 		Delay_ms(5000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_get_password74:
	DECFSZ      R13, 1, 1
	BRA         L_get_password74
	DECFSZ      R12, 1, 1
	BRA         L_get_password74
	DECFSZ      R11, 1, 1
	BRA         L_get_password74
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,367 :: 		UART_Write_Text("AT\r\n");
	MOVLW       ?lstr59_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr59_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,368 :: 		Delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_get_password75:
	DECFSZ      R13, 1, 1
	BRA         L_get_password75
	DECFSZ      R12, 1, 1
	BRA         L_get_password75
	DECFSZ      R11, 1, 1
	BRA         L_get_password75
	NOP
	NOP
;ESP_VERI_GONDERIMI_DENEME.c,369 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,370 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,371 :: 		Lcd_Out(1,1,"DATA LOGGING...");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr60_ESP_VERI_GONDERIMI_DENEME+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr60_ESP_VERI_GONDERIMI_DENEME+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,372 :: 		goto line1;
	GOTO        ___get_password_line1
;ESP_VERI_GONDERIMI_DENEME.c,373 :: 		}
L_get_password68:
L_get_password60:
L_get_password52:
;ESP_VERI_GONDERIMI_DENEME.c,375 :: 		}
L_end_get_password:
	RETURN      0
; end of _get_password

_main:

;ESP_VERI_GONDERIMI_DENEME.c,379 :: 		void main()
;ESP_VERI_GONDERIMI_DENEME.c,381 :: 		setup();
	CALL        _setup+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,382 :: 		while(1)
L_main76:
;ESP_VERI_GONDERIMI_DENEME.c,384 :: 		if(counter!=0)
	MOVLW       0
	XORWF       _counter+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main93
	MOVLW       0
	XORWF       _counter+0, 0 
L__main93:
	BTFSC       STATUS+0, 2 
	GOTO        L_main78
;ESP_VERI_GONDERIMI_DENEME.c,386 :: 		show_statu();
	CALL        _show_statu+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,387 :: 		counter=0;
	CLRF        _counter+0 
	CLRF        _counter+1 
;ESP_VERI_GONDERIMI_DENEME.c,388 :: 		}
L_main78:
;ESP_VERI_GONDERIMI_DENEME.c,389 :: 		get_password();
	CALL        _get_password+0, 0
;ESP_VERI_GONDERIMI_DENEME.c,390 :: 		password[0]= 0; password[1]= 0; password[2]= 0;  password[3]= 0; password[4]= 0;
	CLRF        _password+0 
	CLRF        _password+1 
	CLRF        _password+2 
	CLRF        _password+3 
	CLRF        _password+4 
;ESP_VERI_GONDERIMI_DENEME.c,393 :: 		}
	GOTO        L_main76
;ESP_VERI_GONDERIMI_DENEME.c,398 :: 		}// Main kapatma parantezi dokunma buna.
L_end_main:
	GOTO        $+0
; end of _main
