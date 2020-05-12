library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Displays4Decoder is
    Port ( CLK: in BIT;
			  A : in  BIT_VECTOR (3 downto 0);
           B : in  BIT_VECTOR (3 downto 0);
           C : in  BIT_VECTOR (3 downto 0);
           D : in  BIT_VECTOR (3 downto 0);
           DEC :in  BIT_VECTOR (3 downto 0);
           Dis0 :out  BIT_VECTOR (6 downto 0);
			  Dis1:out  BIT_VECTOR (6 downto 0);
			  Dis2:out  BIT_VECTOR (6 downto 0);
			  Dis3:out  BIT_VECTOR (6 downto 0));
end Displays4Decoder;

architecture Behavioral of Displays4Decoder is
Component  Contador2bits
port(
			  CLK : in  bit;
			  Sn: in bit;
			  Rn:	in bit;
			  Q : out bit_vector(1 downto 0);
           Qn : out bit_vector(1 downto 0));


end component;
component Decoder
port(
			A : in  bit;
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
			DecOut: out bit);
end component;

signal Qout: bit_vector (1 downto 0);
signal Qnout: bit_vector (1 downto 0);
Signal S : bit_vector (3 downto 0);
signal DECIN: bit ;
signal SA,SB,SC, SD, SE, SF, SG: bit;
Signal Decout: bit;
begin

	C0: Contador2Bits port map (CLK,'1','1',Qout,Qnout);
	D0: Decoder port map (S(0),S(1),S(2), S(3),'1',DECIN,SA,SB,SC,SD,SE,SF,SG,DECOUT);

process (Qout)

	begin
	if Qout(0)='0' and Qout(1)='0' then
	DECIN<=DEC(0);
	S(0)<=A(0);
	S(1)<=A(1);
	S(2)<=A(2);
	S(3)<=A(3);
	
	
	elsif Qout(0)='1' and Qout(1)='0' then
	
	S(0)<=B(0);
	S(1)<=B(1);
	S(2)<=B(2);
	S(3)<=B(3);
	DECIN<=DEC(1);
	
	elsif Qout(0)='0' and Qout(1)='1' then
	S(0)<=C(0);
	S(1)<=C(1);
	S(2)<=C(2);
	S(3)<=C(3);
	DECIN<=DEC(2);
	
	elsif Qout(0)='1' and Qout(1)='1' then
	S(0)<=D(0);
	S(1)<=D(1);
	S(2)<=D(2);
	S(3)<=D(3);
	DECIN<=DEC(3);
	end if;
end process;
	
process(Qout)

	begin
	if Qout(0)='0' and Qout(1)='0' then
	
	Dis0(0)<=SA;
	Dis0(1)<=SB;
	Dis0(2)<=SC;
	Dis0(3)<=SD;
	Dis0(4)<=SE;
	Dis0(5)<=SF;
	Dis0(6)<=SG;
	
	DIS1<="0000000";
	DIS2<="0000000";
	DIS3<="0000000";

	
	
	elsif Qout(0)='1' and Qout(0)='0' then
	
	Dis1(0)<=SA;
	Dis1(1)<=SB;
	Dis1(2)<=SC;
	Dis1(3)<=SD;
	Dis1(4)<=SE;
	Dis1(5)<=SF;
	Dis1(6)<=SG;

	DIS0<="0000000";
	DIS2<="0000000";
	DIS3<="0000000";
	

	
	elsif Qout(0)='0' and Qout(1)='1' then
	
	Dis2(0)<=SA;
	Dis2(1)<=SB;
	Dis2(2)<=SC;
	Dis2(3)<=SD;
	Dis2(4)<=SE;
	Dis2(5)<=SF;
	Dis2(6)<=SG;

	DIS0<="0000000";
	DIS1<="0000000";
	DIS3<="0000000";
	
	
	
	elsif Qout(0)='1' and Qout(0)='1' then
	
	Dis3(0)<=SA;
	Dis3(1)<=SB;
	Dis3(2)<=SC;
	Dis3(3)<=SD;
	Dis3(4)<=SE;
	Dis3(5)<=SF;
	Dis3(6)<=SG;
	
	DIS0<="0000000";
	DIS1<="0000000";
	DIS2<="0000000";

	end if;
end process;

end Behavioral;