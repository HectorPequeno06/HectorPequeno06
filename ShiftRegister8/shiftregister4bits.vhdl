library IEEE;
use ieee.std_logic_1164.all;

entity shiftregister4bits is
    port(
        CLK: in std_logic;
        CLR: in std_logic;
        SR: in std_logic;
        SL: in std_logic;
        ABCD: in std_logic_vector(3 downto 0);
        S1,S2: in std_logic;
        Q: out std_logic_vector(3 downto 0)

    );
end entity;

architecture behavioral of shiftregister4bits is
    signal Qs : std_logic_vector(3 downto 0);
begin

    Q<=Qs;
    process(clk)
        begin
            if clr='0' then
                
                Qs<="0000";

                elsif clr ='1' then
                    
                    if CLK = '1' and CLK'event then
                    
                            if S1='1' and S2='1' then
                            
                                Qs <= ABCD;
                            
                            elsif  S1='0' and S2='1' and SR= '1' then 

                                Qs<= '1' & ABCD(3 downto 1);
                                
                            elsif S1='0' and s2='1' and SR='0' then 

                                Qs<= '0' & ABCD(3 downto 1);

                            elsif S1='1' and S2='0' and Sl = '1' then
                        
                                Qs<= ABCD(2 downto 0) & '1';

                            elsif S1='1' and S2='0' and Sl = '0' then

                                Qs<= ABCD(2 downto 0) & '0';

                            elsif S1='0' and S2='0' then 

                                Qs<=ABCD;

                          end if;

                    end if;
            
            end if;
    
        end process;

end behavioral;