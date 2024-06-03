library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux5x32 is
    Port ( I0 : in  STD_LOGIC_VECTOR (31 downto 0);
           I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           I3 : in  STD_LOGIC_VECTOR (31 downto 0);
           I4 : in  STD_LOGIC_VECTOR (31 downto 0);
           I5 : in  STD_LOGIC_VECTOR (31 downto 0);
           I6 : in  STD_LOGIC_VECTOR (31 downto 0);
           I7 : in  STD_LOGIC_VECTOR (31 downto 0);
           I8 : in  STD_LOGIC_VECTOR (31 downto 0);
           I9 : in  STD_LOGIC_VECTOR (31 downto 0);
           I10 : in  STD_LOGIC_VECTOR (31 downto 0);
           I11 : in  STD_LOGIC_VECTOR (31 downto 0);
           I12 : in  STD_LOGIC_VECTOR (31 downto 0);
           I13 : in  STD_LOGIC_VECTOR (31 downto 0);
           I14 : in  STD_LOGIC_VECTOR (31 downto 0);
           I15 : in  STD_LOGIC_VECTOR (31 downto 0);
           I16 : in  STD_LOGIC_VECTOR (31 downto 0);
           I17 : in  STD_LOGIC_VECTOR (31 downto 0);
           I18 : in  STD_LOGIC_VECTOR (31 downto 0);
           I19 : in  STD_LOGIC_VECTOR (31 downto 0);
           I20 : in  STD_LOGIC_VECTOR (31 downto 0);
           I21 : in  STD_LOGIC_VECTOR (31 downto 0);
           I22 : in  STD_LOGIC_VECTOR (31 downto 0);
           I23 : in  STD_LOGIC_VECTOR (31 downto 0);
           I24 : in  STD_LOGIC_VECTOR (31 downto 0);
           I25 : in  STD_LOGIC_VECTOR (31 downto 0);
           I26 : in  STD_LOGIC_VECTOR (31 downto 0);
           I27 : in  STD_LOGIC_VECTOR (31 downto 0);
           I28 : in  STD_LOGIC_VECTOR (31 downto 0);
           I29 : in  STD_LOGIC_VECTOR (31 downto 0);
           I30 : in  STD_LOGIC_VECTOR (31 downto 0);
           I31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (4 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end mux5x32;

architecture Behavioral of mux5x32 is

begin
O <=	I0 WHEN Selector="00000" ELSE
      I1 WHEN Selector="00001" ELSE
		I2 WHEN Selector="00010" ELSE
		I3 WHEN Selector="00011" ELSE
		I4 WHEN Selector="00100" ELSE
		I5 WHEN Selector="00101" ELSE
		I6 WHEN Selector="00110" ELSE
		I7 WHEN Selector="00111" ELSE
		I8 WHEN Selector="01000" ELSE
		I9 WHEN Selector="01001" ELSE
		I10 WHEN Selector="01010" ELSE
		I11 WHEN Selector="01011" ELSE
		I12 WHEN Selector="01100" ELSE
		I13 WHEN Selector="01101" ELSE
		I14 WHEN Selector="01110" ELSE
		I15 WHEN Selector="01111" ELSE
		I16 WHEN Selector="10000" ELSE
		I17 WHEN Selector="10001" ELSE
		I18 WHEN Selector="10010" ELSE
		I19 WHEN Selector="10011" ELSE
		I20 WHEN Selector="10100" ELSE
		I21 WHEN Selector="10101" ELSE
		I22 WHEN Selector="10110" ELSE
		I23 WHEN Selector="10111" ELSE
		I24 WHEN Selector="11000" ELSE
		I25 WHEN Selector="11001" ELSE
		I26 WHEN Selector="11010" ELSE
		I27 WHEN Selector="11011" ELSE
		I28 WHEN Selector="11100" ELSE
		I29 WHEN Selector="11101" ELSE
		I30 WHEN Selector="11110" ELSE
		I31 WHEN Selector="11111" ELSE
		"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

end Behavioral;