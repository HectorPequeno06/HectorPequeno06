library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFJK is
    Port ( 
			  RN: in bit;
		     Sn: in bit;
			  J : in bit;
           K : in bit;
           CLK: in bit;
			  EN: in bit;
           Q : out bit;
           Qn : out bit);
end FFJK;

architecture Behavioral of FFJK is

signal Qint: bit;

begin

	Q<=Qint;
	Qn<=not Qint;
	
	process(CLK,SN)
		begin
			 if EN<='1' then
			 if RN='0' then Qint<='0';
			 elsif SN='0' then Qint<= '1';
			 elsif CLK'event and CLK = '0' then
				Qint <= (J and not Qint) or (not K and Qint);
				end if;
			 end if;
			end process;
			
end Behavioral;
