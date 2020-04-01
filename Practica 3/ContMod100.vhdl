----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:42:23 03/29/2020 
-- Design Name: 
-- Module Name:    ContMod100 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ContMod100 is
    Port ( CLK : in bit;
           UPDW : in  bit;
           QA : out  bit_VECTOR (3 downto 0);
           QB : out  bit_VECTOR (3 downto 0));
end ContMod100;

architecture Behavioral of ContMod100 is
component ContadorMod10
port(
			  ENA : in  bit;
           UPDW : in  bit;
           CLK : in bit;
           TC : out bit;
           Q : out  bit_VECTOR (3 downto 0);
           Qn : out  bit_VECTOR (3 downto 0));
end component;

signal TCS:bit;	
signal x,z:bit_vector(3 downto 0);	
signal y: bit;	 
begin

CA:ContadorMod10 port map('1', UPDW, CLK, TCS,QA,x);
CB:ContadorMod10 port map(TCS,UPDW, CLK,y,Qb ,z);

end Behavioral;
