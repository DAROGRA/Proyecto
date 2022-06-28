library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all; 
use IEEE.STD_LOGIC_1164.ALL;


entity sensor_prueba is
port( CLK     : IN  STD_LOGIC;
      ECO     : IN  STD_LOGIC;
      TRIGGER : OUT STD_LOGIC;
		LED     : OUT STD_LOGIC
    );
end sensor_prueba;
 
architecture Behavioral of sensor_prueba is
 
component INTESC_LIB_ULTRASONICO_RevC is
generic( FPGA_CLK : INTEGER := 100_000_000 );
PORT( CLK          : IN  STD_LOGIC;
      ECO          : IN  STD_LOGIC;
      TRIGGER      : OUT STD_LOGIC;
      DATO_LISTO   : OUT STD_LOGIC;
      DISTANCIA_CM : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
     );
end component INTESC_LIB_ULTRASONICO_RevC;
 
signal dato_listo   : std_logic := '0';
signal distancia_cm : std_logic_vector(8 downto 0) := (others => '0');
signal distancia, porcentaje, uni, dec   : integer; 
 
begin
 
u1: INTESC_LIB_ULTRASONICO_RevC 
generic map( FPGA_CLK => 100_000_000 ) -- Reloj de FPGA opera a 50MHz
PORT map( CLK          => CLK, 
          ECO          => ECO, 
          TRIGGER      => TRIGGER, 
          DATO_LISTO   => dato_listo, 
          DISTANCIA_CM => distancia_cm 
         );

process(CLK)
	
begin

distancia<=to_integer(unsigned(distancia_cm(8 downto 0)));
porcentaje <= distancia;

if rising_edge(CLK) then

	if dato_listo = '1' then
	if porcentaje< 120 then
		if porcentaje > 0 then 
			LED<= '1';
		end if;
		else 
			LED <= '0';
		
		end if;
	end if;
		
	
end if;

end process;
end Behavioral;