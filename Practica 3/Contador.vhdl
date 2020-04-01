----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:09 03/29/2020 
-- Design Name: 
-- Module Name:    Sumador4bits - Behavioral 
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

entity Sumador4bits is
    Port ( CLK : in  bit;
			  Sn: in bit;
			  Rn:	in bit;
			  Q : out bit_vector(3 downto 0);
           Qn : out bit_vector(3 downto 0));
end Sumador4bits;

architecture Behavioral of Sumador4bits is

component FFJK 
port(		
			
			  J : in bit;
           K : in bit;
           CLK: in bit;
			  Sn: in bit;
			  RN: in bit;
			  EN: in bit;
           Q : out bit;
           Qn : out bit

);
end component;

signal Q0,Q1,Q2,F2, F3: bit;

begin

	F2<=Q0 and Q1;
	F3<=Q0 and Q1 and Q2;
	
	Q(0)<=Q0;
	Q(1)<=Q1;
	Q(2)<=Q2;
	
	FF0: FFJK port map ('1','1',CLK,SN,RN,EN,Q0,QN(0));
	FF1: FFJK port map (Q0,Q0,CLK,SN,RN,EN,Q1,QN(1));
	FF2: FFJK port map (F2,F2,CLK,SN,RN,EN,Q2,QN(2));
	FF3: FFJK port map (F3,F3,CLK,SN,RN,EN,Q(3),QN(3));
	
	
	
end Behavioral;
