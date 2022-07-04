#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>

#include "delay.h"
#include "display.h"
#include "uart1.h"

static char *readstr(void)
{
	char c[2];
	static char s[64];
	static int ptr = 0;

	if(readchar_nonblock()) {
		c[0] = readchar();
		c[1] = 0;
		switch(c[0]) {
			case 0x7f:
			case 0x08:
				if(ptr > 0) {
					ptr--;
					putsnonl("\x08 \x08");
				}
				break;
			case 0x07:
				break;
			case '\r':
			case '\n':
				s[ptr] = 0x00;
				putsnonl("\n");
				ptr = 0;
				return s;
			default:
				if(ptr >= (sizeof(s) - 1))
					break;
				putsnonl(c);
				s[ptr] = c[0];
				ptr++;
				break;
		}
	}
	return NULL;
}

static char *get_token(char **str)
{
	char *c, *d;

	c = (char *)strchr(*str, ' ');
	if(c == NULL) {
		d = *str;
		*str = *str+strlen(*str);
		return d;
	}
	*c = 0;
	d = *str;
	*str = c+1;
	return d;
}

static void prompt(void)
{
	printf("RUNTIME>");
}

static void help(void)
{
	puts("Available commands:");
	puts("help                            - this command");
	puts("reboot                          - reboot CPU");
	puts("led                             - led test");
	puts("switch                          - switch test");
	puts("display                         - display test");
	puts("rgbled                          - rgb led test");
	puts("vga                             - vga test");
	puts("UlSon                         - pruba perrona test");
	puts("lab4                          - ledsd test");
	puts("servo                          - lservoouwutest");
	puts("rx                              -Prueba Bluetooth");
	puts("tx                              -Prueba Bluetoothx2ptos");
}

static void reboot(void)
{
	ctrl_reset_write(1);
}

static void display_test(void)
{
	int i;
	signed char defill = 0;	//1->left, -1->right, 0->.

	char txtToDisplay[40] = {0, DISPLAY_0, DISPLAY_1,DISPLAY_2,DISPLAY_3,DISPLAY_4,DISPLAY_5,DISPLAY_6,DISPLAY_7,DISPLAY_8,DISPLAY_9,DISPLAY_A,DISPLAY_B,DISPLAY_C,DISPLAY_D,DISPLAY_E,DISPLAY_F,DISPLAY_G,DISPLAY_H,DISPLAY_I,DISPLAY_J,DISPLAY_K,DISPLAY_L,DISPLAY_M,DISPLAY_N,DISPLAY_O,DISPLAY_P,DISPLAY_Q,DISPLAY_R,DISPLAY_S,DISPLAY_T,DISPLAY_U,DISPLAY_V,DISPLAY_W,DISPLAY_X,DISPLAY_Y,DISPLAY_Z,DISPLAY_DP,DISPLAY_TR,DISPLAY_UR};

	printf("Test del los display de 7 segmentos... se interrumpe con el botton 1\n");

	while(!(buttons_in_read()&1)) {
		display(txtToDisplay);
		if(buttons_in_read()&(1<<1)) defill = ((defill<=-1) ? -1 : defill-1);
		if(buttons_in_read()&(1<<2)) defill = ((defill>=1) ? 1 : defill+1);
		if (defill > 0) {
			char tmp = txtToDisplay[0];
			for(i=0; i<sizeof(txtToDisplay)/sizeof(txtToDisplay[i]); i++) {
				txtToDisplay[i] = ((i==sizeof(txtToDisplay)/sizeof(txtToDisplay[i])-1) ? tmp : txtToDisplay[i+1]);
			}
		}
		else if(defill < 0) {
			char tmp = txtToDisplay[sizeof(txtToDisplay)/sizeof(txtToDisplay[0])-1];
			for(i=sizeof(txtToDisplay)/sizeof(txtToDisplay[i])-1; i>=0; i--) {
				txtToDisplay[i] = ((i==0) ? tmp : txtToDisplay[i-1]);
			}
		}
		delay_ms(500);
	}
}

static void led_test(void)
{
	unsigned int i;
	printf("Test del los leds... se interrumpe con el botton 1\n");
	while(!(buttons_in_read()&1)) {

	for(i=1; i<65536; i=i*2) {
		leds_out_write(i);
		delay_ms(50);
	}
	for(i=32768;i>1; i=i/2) {
		leds_out_write(i);
		delay_ms(50);
	}
	}

}

static void writeint(uint32_t val)
{
	uint32_t i, digit;

	for (i=0; i<8; i++) {
		digit = (val & 0xF0000000) >> 28;
		if (digit >= 0xA) {
			uart_putchar('A'+digit-10);//uart_putchar('Y');
			}
		else{
			uart_putchar('0'+digit);//uart_putchar('N');
		val <<= 4;
		}
	}
}

static void lab4_test(void)
{
	unsigned int i;
	printf("Test del los leds... se interrumpe con el botton 1\n");
	while(!(buttons_in_read()&1)) {

	for(i=1; i<65536; i++) {
		leds_out_write(i);
		delay_ms(50);
	}
	for(i=32768;i>1; i=i-1) {
		leds_out_write(i);
		delay_ms(50);
	}
	}

}

static void US_test(void)
{
	printf("Test del los leds... se interrumpe con el botton 1\n");
	while(!(buttons_in_read()&1)) {
			int done=us_driver_medida_read();
			printf("distancia: %d \n",done);
		delay_ms(200);
	}

}






