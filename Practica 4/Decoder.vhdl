library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port ( A : in  bit;
           B : in  bit;
           C : in  bit;
           D : in  bit;
           EN : in  bit;
           DEC : in  bit;
           SA : out  bit;
           SB : out  bit;
           SC : out  bit;
           SD : out  bit;
           SE : out  bit;
           SF : out  bit;
           SG : out  bit;
			  DecOut: out bit
			  );
end Decoder;

architecture Behavioral of Decoder is

begin

	process(A,B,C,D,EN,DEC)
		begin
			IF (EN='1') then
				SA<=((B AND D) OR ((NOT B) AND (NOT D)) OR A OR C );
				SB<=((C AND D) OR (NOT B) OR ((NOT C) AND (NOT D))) ;
				SC<=(B OR (NOT C) OR D);
				SD<=(A OR ((NOT B) AND (NOT D)) OR ((NOT D) AND C)OR ((NOT B)AND C)OR (D AND (B AND (NOT C))));
				SE<=((C AND (NOT D))OR ((NOT B) AND (NOT D)));
				SF<= (((NOT D) AND (NOT C))OR(B AND (NOT D))OR (B AND (NOT C))OR A);
				SG<= ( ( (NOT D)AND C)OR(B AND (NOT C)) OR A OR ((NOT B) AND C ) );
				decout<=dec;
				ELSIF EN='0' then
				SA<='0';
				SB<='0';
				SC<='0';
				SD<='0';
				SE<='0';
				SF<='0';
				SG<='0';
				decout<='0';
			END IF;
	end process;
end Behavioral;
