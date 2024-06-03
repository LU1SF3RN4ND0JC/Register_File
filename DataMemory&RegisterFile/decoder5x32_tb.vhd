library ieee;
use ieee.std_logic_1164.all;

entity decoder5x32_tb is 
end decoder5x32_tb;

architecture dec_archtb of decoder5x32_tb is
    component decoder5x32
        port(
            inp : in  STD_LOGIC_VECTOR (4 downto 0);
            outp : out  STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;
    signal t_i: STD_LOGIC_VECTOR (4 downto 0);
    signal t_o: STD_LOGIC_VECTOR (31 downto 0);

    begin
        uut: decoder5x32 port map(inp=>t_i, outp=>t_o);

    process
    begin 
        t_i <= "00000";
        wait for 200 ns;
        t_i <= "01000";
        wait for 200 ns;
        t_i <= "01100";
        wait for 200 ns;
        t_i <= "10010";
        wait for 200 ns;
        t_i <= "11111";
        wait for 200 ns;
    end process;

end dec_archtb;