--NOTA* Profe, realice los codigos de las primeras practicas en Xilinx.
------------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:52:38 03/29/2020 
-- Design Name: 
-- Module Name:    multiplicador4bc2 - Behavioral 
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

entity multiplicador_4bc2 is

    Port ( x : in std_logic_vector(3 downto 0);
           y : in std_logic_vector (3 downto 0);
           res : out std_logic_vector (7 downto 0));

end multiplicador_4bc2;

architecture Behavioral of multiplicador_4bc2 is

component RippleAdder

	port ( 
		A:      in  std_logic_vector(3 downto 0);
		B:      in  std_logic_vector(3 downto 0);
		Cin:    in  std_logic;
		Sum:    out std_logic_vector(3 downto 0);
		Cout:   out std_logic
	);

end component;

signal A0, A1, A2:  std_logic_vector (3 downto 0);
signal B0, B1, B2: std_logic_vector (3 downto 0);
signal halfAdder: std_logic;

begin

   A0 <= (x(3) nand y(1), x(3) nand y(0), x(2) and y(0), x(1) and y(0));
   A1 <= (x(3) nand y(2), x(2) and y(2), x(1) and y(2), x(0) and y(2));
   A2 <= (x(3) and y(3), x(2) nand y(3), x(1) nand y(3), x(0) nand y(3));
    
   B0 <=  ('1', x(2) and y(1), x(1) and y(1), x(0) and y(1));

	RippleAdder1: 

		RippleAdder 
			port map (
				a => A0,
				b => B0,
				cin => '0',
				cout => B1(3),
				Sum(3) => B1(2),
				Sum(2) => B1(1),
				Sum(1) => B1(0),
				Sum(0) => res(1)
	);

	RippleAdder2: 

		RippleAdder 
			port map (
				a => A1,
				b => B1,
				cin => '0',
				cout => B2(3),
				Sum(3) => B2(2),
				Sum(2) => B2(1),
				Sum(1) => B2(0),
				Sum(0) => res(2)
	);

	RippleAdder3: 

		RippleAdder 
			port map (
				a => A2,
				b => B2,
				cin => '0',
				cout => halfAdder,
				Sum => res(6 downto 3)

	);
	
	res(0) <= x(0) and y(0); 

	res(7) <= '1' xor halfAdder;

end Behavioral;
