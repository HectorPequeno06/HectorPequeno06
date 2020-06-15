library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity binary100TB is
    END entity;

architecture BEHAVIORAL of binary100TB is

    component binary100 is 
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
    end component;

--INPUT
SIGNAL PE: std_logic:='1'; --negada
SIGNAL UD: std_logic:='0';
SIGNAL CP: std_logic:='0';
SIGNAL CEP: std_logic:='1'; --negado
SIGNAL CET: std_logic:='1'; --negado
SIGNAL D: unsigned(7 downto 0):="00000000";

--OUTPUT
SIGNAL TC: std_logic;
SIGNAL Q: unsigned(7 downto 0);

begin

    UUT: binary100 port map ( 
    PE=>PE, --negada
    UD=>UD,
    CP=>CP,
    CEP=>CEP, --negado
    CET=>CET, --negado
    D=>D,
    TC=>TC,
    Q=>Q
    );


    --STIMULUS
    Clock: process
        begin

            CP <= '0';
            WAIT FOR 5 NS;
            CP <= '1';
            wait for 5 ns;
        
    end process;

       --STIMULUS PROCESS
    stim: PROCESS
            begin
                --Load
                D<="00010000";
                PE<='0';
                wait for 20 ns;
                --Count Up
                PE<='1';
                UD<='1';
                cep<='0';
                cet<='0';
                wait for 50 ns;
                --Count Down
                Pe<='1';
                ud<='0';
                cep<='0';
                cet<='0';
                WAIT FOR 50 NS;
                --No Change
                pe<='1';
                cet<='1';
                
                wait for 25 ns;
                
                pe<='1';
                cep<='1';
                wait for 25 ns;
            

    end PROCESS;

end BEHAVIORAL ; -- BEHAVIORAL