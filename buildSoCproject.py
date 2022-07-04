#!/usr/bin/env python3

from migen import *
from migen.genlib.io import CRG
from migen.genlib.cdc import MultiReg

#import nexys4 as tarjeta
import nexys4ddr as tarjeta
#import c4e6e10 as tarjeta

from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.interconnect.csr import *
from litex.soc.integration.soc import *

from litex.soc.cores import gpio
from litex.soc.cores import uart
from module import rgbled
from module import sevensegment
from module import vgacontroller
from module import pwm
from module import ultrasonido
# BaseSoC ------------------------------------------------------------------------------------------

class BaseSoC(SoCCore):
	def __init__(self):
		platform = tarjeta.Platform()

		# add Here verilog sources

		####-----SERVO-----####
		platform.add_source("module/verilog/Servo/ServoRadar.v")
		####-----ultrasonido-----####
		platform.add_source("module/verilog/ultrasonidoprueba/DIVISION_ULTRASONICO_RevA.vhd")
		platform.add_source("module/verilog/ultrasonidoprueba/INTESC_LIB_ULTRASONICO_RevC.vhd")
		platform.add_source("module/verilog/ultrasonidoprueba/sensor_prueba.vhd")

		# SoC with CPU
		SoCCore.__init__(self, platform,
 			cpu_type="picorv32",
#			cpu_type="vexriscv",
			clk_freq=100e6,
			integrated_rom_size=0x6000,
			integrated_main_ram_size=16*1024)

		# Clock Reset Generation
		self.submodules.crg = CRG(platform.request("clk"), ~platform.request("cpu_reset"))

		# Leds
		SoCCore.add_csr(self,"leds")
		user_leds = Cat(*[platform.request("led", i) for i in range(16)])
		self.submodules.leds = gpio.GPIOOut(user_leds)

		# Switchs
		SoCCore.add_csr(self,"switchs")
		user_switchs = Cat(*[platform.request("sw", i) for i in range(16)])
		self.submodules.switchs = gpio.GPIOIn(user_switchs)

		# Buttons
		SoCCore.add_csr(self,"buttons")
		user_buttons = Cat(*[platform.request("btn%c" %c) for c in ['c','r','l']])
		self.submodules.buttons = gpio.GPIOIn(user_buttons)

		# 7segments Display
		SoCCore.add_csr(self,"display")
		display_segments = Cat(*[platform.request("display_segment", i) for i in range(8)])
		display_digits = Cat(*[platform.request("display_digit", i) for i in range(8)])
		self.submodules.display = sevensegment.SevenSegment(display_segments,display_digits)

		# RGB leds
		SoCCore.add_csr(self,"ledRGB_1")
		self.submodules.ledRGB_1 = rgbled.RGBLed(platform.request("ledRGB",1))

		SoCCore.add_csr(self,"ledRGB_2")
		self.submodules.ledRGB_2 = rgbled.RGBLed(platform.request("ledRGB",2))

		#Servo uwu
		SoCCore.add_csr(self, "servo_driver")
		self.submodules.servo_driver = pwm.servoUS(platform.request("pwm"))

		# ultrasonido
		SoCCore.add_csr(self,"us_driver")
		self.submodules.us_driver = ultrasonido.us(platform.request("ECO"),platform.request("TRIGGER"))


		#UARTUWU

		self.submodules.uart1_phy = uart.UARTPHY(
			pads     = platform.request("uart1"),
			clk_freq = self.sys_clk_freq,
			baudrate = 9600)
		self.submodules.uart1 = ResetInserter()(uart.UART(self.uart1_phy,
			tx_fifo_depth = 16,
			rx_fifo_depth = 16))
		self.csr.add("uart1_phy", use_loc_if_exists=True)
		self.csr.add("uart1", use_loc_if_exists=True)
		if hasattr(self.cpu, "interrupt"):
			self.irq.add("uart1", use_loc_if_exists=True)
		else:
			self.add_constant("UART_POLLING")
		#UART????
	#	self.submodules.uart1_phy = uart.UARTPHY(
	#	pads     = platform.request("uart1"),
	#	clk_freq = self.sys_clk_freq,
	##	baudrate = 9600)
	#			self.submodules.uart1 = ResetInserter()(uart.UART(self.uart1_phy,
	#				tx_fifo_depth = 16,
	#				rx_fifo_depth = 16))
	#			self.csr.add("uart1_phy", use_loc_if_exists=True)
	#			self.csr.add("uart1", use_loc_if_exists=True)
	#			if hasattr(self.cpu, "interrupt"):
	#				self.irq.add("uart1", use_loc_if_exists=True)
	#			else:
	#				self.add_constant("UART_POLLING")

# Build --------------------------------------------------------------------------------------------

if __name__ == "__main__":
	builder = Builder(BaseSoC(),csr_csv="Soc_MemoryMap.csv")
	builder.build()
