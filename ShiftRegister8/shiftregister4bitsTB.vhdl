library IEEE;
use IEEE.std_logic_1164.all;

entity shiftregister4bitsTB is
end entity;

architecture behavioral of shiftregister4bitsTB is
    component shiftregister4bits
        port(

            CLK: in std_logic;
            CLR: in std_logic;
            SR: in std_logic;
            SL: in std_logic;
            ABCD: in std_logic_vector(3 downto 0);
            S1,S2: in std_logic;
            Q: out std_logic_vector(3 downto 0)

        );
    end component;

--Inputs
signal CLK: std_logic:='0';
signal CLR: std_logic:='0';
signal SR: std_logic:='0';
signal SL: std_logic:='0';
signal ABCD: std_logic_vector(3 downto 0):="0000";
signal S1,S2: std_logic:='0';
--outputs
signal Q: std_logic_vector(3 downto 0);

begin

    uut: shiftregister4bits port map(
            CLK=>CLK,
            CLR=>CLR,
            SR=>SR,
            SL=>SL,
            ABCD=>ABCD,
            S1=>S1,
            S2=>S2,
            Q=>Q
            );


    --CLOCK
    CLOCK: process
        begin
            CLK<='0';
            wait for 10 ns;
            CLK<='1';
            wait for 10 ns;
        end process;

    --STIMULUS PROCESS
    stim: process 
        begin

            CLR <= '1'; 
            SR <= '0';
            SL <= '0';
            ABCD <= "0000"; 
            S1 <='0';
            S2 <='0';
        
            wait for 20 ns;
            
            CLR <= '0'; 
            SR <= '1';
            SL <= '0';
            ABCD <= "1100"; 
            S1 <='1';
            S2 <='0';

            wait for 20 ns;
            
            CLR <= '0'; 
            SR <= '0';
            SL <= '1';
            ABCD <= "1100"; 
            S1 <='1';
            S2 <='0';
            wait for 20 ns;
            
            CLR <= '0'; 
            SR <= '1';
            SL <= '0';
            ABCD <= "1100"; 
            S1 <='0';
            S2 <='1';
            wait for 20 ns;
            
            CLR <= '0'; 
            SR <= '1';
            SL <= '0';
            ABCD <= "1100"; 
            S1 <='0';
            S2 <='1';

            wait for 20 ns;
            
            CLR <= '1'; 
            SR <= '1';
            SL <= '0';
            ABCD <= "1100"; 
            S1 <='1';
            S2 <='0';

            wait for 20 ns;

    end process;


end behavioral ; 