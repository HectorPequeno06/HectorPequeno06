LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Displays4DecoderTB IS
END Displays4DecoderTB;
 
ARCHITECTURE behavior OF Displays4DecoderTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Displays4Decoder
    PORT(
         CLK : IN  BIT;
         A : IN  BIT_vector(3 downto 0);
         B : IN  BIT_vector(3 downto 0);
         C : IN  BIT_vector(3 downto 0);
         D : IN  BIT_vector(3 downto 0);
         DEC : IN  BIT_vector(3 downto 0);
         Dis0 : OUT  BIT_vector(6 downto 0);
			 Dis1 : OUT  BIT_vector(6 downto 0);
			  Dis2 : OUT  BIT_vector(6 downto 0);
			 Dis3 : OUT  BIT_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : bit := '0';
   signal A : bit_vector(3 downto 0) := (others => '0');
   signal B : bit_vector(3 downto 0) := (others => '0');
   signal C : bit_vector(3 downto 0) := (others => '0');
   signal D : bit_vector(3 downto 0) := (others => '0');
   signal DEC : bit_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Dis0: bit_vector(6 downto 0);
	signal Dis1: BIT_vector(6 downto 0);
	signal Dis2: BIT_vector(6 downto 0);
	signal Dis3: BIT_vector(6 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Displays4Decoder PORT MAP (
          CLK => CLK,
          A => A,
          B => B,
          C => C,
          D => D,
          DEC => DEC,
          Dis0 => Dis0,
			 Dis1 => Dis1, 
			 Dis2 => Dis2,
			 Dis3 => Dis3
			 
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
      
			 A <="0001";
         
          B <="0010" ;        
    		
          C <="0011" ;         
   
          D <= "0100";
			
          DEC<= "1000";
  
      wait;
   end process;

END;