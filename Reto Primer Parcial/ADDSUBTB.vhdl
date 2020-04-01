--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:38:02 03/30/2020
-- Design Name:   
-- Module Name:   C:/PROJECTS/XILINX/ADDSUB/ADDSUBTB.vhd
-- Project Name:  ADDSUB
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addsub
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
 
ENTITY ADDSUBTB IS
END ADDSUBTB;
 
ARCHITECTURE behavior OF ADDSUBTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addsub
    PORT(
         A : IN  BIT_vector(7 downto 0);
         B : IN  BIT_vector(7 downto 0);
         T : IN  BIT;
         C_FLAG : OUT  BIT;
         OV_FLAG : OUT  BIT;
         R : OUT  BIT_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : BIT_vector(7 downto 0) := (others => '0');
   signal B : BIT_vector(7 downto 0) := (others => '0');
   signal T : BIT := '0';

 	--Outputs
   signal C_FLAG : BIT;
   signal OV_FLAG : BIT;
   signal R : BIT_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addsub PORT MAP (
          A => A,
          B => B,
          T => T,
          C_FLAG => C_FLAG,
          OV_FLAG => OV_FLAG,
          R => R
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      
		-- 2 casos de suma de números positivos
		A<="00000001";
		B<="00000010";
		T<='0';
		wait for 20 ns;
		A<="00000011";
		B<="00000100";
		T<='0';
		wait for 20 ns;
		-- 2 casos de suma de número positivo y número negativo
		A<="00000010";
		B<="10000001";
		T<='0';
		wait for 20 ns;
		A<="00000110";
		B<="11000000";
		T<='0';
		wait for 20 ns;
		-- 2 casos de suma de número negativo y número positivo
		A<="11000000";
		B<="00000101";
		T<='0';
		wait for 20 ns;
		A<="10110000";
		B<="00101100";
		T<='0';
		wait for 20 ns;
		-- 2 casos de overflow suma
		A<="01111111";
		B<="00000001";
		T<='0';
		wait for 20 ns;
		A<="01111111";
		B<="01111011";
		T<='0';
		wait for 20 ns;
		-- 2 casos de overflow resta
		A<="10111111";
		B<="01111111";
		T<='1';
		wait for 20 ns;
		A<="00111010";
		B<="10111010";
		T<='1';
		wait for 20 ns;
		-- 2 casos con carry out suma
		A<="11000110";
		B<="01111100";
		T<='0';
		wait for 20 ns;
		A<="10111111";
		B<="11111100";
		T<='0';
		wait for 20 ns;
		-- 2 casos con carry out resta
		A<="10000000";
		B<="10000000";
		T<='1';
		wait for 20 ns;
		A<="00100000";
		B<="00001001";
		T<='1';
		wait for 20 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
