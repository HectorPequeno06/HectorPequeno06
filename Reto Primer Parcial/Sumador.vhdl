----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:05 03/30/2020 
-- Design Name: 
-- Module Name:    FULLADDER - Behavioral 
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

entity FULLADDER is
    Port ( A : in  bit;
           B : in bit;
           Cin : in bit;
           S : out bit;
           C : out bit);
end FULLADDER;

architecture Behavioral of FULLADDER is

begin

S<= (Cin XOR (A Xor B));
C<=(A AND B) OR (Cin and(A xor B));

end Behavioral;