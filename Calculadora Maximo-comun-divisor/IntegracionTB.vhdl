library IEEE;
use IEEE.std_logic_1164.all;

entity IntegracionTb is
end IntegracionTb;

architecture behavioral of IntegracionTb is
    component integracion is
    port(
        clk, reset: in std_logic;
        GO_i: in std_logic;
        X_i: in std_logic_vector(3 downto 0);
        Y_i: in std_logic_vector(3 downto 0);
        Data_o: out std_logic_vector(3 downto 0)
    );
end component;

--INPUTS

signal clk: std_logic := '0';
signal reset, GO_i: std_logic;
signal X_i, Y_i, Data_o : std_logic_vector(3 downto 0);


begin

    UUT : integracion port map(
        
    clk=>clk, 
    reset=>reset,
    GO_i=>GO_i, 
    X_i=>X_i,
    Y_i=>Y_i,
    Data_o=>Data_o
    
    );

    clock: Process
    begin
        clk<='1';
        wait for 1 ns;
        clk<='0';
        wait for 1 ns;

    end process;

        
    --STIMULUS PROCESS
    stim: process
    begin
       
        reset  <= '1';
        GO_i <= '0';
        X_i  <= "1000";
        Y_i  <= "0001";
        wait for 30 ns;

        reset <= '0';
        GO_i <= '1';       
        wait for 50 ns;

       
        reset  <= '1';
        GO_i <= '0';
        X_i  <= "1010";
        Y_i  <= "0110";
        wait for 20 ns;
       
        reset <= '0';
        GO_i <= '1';
        wait for 30 ns;

        
        reset  <= '1';
        GO_i <= '0';
        X_i  <= "0111";
        Y_i  <= "1011";
        wait for 20 ns;
       
        reset <= '0';
        GO_i <= '1';
        wait for 30 ns;

        
        reset  <= '1';
        GO_i <= '0';
        X_i  <= "0101";
        Y_i  <= "1010";
        wait for 30 ns;
       
        reset <= '0';
        GO_i <= '1';
        wait for 30 ns;

    end process;

end behavioral;  