library ieee;
use ieee.std_logic_1164.all;

entity comparator is
    port(
        x, y: in std_logic_vector(3 downto 0);
        x_Mayor_y, x_igual_y, x_menor_y: out std_logic;
        Res: out std_logic_vector(3 downto 0)
    );
end entity;

architecture behavioral of comparator is

begin

    x_Igual_y <= '1' when x = y else '0';
    x_Menor_y <= '1' when x < y else '0';
    x_Mayor_y <= '1' when x > y else '0';
    
    Res <= X when X = Y else "0000";
end behavioral ; 