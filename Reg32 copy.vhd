library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
ENTITY Reg32 IS
	PORT (
	I: IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	CLK, LOD, INC, CLR: IN STD_LOGIC;
	O: OUT  STD_LOGIC_VECTOR (31 DOWNTO 0));
END Reg32;

ARCHITECTURE reg_arch OF Reg32 IS
	SIGNAL temp: unsigned(31 DOWNTO 0) := (others => '0');
BEGIN
	PROCESS(clk)
	BEGIN
	IF(CLK'event AND CLK='1')THEN
		IF(LOD ='1') THEN
			temp <= unsigned(I);
		ELSIF (INC='1')THEN
			temp <= temp +1;
		ELSIF(CLR='1') THEN
			temp <=(others =>'0');
		END IF;
	END IF;
	END PROCESS;
	O <= std_logic_vector(temp);
END reg_arch;