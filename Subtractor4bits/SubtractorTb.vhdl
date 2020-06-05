library ieee;
use ieee.std_logic_1164.all;

entity SubtractorTb is
end entity;

architecture behavioral of SubtractorTb is
    component Subtractor port(

    A, B, Bin: in std_logic;
    Sub, Bout: out std_logic);

end component;

--inputs
signal A: std_logic :='0';
signal B: std_logic :='0';
Signal Bin: std_logic :='0';

--outputs

signal sub: std_logic;
signal bout: std_logic;

begin
    uut: Subtractor port map (

        A=>A, 
        B=>B, 
        Bin=>Bin,
        Sub=>Sub,
        Bout=>Bout
        
        );

    --stimulus process
    stim : process
            begin
                
            wait for 10 ns;
                A<='1';
            wait for 10 ns;
                B<='1';
            wait for 10 ns;    
                A<='0';
            wait for 10 ns;
                Bin<='1';
            wait for 10 ns;
                A<='0';
                B<='0';
                Bin<='0';            
            wait for 10 ns;

            end process;
end behavioral;