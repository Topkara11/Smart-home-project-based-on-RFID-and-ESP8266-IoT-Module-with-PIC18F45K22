#line 1 "C:/Users/Pc/Desktop/dersler/3.2 Gurkan/MikroIslemci/Proje/Proteus Part/code/ESP_VERI_GONDERIMI_DENEME.c"
#line 12 "C:/Users/Pc/Desktop/dersler/3.2 Gurkan/MikroIslemci/Proje/Proteus Part/code/ESP_VERI_GONDERIMI_DENEME.c"
unsigned int i,b,counter=0;
unsigned int counter_show=0;
unsigned int temperature_value = 0;
unsigned int buz;

float mv;
unsigned char tp[15];
unsigned char ROOM_1_STATU[3], ROOM_2_STATU[3], ROOM_3_STATU[3], ROOM_4_STATU[3];

char password[5],converted_temperature[2],temp_field[54];

unsigned char sec;
sbit LCD_EN at RC1_bit;
sbit LCD_RS at RC0_bit;
sbit LCD_D4 at RC2_bit;
sbit LCD_D5 at RC3_bit;
sbit LCD_D6 at RC4_bit;
sbit LCD_D7 at RC5_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_D4_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISC3_bit;
sbit LCD_D6_Direction at TRISC4_bit;
sbit LCD_D7_Direction at TRISC5_bit;
unsigned keypadPort at PORTD;
unsigned keypadPort_Direction at TRISD;

void setup()
{
ANSELD = 0;
ANSELC = 0;
ANSELB = 0;
ANSELE = 0;
ANSELA = 0;
TRISA = 0X01;
TRISE = 0X00;
TRISB = 0X01;
UART1_Init(9600);
Keypad_Init();
Lcd_Init();
ADC_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
INTEDG0_bit =0;
INT0IF_bit =0;
INT0IE_bit =1;
GIE_bit = 1;
Lcd_Out(2,4,"GURKAN TOPKARA");
Lcd_Out(3,6 ,"SMART HOME ");
Lcd_out(4,1,"gurkantopkara7@gmail");
UART1_Write_Text("AT\r\n");
Delay_ms(2000);
UART1_Write_Text("ATE0\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CWMODE=3\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CIPMODE=0\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CIPMUX=0\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CWDHCP=1,1\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CWJAP=\"elfo11\",\"elfotopkara11\"\r\n");
Delay_ms(9000);

Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);


}



void show_statu()
{

if(PORTA.RA1==1)
{
 strcpy(ROOM_1_STATU,"ON");
}

else
{
strcpy(ROOM_1_STATU,"OFF");
}

if(PORTA.RA2==1)
{
strcpy(ROOM_2_STATU,"ON");
}
else
{
strcpy(ROOM_2_STATU,"OFF");
}

if(PORTA.RA3==1)
{
strcpy(ROOM_3_STATU,"ON");
}
else
{
strcpy(ROOM_3_STATU,"OFF");
}

if(PORTA.RA4)
{
strcpy(ROOM_4_STATU,"ON");
}
else if(!PORTA.RA4)
{
strcpy(ROOM_4_STATU,"OFF");

}



temperature_value=ADC_Read(AN0);
mv=temperature_value*(4998.8699/1024);
mv=mv/10.0;
FloatToStr(mv,tp);
Delay_ms(200);

Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_out(1,1,"TEMP|RO1|RO2|RO3|RO4");
Lcd_Chr(3,2,tp[0]);
Lcd_Chr(3,3,tp[1]);
Lcd_Chr(3,5,'|');


Lcd_Chr(2,5,'|');
Lcd_Chr(2,9,'|');
Lcd_Chr(2,13,'|');
Lcd_Chr(2,17,'|');

Lcd_Chr(4,5,'|');
Lcd_Chr(4,9,'|');
Lcd_Chr(4,13,'|');
Lcd_Chr(4,17,'|');

Lcd_out(3,6,ROOM_1_STATU);
Lcd_Chr(3,9,'|');
Lcd_out(3,10,ROOM_2_STATU);
Lcd_Chr(3,13,'|');
Lcd_Out(3,14,ROOM_3_STATU);
Lcd_Chr(3,17,'|');
Lcd_Out(3,18,ROOM_4_STATU);
Delay_ms(3000);



 }
#line 175 "C:/Users/Pc/Desktop/dersler/3.2 Gurkan/MikroIslemci/Proje/Proteus Part/code/ESP_VERI_GONDERIMI_DENEME.c"
void interrupt()
{
if(INT0IF_bit==1)
 {

 counter++;

 }

 INT0IF_bit=0;
}

void OpenDoor()
 {

  PORTB.RB5 =1;
  PORTB.RB6 =0;
 for(buz=0;buz<3;buz++)
 {
  PORTE.RE0  = 1;
 Delay_ms(150);
  PORTE.RE0  = 0;
 Delay_ms(150);
 }
 Delay_ms(2000);
  PORTB.RB5 =0;
  PORTB.RB6 =0;
 }

