--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:42:10 03/29/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/Practica3/SumadorTB.vhd
-- Project Name:  Practica3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador4bits
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
 
    COMPONENT Sumador4bits
    PORT(
         CLK : IN  bit;
         Sn : IN  bit;
         Rn : IN  bit;
         Q : OUT  bit_vector(3 downto 0);
         Qn : OUT  bit_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : bit := '0';
   signal Sn : bit := '0';
   signal Rn : bit := '0';

 	--Outputs
   signal Q : bit_vector(3 downto 0);
   signal Qn : bit_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador4bits PORT MAP (
          CLK => CLK,
          Sn => Sn,
          Rn => Rn,
          Q => Q,
          Qn => Qn
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	
		RN <= '0';
		SN <= '1';
		CLK<='1';
      -- hold reset state for 100 ns.
      wait for 20 ns;
		
		RN <= '1';
		SN <= '0';
		CLK<='0';
		
		wait for 20 ns;
		
		SN <= '0';
		RN<='1';
		CLK<='1';
      wait for 20 ns;
		
		SN <= '0';
		RN<='1';
		CLK<='0';

      wait;
   end process;

END;