static void switch_test(void)
{
	unsigned short temp2 =0;
	printf("Test del los interruptores... se interrumpe con el botton 1\n");
	while(!(buttons_in_read()&1)) {
		unsigned short temp = switchs_in_read();
		if (temp2 != temp){
			printf("switch bus : %i\n", temp);
			leds_out_write(temp);
			temp2 = temp;
		}
	}
}


/*static void rx_test(void){
	char temp;
	char state[4] = "0";
	int i = 0;
	while(i<4){
		temp = uart1_read();
		printf("temp: %c\n",temp);
		state[i] = temp;
		i=i+1;
		}
		printf("state: %d\n",sizeof(state));
	}*/

	static void tx_test(void){
		char temp;
		char state[4] = "0";
		int i = 0;



		}


		static void servo_test(void){

			int nuevad=0;
			int posicionn=0;
			int dir=1;
			char value = '0';
			char preubalect = '0';
			char preubadi = '0';
			char temp='0';
			char strr[4];

			while(!(buttons_in_read()&1)) {
			if(posicionn==7){
			    dir=-1;
			}
			if(posicionn==1){
			    dir=1;
			}


		/*	nuevad=us_driver_medida_read();
			int unidad=nuevad%10;
			int decena=(nuevad/10)%10;
			int centena=(nuevad/100)%10;

			strr[0]=centena+'0';
			strr[1]=decena+'0';
			strr[2]=unidad+'0';
			strr[3]='\0';

			int i =0;
			for(i=0;i<4;i++){
				uart1_write(strr[i]);

}
printf("distancia: %s \n",strr);
int doner=us_driver_medida_read();
printf("distancia: %d \n",doner);*/

posicionn=posicionn+dir;
servo_driver_ctr_write(posicionn);
printf("pos %d", posicionn);
preubalect=posicionn+'0';
printf("poschar %c", preubalect);
uart1_write(preubalect);


delay_ms(500);
			}

			}
			/*printf("distancia: %c \n",nuevad);
			preubadi=nuevad+'0';
			printf("dischar %c", preubadi);
			uart1_write(preubadi);

			temp = uart1_read();
			printf("%c",temp);
			delay_ms(500);
			preubalect = uart1_read();
			printf("%c\n",preubalect);
			delay_ms(500);
			/*h=uart1_read();
			printf("%s\n", h);
			*/







static void rgbled_test(void)
{
	unsigned int T = 128;

	ledRGB_1_r_period_write(T);
	ledRGB_1_g_period_write(T);
	ledRGB_1_b_period_write(T);

	ledRGB_1_r_enable_write(1);
	ledRGB_1_g_enable_write(1);
	ledRGB_1_b_enable_write(1);


	ledRGB_2_r_period_write(T);
	ledRGB_2_g_period_write(T);
	ledRGB_2_b_period_write(T);


	ledRGB_2_r_enable_write(1);
	ledRGB_2_g_enable_write(1);
	ledRGB_2_b_enable_write(1);

	for (unsigned int j=0; j<100; j++){
		ledRGB_1_g_width_write(j);
		for (unsigned int i=0; i<100; i++){
			ledRGB_1_r_width_write(100-i);
			ledRGB_1_b_width_write(i);
			delay_ms(20);

		}
	}



}


static void vga_test(void)
{
	int x,y;

	for(y=0; y<480; y++) {
		for(x=0; x<640; x++) {
			vga_cntrl_mem_we_write(0);
			vga_cntrl_mem_adr_write(y*640+x);
			if(x<640/3)
				vga_cntrl_mem_data_w_write(((int)(x/10)%2^(int)(y/10)%2)*15);
			else if(x<2*640/3)
				vga_cntrl_mem_data_w_write((((int)(x/10)%2^(int)(y/10)%2)*15)<<4);
			else
				vga_cntrl_mem_data_w_write((((int)(x/10)%2^(int)(y/10)%2)*15)<<8);
			vga_cntrl_mem_we_write(1);
		}
	}
}









static void console_service(void)
{
	char *str;
	char *token;

	str = readstr();
	if(str == NULL) return;
	token = get_token(&str);
	if(strcmp(token, "help") == 0)
		help();
	else if(strcmp(token, "reboot") == 0)
		reboot();
	else if(strcmp(token, "led") == 0)
		led_test();
	else if(strcmp(token, "lab4") == 0)
		lab4_test();
	else if(strcmp(token, "UlSon") == 0)
		US_test();
	/*else if(strcmp(token, "rx") == 0)
		rx_test();
	else if(strcmp(token, "tx") == 0)
		tx_test();*/
	else if(strcmp(token, "servo") == 0)
		servo_test();

	else if(strcmp(token, "switch") == 0)
		switch_test();
	else if(strcmp(token, "display") == 0)
		display_test();
	else if(strcmp(token, "rgbled") == 0)
		rgbled_test();
	//else if(strcmp(token, "vga") == 0)
		//vga_test();
	prompt();
}

int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();
	//timer_init_irq(1000);

    puts("\n                     prueba 10:15              \n");
	puts("\nSoC - RiscV project UNAL 2022-1-- CPU testing software built "__DATE__" "__TIME__"\n");
	help();
	prompt();

	while(1) {
		console_service();
	}

	return 0;
}