void CloseDoor(){

 PORTE.RE0 =1;
Delay_ms(1000);
 PORTE.RE0 =0;
 PORTB.RB5 =0;
 PORTB.RB6 =1;
Delay_ms(2000);
 PORTB.RB5 =0;
 PORTB.RB6 =0;

}


void get_password()
{

 line1:
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,"###ENTER PASSWORD###");
Lcd_Out(3,1,"--------------------");

for(i=0;i<4;i++)
{
while (password[i]==0)
{
password[i]=Keypad_Key_Click();
}
if(password[i]==1) password[i]='1';
if(password[i]==2) password[i]='2';
if(password[i]==3) password[i]='3';
if(password[i]==5) password[i]='4';
if(password[i]==6) password[i]='5';
if(password[i]==7) password[i]='6';
if(password[i]==9) password[i]='7';
if(password[i]==10) password[i]='8';
if(password[i]==11) password[i]='9';
if(password[i]==13) password[i]='*';
if(password[i]==14) password[i]='0';
if(password[i]==15) password[i]='#';

Lcd_Chr(2,i+1,'*');
Delay_ms(200);

}

if(strcmp(password,"1481")==0)
{

Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,1,"-----MR.GURKAN------");
Lcd_Out(2,1,"-----WELCOME TO------");
Lcd_Out(3,1,"--YOUR SMART HOME--");
OpenDoor();
Delay_ms(2000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,1,"DATA LOGGING...");
CloseDoor();
UART_Write_Text("AT\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CIPSTART=\"TCP\",\"184.106.153.149\",80\r\n");
Delay_ms(4000);
UART1_Write_Text("AT+CIPSEND=49\r\n");
Delay_ms(4000);
UART1_Write_Text ("GET /update?api_key=A1WNV4DDSG49HSBE&field1=1\r\n");
Delay_ms(5000);
UART_Write_Text("AT\r\n");
Delay_ms(2000);



}

else if(strcmp(password,"3526")==0)
{

Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,1,"-----MR.VOLKAN------");
Lcd_Out(2,1,"-----WELCOME TO------");
Lcd_Out(3,1,"--YOUR SMART HOME--");
OpenDoor();
Delay_ms(2000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,1,"DATA LOGGING...");
CloseDoor();
UART_Write_Text("AT\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CIPSTART=\"TCP\",\"184.106.153.149\",80\r\n");
Delay_ms(4000);
UART1_Write_Text("AT+CIPSEND=49\r\n");
Delay_ms(4000);
UART1_Write_Text ("GET /update?api_key=A1WNV4DDSG49HSBE&field1=2\r\n");
Delay_ms(5000);
UART_Write_Text("AT\r\n");
Delay_ms(2000);



}

else if(strcmp(password,"0614")==0)
{

Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,1,"-----MR.YASIN------");
Lcd_Out(2,1,"-----WELCOME TO------");
Lcd_Out(3,1,"--YOUR SMART HOME--");
OpenDoor();
Delay_ms(2000);
CloseDoor();
UART_Write_Text("AT\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CIPSTART=\"TCP\",\"184.106.153.149\",80\r\n");
Delay_ms(4000);
UART1_Write_Text("AT+CIPSEND=49\r\n");
Delay_ms(4000);
UART1_Write_Text ("GET /update?api_key=A1WNV4DDSG49HSBE&field1=3\r\n");
Delay_ms(5000);
UART_Write_Text("AT\r\n");
Delay_ms(2000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,1,"DATA LOGGING...");


}



else
{
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,"WRONG PASSWORD");
Delay_ms(1000);
password[0]= 0;
password[1]= 0;
password[2]= 0;
password[3]= 0;
password[4]= 0;
Lcd_Cmd(_LCD_CLEAR);

b==0;
b++;
if(b==3) goto here;

goto line1;
here:
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,"SYSTEM IS BLOCKED");
Lcd_Out(2,4,"PLEASE WAIT ");
UART_Write_Text("AT\r\n");
Delay_ms(2000);
UART1_Write_Text("AT+CIPSTART=\"TCP\",\"184.106.153.149\",80\r\n");
Delay_ms(4000);
UART1_Write_Text("AT+CIPSEND=49\r\n");
Delay_ms(4000);
UART1_Write_Text ("GET /update?api_key=A1WNV4DDSG49HSBE&field1=9\r\n");
Delay_ms(5000);
UART_Write_Text("AT\r\n");
Delay_ms(2000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1,1,"DATA LOGGING...");
goto line1;
}

}



void main()
{
setup();
while(1)
{
if(counter!=0)
{
show_statu();
counter=0;
}
get_password();
password[0]= 0; password[1]= 0; password[2]= 0; password[3]= 0; password[4]= 0;


}




}
