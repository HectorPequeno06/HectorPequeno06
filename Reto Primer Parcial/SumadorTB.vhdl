--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:09:17 03/30/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/ADDSUB/SumadorTB.vhd
-- Project Name:  ADDSUB
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FULLADDER
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SumadorTB IS
END SumadorTB;
 
ARCHITECTURE behavior OF SumadorTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FULLADDER
    PORT(
         A : IN  bit;
         B : IN  bit;
         Cin : IN  bit;
         S : OUT  bit;
         C : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal A : bit := '0';
   signal B : bit := '0';
   signal Cin : bit := '0';

 	--Outputs
   signal S : bit;
   signal C : bit;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FULLADDER PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          C => C
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
	
	A<='0';
	B<='0';
	Cin<='0';
   wait for 20 ns;
	A<='1';
	B<='0';
	Cin<='0';
   wait for 20 ns;
	A<='0';
	B<='1';
	Cin<='0';
   wait for 20 ns;
	A<='1';
	B<='1';
	Cin<='0';
   wait for 20 ns;
	A<='0';
	B<='0';
	Cin<='1';
   wait for 20 ns;
	A<='1';
	B<='0';
	Cin<='1';
   wait for 20 ns;
	A<='0';
	B<='1';
	Cin<='1';
   wait for 20 ns;
	A<='1';
	B<='1';
	Cin<='1';
   wait for 20 ns;
	
   end process;

END;