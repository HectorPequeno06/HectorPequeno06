----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:30 03/29/2020 
-- Design Name: 
-- Module Name:    ContadorMod10 - Behavioral 
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

entity ContadorMod10 is
    Port ( ENA : in  bit;
           UPDW : in  bit;
           CLK : in bit;
           TC : out bit;
           Q : out  bit_VECTOR (3 downto 0);
           Qn : out  bit_VECTOR (3 downto 0));
end ContadorMod10;

architecture Behavioral of ContadorMod10 is
component FFJK 
port(		
			  RN: in bit;
			  Sn: in bit;
			  J : in bit;
           K : in bit;
           CLK: in bit;
			  EN: in bit;
           Q : out bit;
           Qn : out bit

);
end component;
signal Qsig: bit_vector(3 downto 0);
signal Qnsig: bit_vector(3 downto 0);
signal RstD, RstU : bit;
signal SFF1, SFF2, SFF3: bit;
signal Resa: bit;

begin

	F0: FFJK port map( RstD, RstU , '1' ,'1' ,CLK ,Ena,Qsig(0),Qnsig(0));
	F1: FFJK port map( '1',Resa,SFF1 ,SFF1 ,CLK,Ena,Qsig(1),Qnsig(1));
	F2: FFJK port map( '1',Resa,SFF2 ,SFF2 ,CLK,Ena,Qsig(2),Qnsig(2));
	F3: FFJK port map( RstD,RstU,SFF3 ,SFF3 ,CLK,Ena,Qsig(3) ,Qnsig(3));

	RstD<= NOT(Qsig(0)and Qsig(1) and Qsig(2) and Qsig(3) and UPDW);
	RstU<= NOT(Qnsig(0)and Qsig(1) and Qnsig(2) and Qsig(3) and (not UPDW));
	
	SFF1<=(not UPDW and Qsig(0)) or (Qnsig(0) and UPDW);
	SFF2<=(not UPDW and Qsig(0) and Qsig(1)) or (Qnsig(0) and Qnsig(1) and UPDW);
	SFF3<=((not UPDW) and Qsig(0) and Qsig(1) and Qsig(2)) or (Qnsig(0) and Qnsig(1) and Qnsig(2) and UPDW);
	
	Resa<= RstD and RstU;
	
	Q(0)<=Qsig(0);
	Q(1)<=Qsig(1);
	Q(2)<=Qsig(2);
	Q(3)<=Qsig(3);
	
	Qn(0)<=Qnsig(0);
	Qn(1)<=Qnsig(1);
	Qn(2)<=Qnsig(2);
	Qn(3)<=Qnsig(3);
	
	Tc<=(not UPDW AND SFF1 AND Qsig(3)) or ( UPDW AND Qnsig(0) AND Qnsig(1) AND Qnsig(2) AND Qnsig(3));
	
	
end Behavioral;
