library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DataMemory is
    Port (
           mem_write, mem_read : in  STD_LOGIC;                     
           clk : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (31 downto 0); 
           write_data : in  STD_LOGIC_VECTOR (31 downto 0); 
           read_data: out  STD_LOGIC_VECTOR (31 downto 0));  
end DataMemory;

architecture mem_arch of DataMemory is

	component decoder5x32 is 
port(
    inp : in  STD_LOGIC_VECTOR (4 downto 0);
    outp : out  STD_LOGIC_VECTOR (31 downto 0)
);
end component;

component Reg32 is 
port(
    I: IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
	CLK, LOD, INC, CLR: IN STD_LOGIC;
	O: OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
);
end component;

component mux5x32 is 
port(
    I0 : in  STD_LOGIC_VECTOR (31 downto 0);
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
           O : out  STD_LOGIC_VECTOR (31 downto 0)
);
end component;
	SIGNAL resD : STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL o0 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o1 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o2 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o3 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o4 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o5 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o6 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o7 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o8 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o9 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o10 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o11 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o12 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o13 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o14 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o15 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o16 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o17 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o18 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o19 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o20 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o21 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o22 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o23 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o24 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o25 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o26 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o27 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o28 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o29 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o30 :STD_LOGIC_vector (31 downto 0);
	SIGNAL o31 :STD_LOGIC_vector (31 downto 0);
    SIGNAL lod0, lod1, lod2, lod3, lod4, lod5, lod6, lod7 : STD_LOGIC; --señales intermedias para evitar error
    SIGNAL lod8, lod9, lod10, lod11, lod12, lod13, lod14, lod15 : STD_LOGIC;
    SIGNAL lod16, lod17, lod18, lod19, lod20, lod21, lod22, lod23 : STD_LOGIC;
    SIGNAL lod24, lod25, lod26, lod27, lod28, lod29, lod30, lod31 : STD_LOGIC;
	
begin
	u1:decoder5x32 port map(inp=> address(4 downto 0), outp=> resD); --mux 5x32


	lod0 <= resD(0) and mem_write; --operacion and
    lod1 <= resD(1) and mem_write;
    lod2 <= resD(2) and mem_write;
    lod3 <= resD(3) and mem_write;
    lod4 <= resD(4) and mem_write;
    lod5 <= resD(5) and mem_write;
    lod6 <= resD(6) and mem_write;
    lod7 <= resD(7) and mem_write;
    lod8 <= resD(8) and mem_write;
    lod9 <= resD(9) and mem_write;
    lod10 <= resD(10) and mem_write;
    lod11 <= resD(11) and mem_write;
    lod12 <= resD(12) and mem_write;
    lod13 <= resD(13) and mem_write;
    lod14 <= resD(14) and mem_write;
    lod15 <= resD(15) and mem_write;
    lod16 <= resD(16) and mem_write;
    lod17 <= resD(17) and mem_write;
    lod18 <= resD(18) and mem_write;
    lod19 <= resD(19) and mem_write;
    lod20 <= resD(20) and mem_write;
    lod21 <= resD(21) and mem_write;
    lod22 <= resD(22) and mem_write;
    lod23 <= resD(23) and mem_write;
    lod24 <= resD(24) and mem_write;
    lod25 <= resD(25) and mem_write;
    lod26 <= resD(26) and mem_write;
    lod27 <= resD(27) and mem_write;
    lod28 <= resD(28) and mem_write;
    lod29 <= resD(29) and mem_write;
    lod30 <= resD(30) and mem_write;
    lod31 <= resD(31) and mem_write;

--flipflops
	R0:  Reg32 PORT MAP(write_data,clk,lod0 ,'0','0',o0); --d,clk,lod,inc,clr,q
	R1:  Reg32 PORT MAP(write_data,clk,lod1,'0','0',o1);
	R2:  Reg32 PORT MAP(write_data,clk,lod2,'0','0',o2);
	R3:  Reg32 PORT MAP(write_data,clk,lod3,'0','0',o3);
	R4:  Reg32 PORT MAP(write_data,clk,lod4,'0','0',o4);
	R5:  Reg32 PORT MAP(write_data,clk,lod5,'0','0',o5);
	R6:  Reg32 PORT MAP(write_data,clk,lod6,'0','0',o6);
	R7:  Reg32 PORT MAP(write_data,clk,lod7,'0','0',o7);
	R8:  Reg32 PORT MAP(write_data,clk,lod8,'0','0',o8);
	R9:  Reg32 PORT MAP(write_data,clk,lod9,'0','0',o9);
	R10:  Reg32  PORT MAP(write_data,clk,lod10,'0','0',o10);
	
	R11:  Reg32 PORT MAP(write_data,clk,lod11,'0','0',o11);
	R12:  Reg32 PORT MAP(write_data,clk,lod12,'0','0',o12);
	R13:  Reg32 PORT MAP(write_data,clk,lod13,'0','0',o13);
	R14:  Reg32 PORT MAP(write_data,clk,lod14,'0','0',o14);
	R15:  Reg32 PORT MAP(write_data,clk,lod15,'0','0',o15);
	R16:  Reg32 PORT MAP(write_data,clk,lod16,'0','0',o16);
	R17:  Reg32 PORT MAP(write_data,clk,lod17,'0','0',o17);
	R18:  Reg32 PORT MAP(write_data,clk,lod18,'0','0',o18);
	R19:  Reg32 PORT MAP(write_data,clk,lod19,'0','0',o19);
	R20:  Reg32 PORT MAP(write_data,clk,lod20,'0','0',o20);
	
	R21:  Reg32 PORT MAP(write_data,clk,lod21,'0','0',o21);
	R22:  Reg32 PORT MAP(write_data,clk,lod22,'0','0',o22);
	R23:  Reg32 PORT MAP(write_data,clk,lod23,'0','0',o23);
	R24:  Reg32 PORT MAP(write_data,clk,lod24,'0','0',o24);
	R25:  Reg32 PORT MAP(write_data,clk,lod25,'0','0',o25);
	R26:  Reg32 PORT MAP(write_data,clk,lod26,'0','0',o26);
	R27:  Reg32 PORT MAP(write_data,clk,lod27,'0','0',o27);
	R28:  Reg32 PORT MAP(write_data,clk,lod28,'0','0',o28);											
	R29:  Reg32 PORT MAP(write_data,clk,lod29,'0','0',o29);
	R30:  Reg32 PORT MAP(write_data,clk,lod30,'0','0',o30);
	R31:  Reg32 PORT MAP(write_data,clk,lod31,'0','0',o31);
	
--mux 5x32
	mx0: mux5x32 PORT MAP(o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,
								o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31,address(4 downto 0),read_data);

end mem_arch;