library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RelojDigital is
    port(CLK: in std_logic;
        setM: in std_logic;
        setH: in std_logic;
        SegM: out unsigned(5 downto 0);
        segH: out unsigned(3 downto 0);
        PM: out std_logic
        );
end RelojDigital;

architecture arch of RelojDigital is
    signal segHs: unsigned(3 downto 0);
    signal segMs: unsigned(5 downto 0);
    signal PMs : std_logic;
begin
        segH <= segHs;
        segM <= segMs;
        PM <= Pms;
    process (CLK)
        begin

            if CLK'event and CLK='1' then
              
                elsif setH = '0' and setM ='1' and segHs < "1100" then

                    segHs<=SegHs + 1;
                    segMs <= "000000";
                       
                elsif setH = '0' and setM ='1' and segHs = "1100" then

                    segHs<=SegHs;
                    segMs <= "000000";
                
                elsif setH = '1' and setM ='0' and segMs < "111011" then

                        segHs <= "0000";
                        segMs <= segMs+1;
                           
                elsif setH = '1' and setM ='0' and segMs = "111011" then
    
                        segHs <= "0000";
                        segMs <= segMs;
                        
                elsif setH = '1' and setM ='1'  then
    
                            segHs <= "0000";
                            segMs <= "000000";
    
                elsif segHs < "1100" and SegMs = "111011" then 
                
                segHs <= segHs + 1;
                segMs <= "000000";
                
                elsif segHs < "1100" and segMs <"111011" then
                segHs <= segHs;
                segMs <= segMs + 1;

                elsif segHs = "1100" and segMs < "111011" then 
                segHs <= segHs;
                segMs <= segMs + 1;
                
                elsif segHs = "1100" and segMs = "111011" then

                segHs <= "0000";
                segMs <= "000000";
                PM <= not PMs;
            end if;

    end process;



end arch ; --RelojDigital