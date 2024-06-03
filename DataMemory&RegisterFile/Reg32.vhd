library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg32 is

    Port ( I : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK,LOD,INC,CLR : in  STD_LOGIC;  --INC LOD = 0
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end Reg32;

architecture arch_reg of Reg32 is
SIGNAL r_next,r_reg: STD_LOGIC_VECTOR (31 DOWNTO 0) := (others => '0');
begin 
	--            register
		process(clk, CLR)
		begin
			if(CLR='1') then --no se usara
				r_reg <= (others=>'0');
			elsif(clk'event and clk='1') then
				r_reg<=r_next;
			end if;
		end process;
	--            next-state logic
	with LOD select
		r_next<=I when '1',
				r_reg when others;
	--            output logic
		O<=r_reg;

end arch_reg;