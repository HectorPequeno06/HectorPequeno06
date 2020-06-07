library IEEE;
use IEEE.std_logic_1164.all;

entity shiftregister8bitsTB is
    end entity;

architecture behavioral of shiftregister8bitsTB is
    component shiftregister8bits 
    port(

        CLK, CLR, SR, SL, S1, S2: in std_logic;
        ABCDEFGH: in std_logic_vector(7 downto 0);
        Q: out std_logic_vector (7 downto 0)

    );
end component;


--INPUT

signal CLK: std_logic:='0';
signal CLR: std_logic:='0';
signal  SR: std_logic:='0';
signal  SL: std_logic:='0';
signal  S1,S2: std_logic:='0';
signal  ABCDEFGH: std_logic_vector(7 downto 0):="00000000";

--OUTPUT

signal  Q: std_logic_vector(7 downto 0);

begin

    uut: shiftregister8bits port map(

    CLK=>CLK, 
    CLR=>CLR,
    SR=>SR,
    SL=>SL,
    S1=>S1,
    S2=>S2,
    ABCDEFGH=>ABCDEFGH,
    Q=>Q
    );


    --CLOCK
    clock: process 
        begin
            CLK <= '0';
            wait for 10 ns;
            CLK <= '1';
            WAIT FOR 10 NS;
    end process;

    --STIMULUS PROCESS
    STIM: process
            begin

                CLR <= '1'; 
                SR <= '0';
                SL <= '0';
                ABCDEFGH <= "00000000"; 
                S1 <='0';
                S2 <='0';
            
                wait for 10 ns;
                
                CLR <= '0'; 
                SR <= '1';
                SL <= '0';
                ABCDEFGH <= "11001100"; 
                S1 <='1';
                S2 <='0';
    
                wait for 10 ns;
                
                CLR <= '0'; 
                SR <= '0';
                SL <= '1';
                ABCDEFGH <= "11001100"; 
                S1 <='1';
                S2 <='0';
                wait for 10 ns;
                
                CLR <= '0'; 
                SR <= '1';
                SL <= '0';
                ABCDEFGH <= "11001100"; 
                S1 <='0';
                S2 <='1';
                wait for 10 ns;
                
                CLR <= '0'; 
                SR <= '1';
                SL <= '0';
                ABCDEFGH <= "11001100"; 
                S1 <='0';
                S2 <='1';
    
                wait for 10 ns;
                
                CLR <= '1'; 
                SR <= '1';
                SL <= '0';
                ABCDEFGH <= "11001100"; 
                S1 <='1';
                S2 <='0';
    
                wait for 20 ns;

    end process;
end behavioral;