library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RippleAdder is
		port ( 
            A:      in  std_logic_vector (3 downto 0);
            B:      in  std_logic_vector (3 downto 0);
            Cin:    in  std_logic;
            S:      out std_logic_vector (3 downto 0);
            Cout:   out std_logic
        );
end RippleAdder;

architecture Behavioral of RippleAdder is
 
	component full_adder
		Port (
			A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin : in STD_LOGIC;
			S : out STD_LOGIC;
			Cout : out STD_LOGIC);
	end component;
 
	signal c1,c2,c3: STD_LOGIC;
 
	begin

		FA1: full_adder port map( A(0), B(0), Cin, S(0), c1);
		FA2: full_adder port map( A(1), B(1), c1, S(1), c2);
		FA3: full_adder port map( A(2), B(2), c2, S(2), c3);
		FA4: full_adder port map( A(3), B(3), c3, S(3), Cout);
		
end Behavioral;