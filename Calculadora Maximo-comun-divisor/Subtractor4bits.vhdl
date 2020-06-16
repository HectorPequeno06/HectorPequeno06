library ieee;
use ieee.std_logic_1164.all;

entity Subtractor4bits is
    port(
        A: in std_logic_vector(3 downto 0);
        B: in std_logic_vector(3 downto 0);
        Bin: in std_logic;
        Bout: out std_logic;
        Sub: out std_logic_vector(3 downto 0)
        );

end Subtractor4bits;

architecture behavioral of Subtractor4bits is
    component Subtractor 
    port(
        A, B, Bin: in std_logic;
        Bout, Sub : out std_logic
    );
end component;
signal Bouts: std_logic_vector(2 downto 0);
begin 
    --concurrent statements
    
    SUB0: Subtractor port map(A(0), B(0), Bin ,Bouts(0) ,Sub(0));
    SUB1: Subtractor port map(A(1), B(1), Bouts(0), Bouts(1), Sub(1));
    SUB2: Subtractor port map(A(2), B(2), Bouts(1), Bouts(2), sub(2));
    SUB3: Subtractor port map(A(3), B(3), Bouts(2), bout, Sub(3));

    
end behavioral;