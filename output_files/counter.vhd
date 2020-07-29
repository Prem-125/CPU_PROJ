library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
  
entity COUNTER is
    Port ( clk: in std_logic; 
           reset: in std_logic; 
           counter: out std_logic_vector(4 downto 0)
     );
end COUNTER;

architecture Behavior of COUNTER is
signal counter_up: std_logic_vector(4 downto 0);
begin
process(clk,reset)
begin
if(rising_edge(clk)) then
    if(reset='0') then
         counter_up <= "00000";
    else
        counter_up <= counter_up + "00001";
    end if;
 end if;
end process;
 counter <= counter_up;

end Behavior;