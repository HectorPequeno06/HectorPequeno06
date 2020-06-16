library IEEE;
use ieee.std_logic_1164.all;

entity Datapath is 
port(
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
end entity;

architecture behavioral of Datapath is
component Subtractor4bits is
    port(
        A: in std_logic_vector(3 downto 0);
        B: in std_logic_vector(3 downto 0);
        Bin: in std_logic;
        Bout: out std_logic;
        Sub: out std_logic_vector(3 downto 0)
        );
end component;
component comparator is
        port(
            x, y : in std_logic_vector(3 downto 0);
            x_Mayor_y, x_igual_y, x_menor_y : out std_logic;
            Res: out std_logic_vector(3 downto 0)
        );
end component;
component register4bits is
    port (
        D: in  std_logic_vector(3 downto 0);
        clk: in  std_logic;
        load: in  std_logic;
        reset: in  std_logic;
        Q: out std_logic_vector(3 downto 0)
    );
end component;
component MUX is
        port (
        x, y: in  std_logic_vector(3 downto 0);
        sel: in  std_logic;
        res: out std_logic_vector(3 downto 0)
        );
end component;

--Señales--
signal res: std_logic_vector(3 downto 0);
signal x1, x2, x3: std_logic_vector(3 downto 0);
signal y1, y2, y3: std_logic_vector(3 downto 0);
signal helper1, helper2: std_logic;

begin

    mux_X : MUX port map (X_i, x3, X_sel, x1);
    mux_Y : MUX port map (Y_i, y3, Y_sel, y1);

    reg_X : register4bits port map (x1, clk, X_ld, rst, x2);
    reg_Y : register4bits port map (y1, clk, Y_ld, rst, y2);

    Comp : comparator port map (x2, y2, X_gt_Y , X_eq_Y, X_lt_Y, res);

    SUB1_X_Y : subtractor4bits port map (x2, y2, '0', helper1, x3);
    SUB2_Y_X : subtractor4bits port map (y2, x2, '0', helper2, y3);

    Reg: register4bits port map(res, clk, O_enb, rst, Data_o);


end behavioral ;