----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:05:35 03/28/2020 
-- Design Name: 
-- Module Name:    Mux_4_1 - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_4_1 is
    Port ( A : in  bit;
           B : in  bit;
           C : in  bit;
           D : in  bit;
           SEL : in  bit;
			  SEL2: in bit; 
           F : out  bit);
end Mux_4_1;

architecture Behavioral of Mux_4_1 is

begin
    
F<=(A and sel and not sel2) or (B and not sel2 and sel) or (C and sel2 and not sel) or (D and sel2 and not sel);

end Behavioral;

