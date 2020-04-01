-- Company: 
-- Engineer:
--
-- Create Date:   22:59:42 03/29/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/Practica3/MOD100TB.vhd
-- Project Name:  Practica3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ContMod100
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
 
ENTITY MOD100TB IS
END MOD100TB;
 
ARCHITECTURE behavior OF MOD100TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ContMod100
    PORT(
         CLK : IN  bit;
         UPDW : IN  bit;
         QA : OUT  bit_vector(3 downto 0);
         QB : OUT  bit_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : bit := '0';
   signal UPDW : bit := '0';

 	--Outputs
   signal QA : bit_vector(3 downto 0);
   signal QB : bit_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ContMod100 PORT MAP (
          CLK => CLK,
          UPDW => UPDW,
          QA => QA,
          QB => QB
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		UPDW<='0';
      wait for 100 ns;	
		UPDW<='1';
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
