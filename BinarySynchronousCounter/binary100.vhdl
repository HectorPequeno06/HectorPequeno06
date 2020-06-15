library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Binario 1100011 99
entity binary100 is 
port(
    
    PE: in std_logic; --negada
    UD: in std_logic;
    CP: in std_logic;
    CEP: in std_logic; --negado
    CET: in std_logic; --negado
    D: in unsigned(7 downto 0);
    TC: out std_logic;
    Q: out unsigned(7 downto 0)

);
end entity;

architecture Behavioral of binary100 is
component bcounter port(

    PE: in std_logic; --negada
    UD: in std_logic;
    CP: in std_logic;
    CEP: in std_logic; --negado
    CET: in std_logic; --negado
    D: in unsigned(3 downto 0);
    TC: out std_logic;
    Q: out unsigned(3 downto 0)

);
end component;

Signal TCS: std_logic;
signal tcsn: std_logic;
signal Qs: unsigned(7 downto 0);

begin

    tcsn<=not tcs;
   
    TC<=TCS;
   
    Q<=QS(7 downto 0);

    B0: BCOUNTER port map(PE,UD,CP,CEP,CET,D(3 DOWNTO 0), TCs, Qs(3 DOWNTO 0));
    B1: BCOUNTER port map(PE,UD,CP,TCSN,TCSN,D(7 DOWNTO 4), TCs, Qs(7 DOWNTO 4));

    process(CP)
        begin

            if CP'event AND CP='1' then
                
                if Qs="01100011" or Qs="10111011" then
                
                    TC<='1';
                
                    elsif Qs="00000000" or Qs="10000000" then
                
                        TC<='1';
                    else 
                    
                    TC<='0';
                end if;

            end if;
 end process;
end Behavioral ; 