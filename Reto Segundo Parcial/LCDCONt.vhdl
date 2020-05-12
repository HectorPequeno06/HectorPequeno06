library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
library std;
use std.textio.all;
use IEEE.numeric_bit.all;

ENTITY LCDCONt IS
END LCDCONt;
 
ARCHITECTURE behavior OF LCDCONt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Controller
    PORT(
         CLK : IN  BIT;
         RESET : IN  BIT;
         RS : IN  BIT;
         RW : IN  BIT;
         DI : IN  BIT_vector(7 downto 0);
         RSO : OUT  BIT;
         RWO : OUT  BIT;
         EN : OUT  BIT;
         DATA : OUT  BIT_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : BIT := '0';
   signal RESET : BIT := '1';
   signal RS : BIT := '0';
   signal RW : BIT := '0';
   signal DI : BIT_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal RSO : BIT;
   signal RWO : BIT;
   signal EN : BIT;
   signal DATA : BIT_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Controller PORT MAP (CLK,RESET,RS,RW,DI,RSO,RWO,EN,DATA);

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
      file fin : TEXT open Read_MODE is "input_test.txt";
      variable Ctext: line;
      variable RWR, RSR, RESR: BIT;
      variable DataR: bit_vector(7 downto 0);
    
    
    begin
      
    wait for 45 ns;   
      
      while not endfile(fin) loop
        readline(fin, ctext);
        read(ctext, RSR);
        read(ctext, RWR);
        read(ctext, DataR);
        read(ctext, ResR);
        
        Rs <= RSR;
        Rw <= Rwr;
        DI <= DataR;
        Reset <= Resr;
      wait for 0 ns;
      
     
    end loop;

    end process;
  
END;

