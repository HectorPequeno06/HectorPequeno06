library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity i2c_controller_tb is
end i2c_controller_tb;

architecture test of i2c_controller_tb is

    component i2c_controller is
        generic(
            SlaveAddress : std_logic_vector(6 downto 0) := "1101000"
        );
        port (
            CLK_50_MHz : in    std_logic;
            reset      : in    std_logic;
            SCL        : out   std_logic;
            SDA        : inout std_logic;
            RW         : in    std_logic;
            DataIn     : in    std_logic_vector(7 downto 0);
            Ack        : out   std_logic;
            DataOut    : out   std_logic_vector(7 downto 0)
        );
    end component;

    constant Clock50MHzPeriod  : time := 20 ns;
    constant Clock200kHzPeriod : time := 5 us;

    signal CLK_50_MHz          : std_logic := '0';
    signal Reset               : std_logic;
    signal scl                 : std_logic;
    signal sda                 : std_logic := 'Z';
    signal rw                  : std_logic := '1';
    signal DataIn, DataOut     : std_logic_vector(7 downto 0);
    signal Ack                 : std_logic;
    signal data_received_slave : std_logic_vector(7 downto 0);

begin

        uut : i2c_controller port map(CLK_50_MHz, Reset, scl, sda, rw, DataIn, Ack, DataOut);

    CLK_50_MHz <= not CLK_50_MHz after Clock50MHzPeriod/2;

    process

        file fin : TEXT open READ_MODE is "input.txt";

        variable line_txt  : line;
        variable line_RW   : std_logic;
        variable line_data : std_logic_vector(7 downto 0);

        -- Esclavo envia datos al maestro
        procedure readData(
                slaveData : std_logic_vector(7 downto 0)
            ) is
        begin

            for i in 7 downto 0 loop
                SDA <= slaveData(i);
                wait for Clock200kHzPeriod*2;
            end loop;
            SDA <= 'Z';
        end procedure readData;

        -- Esclavo recibe datos del maestro
        procedure readDataAsSlave is
        begin
            for i in 7 downto 0 loop
                wait for Clock200kHzPeriod*2;
                if SDA='Z' then
                    data_received_slave(i) <= '1';
                else
                    data_received_slave(i) <= '0';
                end if;
            end loop;
        end procedure readDataAsSlave;
    begin

        readFile : while (not endfile(fin)) loop
            readline(fin, line_txt);
            read(line_txt, line_RW);
            read(line_txt, line_data);

            RW <= line_RW;

            reset <= '1';
            wait for Clock200kHzPeriod/4;
            reset <= '0';
            wait for Clock200kHzPeriod*19;
            -- Esclavo envia Ack de recibido
            SDA <= '0';
            wait for Clock200kHzPeriod;
            if RW = '0' then
                DataIn <= line_data;
                SDA    <= 'Z';
                readDataAsSlave;
                SDA <= '0';
                wait for Clock200kHzPeriod;
                SDA <= 'Z';
                wait for Clock200kHzPeriod;
                write(line_txt, string'("Datos enviados: "));
                write(line_txt, data_received_slave);
            else
                readData(line_data);
                wait for Clock200kHzPeriod;
                write(line_txt, string'("Datos recibidos: "));
                write(line_txt, DataOut);
            end if;
            writeline(output, line_txt);
            wait for Clock200kHzPeriod*10;
        end loop;

        -- report "FIN DE LA SIMULACION" severity failure;
    end process;

end test;