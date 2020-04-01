--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:37:38 03/29/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/Practica3/ContadorMod10TB.vhd
-- Project Name:  Practica3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ContadorMod10
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
 
ENTITY ContadorMod10TB IS
END ContadorMod10TB;
 
ARCHITECTURE behavior OF ContadorMod10TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ContadorMod10
    PORT(
         ENA : IN bit;
         UPDW : IN  bit;
         CLK : IN  bit;
         TC : OUT  bit;
         Q : OUT  bit_vector(3 downto 0);
         Qn : OUT  bit_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ENA : bit := '0';
   signal UPDW : bit := '0';
   signal CLK : bit := '0';

 	--Outputs
   signal TC : bit;
   signal Q : bit_vector(3 downto 0);
   signal Qn : bit_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ContadorMod10 PORT MAP (
          ENA => ENA,
          UPDW => UPDW,
          CLK => CLK,
          TC => TC,
          Q => Q,
          Qn => Qn
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
	
		Ena<='0';
		UPDW<='0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Ena<='1';
		UPDW<='0';
      wait for CLK_period*25;
		Ena<='1';
		UPDW<='1';
      wait for CLK_period*30;
		Ena<='0';
		UPDW<='1';


      -- insert stimulus here 

      wait;
   end process;

END;