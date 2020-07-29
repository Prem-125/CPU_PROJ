LIBRARY ieee; USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
ENTITY part1_board IS
PORT ( 
Resetn,k1, k0,CLOCK_50, Run : IN STD_LOGIC;
Done : BUFFER STD_LOGIC;
BusWires : BUFFER STD_LOGIC_VECTOR(8 DOWNTO 0));
END part1_board;
ARCHITECTURE Behavior OF part1_board IS
--. . . declare components
COMPONENT part1
PORT ( DIN : IN STD_LOGIC_VECTOR(8 downto 0);
Resetn, k0,CLOCK_50, Run : IN STD_LOGIC;
Done : BUFFER STD_LOGIC;
BusWires : BUFFER STD_LOGIC_VECTOR(8 DOWNTO 0));
END Component;

component counter
Port ( clk: in std_logic; 
           reset: in std_logic; 
           counter: out std_logic_vector(4 downto 0)
     );
end component;

component rom
PORT
	(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (8 DOWNTO 0)
	);
end component;

COMPONENT debounce
PORT( clk : IN STD_LOGIC;
		button: IN STD_LOGIC;
		result: OUT STD_LOGIC);
END COMPONENT;

signal cntr: std_logic_vector (4 downto 0);
signal dat: std_logic_vector (8 downto 0);
signal mclock: std_logic;
--. . .
BEGIN
u0: DEBOUNCE PORT MAP( CLOCK_50,K0,mCLOCk);
c1: counter port map (mclock,resetn,cntr);
r0: rom port map (cntr,mclock,dat); 
U1: part1 port map (dat,resetn,k1,CLOCK_50,run,done,buswires);



END Behavior;