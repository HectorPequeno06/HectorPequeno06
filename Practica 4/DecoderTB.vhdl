LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DECODERTB IS
END DECODERTB;
 
ARCHITECTURE behavior OF DECODERTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         A : IN  bit;
         B : IN  bit;
         C : IN  bit;
         D : IN  bit;
         EN : IN  bit;
         DEC : IN  bit;
         SA : OUT  bit;
         SB : OUT  bit;
         SC : OUT  bit;
         SD : OUT  bit;
         SE : OUT  bit;
         SF : OUT  bit;
         SG : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal A : bit := '0';
   signal B : bit := '0';
   signal C : bit := '0';
   signal D : bit := '0';
   signal EN : bit := '0';
   signal DEC : bit := '0';

 	--Outputs
   signal SA : bit;
   signal SB : bit;
   signal SC : bit;
   signal SD : bit;
   signal SE : bit;
   signal SF : bit;
   signal SG : bit;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          EN => EN,
          DEC => DEC,
          SA => SA,
          SB => SB,
          SC => SC,
          SD => SD,
          SE => SE,
          SF => SF,
          SG => SG
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
    A<='0';
	 B<='0';
	 C<='0';
    D<='0';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
		
	 A<='1';
	 B<='0';
	 C<='0';
    D<='0';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
	 A<='0';
	 B<='1';
	 C<='0';
    D<='0';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
	 A<='1';
	 B<='1';
	 C<='0';
    D<='0';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
	 A<='0';
	 B<='0';
	 C<='1';
    D<='0';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
	 A<='1';
	 B<='0';
	 C<='1';
    D<='0';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
	 A<='0';
	 B<='1';
	 C<='1';
    D<='0';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
	 A<='1';
	 B<='1';
	 C<='1';
    D<='0';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
	 A<='0';
	 B<='0';
	 C<='0';
    D<='1';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;
	 A<='1';
	 B<='0';
	 C<='0';
    D<='1';
	 EN<='1';
	 DEC<='0';
      wait for 20 ns;

   end process;

END;
