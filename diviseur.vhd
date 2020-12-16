library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity diviseur is
port (H50,reset: in std_logic;clk:out std_logic);
end diviseur;
architecture arch_diviseur of diviseur is
signal q: std_logic_vector(25 downto 0);
begin
process(H50,reset)
begin
if(reset='1')then q<=(others=>'0');
elsif(H50'event and H50='1')then q<=q+1;
end if;
end process;
clk<= q(24);
end arch_diviseur;