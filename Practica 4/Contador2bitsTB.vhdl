LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY contador2bitsTB IS
END contador2bitsTB;
 
ARCHITECTURE behavior OF contador2bitsTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Contador2bits
    PORT(
         CLK : IN  bit;
         Sn : IN  bit;
         Rn : IN  bit;
         Q : OUT  bit_vector(1 downto 0);
         Qn : OUT  bit_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : bit := '0';
   signal Sn : bit := '0';
   signal Rn : bit := '0';

 	--Outputs
   signal Q : bit_vector(1 downto 0);
   signal Qn : bit_vector(1 downto 0);

   -- Clock period definitions
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Contador2bits PORT MAP (
          CLK => CLK,
          Sn => Sn,
          Rn => Rn,
          Q => Q,
          Qn => Qn
        );

   -- Clock process definitions
  

   -- Stimulus process
   stim_proc: process
   begin		
    CLK<='0';
	 SN<='1';
	 RN<='0';
	wait FOR 20 NS;
	CLK<='1';
	 SN<='1';
	 RN<='1';

	WAIT FOR 20 NS;
  CLK<='0';
	 SN<='1';
	 RN<='1';

	wait FOR 20 NS;
	CLK<='1';
	SN<='1';
	RN<='1';

	WAIT FOR 20 NS;
	CLK<='0';
	SN<='1';
	RN<='1';

	wait FOR 20 NS;
	CLK<='1';
	SN<='1';
	RN<='1';

	WAIT FOR 20 NS;
   CLK<='0';
  	 SN<='1';
	 RN<='1';

	wait FOR 20 NS;
	CLK<='1';
	 SN<='1';
	 RN<='1';

	WAIT FOR 20 NS;
	  CLK<='0';
  	 SN<='1';
	 RN<='1';

	wait FOR 20 NS;
	CLK<='1';
	 SN<='1';
	 RN<='1';

	WAIT FOR 20 NS;
	
   end process;

END;
