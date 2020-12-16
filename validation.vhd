library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity validation is
port (H50,reset, shiftin: in std_logic;
      q: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
end validation;
architecture arch_validation of validation is

component shiftreg
	PORT
	(
		clock		: IN STD_LOGIC ;
		shiftin		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;
component diviseur 
port (H50,reset: in std_logic;clk:out std_logic);
end component;
signal clk_clt: std_logic;

attribute chip_pin 			   : string;
attribute chip_pin of q	   : signal is "U18,Y18,V19,T18,Y19,U19,R19,R20";
attribute chip_pin of reset	: signal is "L22";--SW0
attribute chip_pin of shiftin	   : signal is "L21";--SW1
attribute chip_pin of H50	   : signal is "L1";--50MHz
begin
d: diviseur port map (H50, reset, clk_clt);
s: shiftreg port map (clk_clt, shiftin,q);
end architecture;