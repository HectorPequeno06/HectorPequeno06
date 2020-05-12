entity Contador2bits is
    Port ( CLK : in  bit;
			  Sn: in bit;
			  Rn:	in bit;
			  Q : out bit_vector(1 downto 0);
           Qn : out bit_vector(1 downto 0));
end Contador2bits;

architecture Behavioral of Contador2bits is

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

signal Q0,Q1: bit;

begin

	
	Q(0)<=Q0;
	Q(1)<=Q1;

	FF0: FFJK port map ('1','1',CLK,SN,RN,'1',Q0,QN(0));
	FF1: FFJK port map (Q0,Q0,CLK,SN,RN,'1',Q1,QN(1));
	
	
	
end Behavioral;