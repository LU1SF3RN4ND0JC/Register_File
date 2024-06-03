library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterFile_tb is
end entity;

architecture arch_tb of RegisterFile_tb is
component RegisterFile is 
port(
    read_reg1 : in  STD_LOGIC_VECTOR (4 downto 0); --entrada de read register 1
    read_reg2 : in  STD_LOGIC_VECTOR (4 downto 0); --entrada de read register 2
    write_reg : in  STD_LOGIC_VECTOR (4 downto 0); --entrada de  register 1: dice donde guardaras el dato de write data
    reg_write : in  STD_LOGIC;                     -- la entrada que habilita o desabilita el write
    clk : in  STD_LOGIC;
    write_data : in  STD_LOGIC_VECTOR (31 downto 0); --vector de 32 bits de entrada que dice el valor a escribir en memoria
    read_data1 : out  STD_LOGIC_VECTOR (31 downto 0);  --salidas 1
    read_data2 : out  STD_LOGIC_VECTOR (31 downto 0) --salidas 2
);
end component;

signal tclk:std_logic:='0';
signal t_read_reg1, t_read_reg2, t_write_reg : STD_LOGIC_VECTOR (4 downto 0);
signal t_reg_write :STD_LOGIC;
signal t_write_data,t_read_data1, t_read_data2:STD_LOGIC_VECTOR (31 downto 0);
begin
u1: RegisterFile port map(read_reg1=>t_read_reg1, read_reg2=>t_read_reg2, write_reg=>t_write_reg, reg_write=>t_reg_write, clk=>tclk, write_data=>t_write_data,read_data1=>t_read_data1, read_data2=>t_read_data2);
    --signal tests
    tclk<= not tclk after 5 ns;
    process
    begin
    t_read_reg1 <= "00001";
    t_read_reg2 <= "00000";
    t_write_reg <= "00011";
    t_reg_write <= '1';
    t_write_data <= "10000000000000000000000000000000";
    wait for 33 ns;
    t_read_reg1 <= "00001";
    t_read_reg2 <= "00000";
    t_write_reg <= "00001";
    t_reg_write <= '1';
    t_write_data <= "11111111111111111111111110000000";
    wait for 33 ns;
    t_read_reg1 <= "00001";
    t_read_reg2 <= "00011";
    t_write_reg <= "00000";
    t_reg_write <= '0';
    t_write_data <= "00000000000000000000000000000000";
    wait for 33 ns;
    end process;
end arch_tb;