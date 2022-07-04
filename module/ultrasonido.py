from migen import *
from migen.genlib.cdc import MultiReg
from litex.soc.interconnect.csr import *
from litex.soc.interconnect.csr_eventmanager import *

class us(Module,AutoCSR):
    def __init__(self, ECO, TRIGGER):
        self.CLK= ClockSignal()
        self.ECO = ECO
        self.TRIGGER = TRIGGER
        self.medida = CSRStatus(8)

        self.specials += Instance("sensor_prueba",
            i_CLK = self.CLK,
            o_medida = self.medida.status,
            i_ECO = self.ECO,
            o_TRIGGER = self.TRIGGER)
