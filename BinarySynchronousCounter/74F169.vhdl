library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY bcounter is
    port(

        PE: in std_logic; --negada
        UD: in std_logic;
        CP: in std_logic;
        CEP: in std_logic; --negado
        CET: in std_logic; --negado
        D: in unsigned(3 downto 0);
        TC: out std_logic:='0';
        Q: out unsigned(3 downto 0)

    );
end entity;

architecture behavioral of bcounter is 
    signal Qs: unsigned(3 downto 0);
begin

    Q<=Qs;

    process(CP)
        begin
        if CP='1' and CP'event then
        
                    if PE='0' then
                                
                                    Qs<=D;
                                    
                                
                            
                            elsif UD='1' and CEP ='0' and CET='0'  then
                            
                                    if Qs="1111" then
                                
                                        TC<='1';
                                
                                        elsif Qs<"1111" then
                                
                                        Qs<=Qs+1;
                                        TC<='0';
                                    
                                    end if;    
                                    
                            elsif UD='0' and CEP ='0' and CET='0' then
                                    
                                    if Qs="0000" then
                                        
                                        TC<='1';
                                    
                                        elsif Qs>"0000" then
                                            Qs<=Qs-1;
                                            TC<='0';
                                    end if;

                            elsif CEP='1' then
                                    
                                    Qs<=Qs;
                                   


                            elsif PE='1' then
                                
                                    Qs<=Qs;                     
                                    
                    end if;
         end if;
end process;
end behavioral ; 