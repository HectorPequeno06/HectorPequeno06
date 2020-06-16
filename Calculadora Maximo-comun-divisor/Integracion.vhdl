library IEEE;
use IEEE.std_logic_1164.all;

entity integracion is
    port(
        clk, reset: in std_logic;
        GO_i: in std_logic;
        X_i: in std_logic_vector(3 downto 0);
        Y_i: in std_logic_vector(3 downto 0);
        Data_o: out std_logic_vector(3 downto 0)
    );
end integracion;

architecture behavioral of integracion is
    component datapath is
        port (
            clk: in std_logic;
            rst: in std_logic;
            X_i: in std_logic_vector(3 downto 0);
            Y_i: in std_logic_vector(3 downto 0);
            Y_ld: in std_logic;
            O_enb: in std_logic;
            X_sel: in std_logic;
            Y_sel: in std_logic;
            X_ld: in std_logic;
            Data_o: out std_logic_vector(3 downto 0);
            X_gt_Y: out std_logic;
            X_eq_Y: out std_logic;
            X_lt_Y: out std_logic
        );
    end component;

    component controller is
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
    end component;
    signal O_enb: std_logic;
    signal X_MAYOR_Y, X_IGUAL_Y, X_MENOR_Y: std_logic;
    signal X_sel, Y_sel:std_logic;
    signal X_ld, Y_ld:std_logic;
    

begin

        datp : datapath port map(
            clk, 
            reset,
            X_i, 
            Y_i,
            Y_ld,
            O_enb,
            X_sel, 
            Y_sel,
            X_ld, 
            Data_o,
            X_Mayor_Y, 
            X_igual_Y, 
            X_Menor_Y
        );
        cont : controller port map(
            clk, 
            reset, 
            GO_i,
            X_MAYOR_Y, 
            X_IGUAL_Y,
            X_MENOR_Y,
            X_sel, 
            Y_sel,
            X_ld, 
            Y_ld, 
            O_enb
        );
        
end behavioral;