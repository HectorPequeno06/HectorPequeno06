library ieee;
use ieee.std_logic_1164.all;

entity Subtractor is
    port(

    A, B, Bin: in std_logic;
    Bout, Sub : out std_logic);

end entity;

architecture behavioral of Subtractor is

    begin
    
        Sub <= A xor (B xor Bin);
        Bout <= (Bin and (B and (not A))) or ((not A) and B);
    
    
end behavioral;