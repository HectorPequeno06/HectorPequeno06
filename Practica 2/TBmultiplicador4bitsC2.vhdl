
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Multiplicador4bc2TB IS
END Multiplicador4bc2TB;
 
ARCHITECTURE behavior OF Multiplicador4bc2TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplicador4bc2
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         res : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x :std_logic_vector(3 downto 0) := (others => '0');
   signal y :std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic_vector(7 downto 0);
  
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplicador4bc2 PORT MAP (
          x => x,
          y => y,
          res => res
        );
 
   -- Stimulus process
   stim_proc: process
   begin	
      -- hold reset state for 100 ns.
		
      -- insert stimulus here 

		x<="1111";
		y<="1111";
		wait for 20ns;
		x<="1000";
		y<="1000";
		wait for 20ns;
		x<="0111";
		y<="0111";
		wait for 20ns;
		x<="0000";
		y<="0000";
		wait for 20ns;
		
		wait for 100 ns;	
      
      wait;
   end process;

END;
