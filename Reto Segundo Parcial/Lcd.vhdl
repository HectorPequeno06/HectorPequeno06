library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
library std;
use std.textio.all;
use IEEE.numeric_bit.all;

entity Controller is
    Port ( CLK : in  BIT;
           RESET : in BIT;
           RS : in  BIT;
           RW : in  BIT;
           DI : in  BIT_VECTOR (7 downto 0);
           RSO : out  BIT;
           RWO : out  BIT;
           EN : out  BIT;
           DATA : out  BIT_VECTOR (7 downto 0));
end Controller;

architecture Behavioral of Controller is
signal State : integer range 0 to 4:=0;
begin

--Cambio De Estados
process(Clk)
            begin 
               if Clk'event and Clk='0' then 
						if state < 4 then
							State<=State+1;
							elsif RESET='0' then 
							State<=0;
						end if;
					end if;
    end process;
--Operacines de estado
process(State, RS ,RW,DI)
--Declaracion del archivo
file fout: TEXT open write_Mode is "output_test.txt";
Variable ctext: line; --Variable para ejecutar texto
	begin
		EN<=CLK;
	case State is
		
		when 0=>
			
			RWO<='0';
			RSO<='0';
			DATA<= x"38";
			write(ctext,string'("instr(0x38);"));
			writeline(fout, ctext);
		
		when 1=>
		
			RWO<='0';
			RSO<='0';
			DATA<= x"0F";
			write(ctext,string'("instr(0x0F);"));
			writeline(fout, ctext);
			
		when 2=>
		
			RWO<='0';
			RSO<='0';
			DATA<= x"01";
			write(ctext,string'("instr(0x01);"));
			writeline(fout, ctext);
			
		when 3=>
		
			RWO<='0';
			RSO<='0';
			DATA<= x"06";
			write(ctext,string'("instr(0x06);"));
			writeline(fout, ctext);
			
		when 4=>
		
			RWO<=RW;
			RSO<=RS;
			DATA<=DI;
			if RS='0' then
				write(ctext,string'("instr("));
				
			else
				write(ctext,string'("data("));
			
			end if;
			write(ctext,to_integer(Unsigned(DI)));
			write(ctext,string'(");"));	
			writeline(fout, ctext);
		end Case;
		
	end process;
	
end Behavioral;
