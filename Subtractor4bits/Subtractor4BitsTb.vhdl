library ieee;
use ieee.std_logic_1164.all;

entity Subtractor4BitsTb is
    end entity;

architecture behavioral of Subtractor4BitsTb is
component Subtractor4bits port(

    A: in std_logic_vector(3 downto 0);
    B: in std_logic_vector(3 downto 0);
    Bin: in std_logic;
    Bout: out std_logic;
    Sub: out std_logic_vector(3 downto 0)
    

);
end component;

--inputs
SIGNAL A : std_logic_vector(3 downto 0) := "0000";
SIGNAL B : std_logic_vector(3 downto 0) := "0000";
SIGNAL Bin : std_logic := '0';
--OUTPUTS
SIGNAL Bout : std_logic;
SIGNAL Sub : std_logic_vector(3 downto 0);

begin
    uut: Subtractor4bits Port map(
        A => A,
        B => B,
        Bin => Bin,
        Bout => Bout,
        Sub => Sub
    );

--stimulus process
stim: process
        begin
            wait for 20 ns;
            A<="0000";
            B<="1011";
            wait for 20 ns;
            A<="1011";
            B<="0000";
            wait for 20 ns;
            A<="0010";
            B<="1011";
            Bin<='1';
            wait for 20 ns;
            A<="1011";
            B<="0010";
            Bin<='1';
            wait for 20 ns;
            A<="0000";
            B<="0000";
            Bin<='0';
            wait for 10 ns;

end process;

end behavioral ;