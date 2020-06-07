library IEEE;
use IEEE.std_logic_1164.all;

entity shiftregister8bits is 
port(
    CLK, CLR, SR, SL, S1, S2: in std_logic;
    ABCDEFGH: in std_logic_vector(7 downto 0);
    Q: out std_logic_vector (7 downto 0)
    );
end entity;

architecture behavioral of shiftregister8bits is
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
   
begin

    SHIFT0: shiftregister4bits port map (CLK,CLR ,SR ,SL ,ABCDEFGH(3 DOWNTO 0),S1 ,S2 ,Q(3 DOWNTO 0));
    SHIFT1: shiftregister4bits port map (CLK,CLR ,SR ,SL ,ABCDEFGH(7 DOWNTO 4),S1 ,S2 ,Q(7 DOWNTO 4));

end behavioral;