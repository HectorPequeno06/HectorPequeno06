library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RelojDigitalTB is
    end RelojDigitalTB;

architecture arch of RelojDigitalTB is
    component RelojDigital 
    port(
        CLK: in std_logic;
        setM: in std_logic;
        setH: in std_logic;
        SegM: out unsigned(5 downto 0);
        segH: out unsigned(3 downto 0);
        PM: out std_logic); 
    end component;

--Inputs
signal CLK: std_logic := '0';
signal setM: std_logic:= '1';
signal setH: std_logic:= '1';
--Outputs
signal SegM: unsigned(5 downto 0);
signal segH: unsigned(3 downto 0);
signal PM: std_logic;

begin

    uut: RelojDigital port map(
      
        CLK => CLK,
        setM => setM,
        setH => setH,
        SegM => SegM,
        segH => segH,
        PM => PM

    );

    Clock: process
    begin
        
        CLK<='1';
        wait for 1 ns;
        CLK<='0';
        wait for 1 ns;

     end process;

     --Stimulus Process
     stim_proc: process
     begin		
     PM<= '0';   
     wait for 5 ns;
     setM <= '0';
     SetH <= '0';
     wait for 200 ns;

     setM <= '1';
     SetH <= '1';

     wait for 20 ns;

          
  
     end process;

end arch ; 