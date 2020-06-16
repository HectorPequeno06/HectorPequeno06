library IEEE;
use IEEE.std_logic_1164.all;

entity controller is
    port(
        clk: in std_logic; 
        reset: in std_logic;
        GO_i: in std_logic;
        X_Mayor_Y: in std_logic;
        X_igual_Y: in std_logic;
        X_menor_Y: in std_logic;
        X_sel: out std_logic;
        Y_sel: out std_logic;
        X_ld: out std_logic;
        Y_ld: out std_logic;
        O_enb: out std_logic
    );
end controller;

architecture arch of controller is
    
type state_type is (S0, S1, S2, S3, S4, S5);
signal state, nextstate : state_type;

begin


process (clk, reset)

        begin

        if (reset = '1') then

            state <= S0;

         elsif clk'event and clk='1' then

            state <= nextstate;

        end if;

end process;


process (state, X_menor_Y, X_Mayor_Y, GO_i, X_igual_Y)
begin 
    case state is

        when S0 =>

        if (GO_i = '1') then

        nextstate <= S1;

        else

        nextstate <= S0;

        end if;

        when S1 =>

            nextstate <= S2;

        when S2 =>

        if (X_igual_Y = '1') then

            nextstate <= S5;

        elsif (X_Mayor_Y = '1') then

            nextstate <= S3;

            else

            nextstate <= S4;

            end if;

        when S3 =>

            nextstate <= S2;

        when S4 =>

            nextstate <= S2;

        when S5 =>

            nextstate <= S5;

        when others => null;

    end case;

end process;


process (state)
begin

    X_ld <= '0';
    Y_ld <= '0';
    O_enb <= '0';
    X_sel <= '1';
    Y_sel <= '1';

    case state is

        when S1 =>
            
            X_ld <= '1';
            Y_ld <= '1';
            X_sel <= '0';
            Y_sel <= '0';

        when S3 =>

            X_ld <= '1';

        when S4 =>

            Y_ld <= '1';

        when S5 =>

            O_enb <= '1';

        when others => null;

    end case;

end process;
    
end arch;