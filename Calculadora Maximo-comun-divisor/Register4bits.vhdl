library ieee;
use ieee.std_logic_1164.all;

entity register4bits is
    port (
        D: in  std_logic_vector(3 downto 0);
        clk: in  std_logic;
        load: in  std_logic;
        reset: in  std_logic;
        Q: out std_logic_vector(3 downto 0)
    );
end entity;

architecture behavioral of register4bits is 

begin

process (reset, clk)

    begin
        
        if reset = '1' then

            Q <= "0000";
            
            elsif clk'event and clk='1' then
            
                if load = '1' then
            
                    Q <= D;
        
                end if;
        
        end if;
        
end process;

end behavioral; 