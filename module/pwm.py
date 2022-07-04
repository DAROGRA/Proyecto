from migen import *
from migen.genlib.cdc import MultiReg
from litex.soc.interconnect.csr import *
from litex.soc.interconnect.csr_eventmanager import *





class servoUS(Module,AutoCSR):
    def __init__(self, pwm):
        self.clk = ClockSignal()
        self.ctr = CSRStorage(3)
        self.pwm = pwm





        self.specials += Instance("ServoRadar",
            i_clk = self.clk,
            i_ctr = self.ctr.storage,
            o_pwm = self.pwm,
        )
