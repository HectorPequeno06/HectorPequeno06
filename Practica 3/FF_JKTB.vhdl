--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:26:50 03/29/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/Practica3/FFJKTB.vhd
-- Project Name:  Practica3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FFJK
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
 
ENTITY FFJKTB IS
END FFJKTB;
 
ARCHITECTURE behavior OF FFJKTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FFJK
    PORT(
         RN : IN  BIT;
         Sn : IN  BIT;
         J : IN  BIT;
         K : IN  BIT;
         CLK : IN  BIT;
			EN: IN BIT;
         Q : OUT  BIT;
         Qn : OUT  BIT
        );
    END COMPONENT;
    

   --Inputs
   signal RN : BIT := '0';
   signal Sn : BIT:= '0';
   signal J : BIT := '0';
   signal K : BIT := '0';
   signal CLK : BIT := '0';
	signal EN: BIT:='0';
 	--Outputs
   signal Q : BIT;
   signal Qn : BIT;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FFJK PORT MAP (
          RN => RN,
          Sn => Sn,
          J => J,
          K => K,
          CLK => CLK,
			 EN => EN,
          Q => Q,
          Qn => Qn
        );

   -- Stimulus process
   stim_proc: process
   begin		
      	
		-- insert stimulus here 
		EN<='0';
		RN<='0';
		SN<='0';
		J<='0';
		K<='0';
		CLK<='0';
		wait for 20ns;
		EN<='1';
		RN<='1';
		SN<='1';
		J<='1';
		K<='1';
		CLK<='1';
		wait for 20ns;
		EN<='1';
		RN<='1';
		SN<='1';
		J<='1';
		K<='1';
		CLK<='0';
		wait for 20ns;
		EN<='1';
		RN<='1';
		SN<='1';
		J<='0';
		K<='1';
		CLK<='1';
		wait for 20ns;
		EN<='1';
		RN<='1';
		SN<='1';
		J<='1';
		K<='1';
		CLK<='0';
		wait for 20ns;
		EN<='1';
		RN<='1';
		SN<='1';
		J<='1';
		K<='0';
		CLK<='1';
		wait for 20ns;
		EN<='1';
		RN<='1';
		SN<='1';
		J<='1';
		K<='1';
		CLK<='0';
		wait for 20ns;
		EN<='1';
		RN<='1';
		SN<='1';
		J<='0';
		K<='0';
		CLK<='1';
		wait for 20ns;
		EN<='1';
		RN<='1';
		SN<='1';
		J<='0';
		K<='0';
		CLK<='0';
		wait for 20ns;
		
		
		
      wait;
   end process;

END;