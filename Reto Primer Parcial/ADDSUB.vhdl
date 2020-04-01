----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:40:36 03/30/2020 
-- Design Name: 
-- Module Name:    Sumador8Bits - Behavioral 
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

ENTITY addsub IS
   PORT (
      A : IN BIT_VECTOR(7 DOWNTO 0);
      B : IN BIT_VECTOR(7 DOWNTO 0); 
      T : IN BIT;
      C_FLAG : OUT BIT;
      OV_FLAG : OUT BIT;
      R : OUT BIT_VECTOR(7 DOWNTO 0)
   );
END ENTITY;

architecture Behavioral of addsub is
component FULLADDER
port(
			  A : in  bit;
           B : in bit;
           Cin : in bit;
           S : out bit;
           C : out bit);
end component;
Signal Bor: bit_vector(7 downto 0);
Signal Cv: bit_vector(7 downto 0);

signal Rint: bit;

begin

Bor(0)<=(T XOR B(0));
Bor(1)<=(T XOR B(1));
Bor(2)<=(T XOR B(2));
Bor(3)<=(T XOR B(3));
Bor(4)<=(T XOR B(4));
Bor(5)<=(T XOR B(5));
Bor(6)<=(T XOR B(6));
Bor(7)<=(T XOR B(7));

F0: FULLADDER port map(A(0),Bor(0),T,R(0),CV(0));
F1: FULLADDER port map(A(1),Bor(1),CV(0),R(1),CV(1));
F2: FULLADDER port map(A(2),Bor(2),CV(1),R(2),CV(2));
F3: FULLADDER port map(A(3),Bor(3),CV(2),R(3),CV(3));
F4: FULLADDER port map(A(4),Bor(4),CV(3),R(4),CV(4));
F5: FULLADDER port map(A(5),Bor(5),CV(4),R(5),CV(5));
F6: FULLADDER port map(A(6),Bor(6),CV(5),R(6),CV(6));
F7: FULLADDER port map(A(7),Bor(7),CV(6),R(7),CV(7));

C_Flag<=CV(7);
OV_Flag<=(CV(6) XOR CV(7));

end Behavioral;
