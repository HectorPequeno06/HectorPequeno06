library ieee;
use ieee.std_logic_1164.all;

entity I2C_controller is
    generic(
        SlaveAddress : std_logic_vector(6 downto 0) := "1101000"
    );
    port (
        clk     : in    std_logic;
        reset   : in    std_logic;
        SCL     : out   std_logic;
        SDA     : inout std_logic;
        RW      : in    std_logic;
        DataIn  : in    std_logic_vector(7 downto 0);
        Ack     : out   std_logic;
        DataOut : out   std_logic_vector(7 downto 0)
    );

end I2C_controller;

architecture arch OF I2C_controller is
    type statetype is (
            IDLE, START,
            SLV_ADDRR1, SLV_ADDRR2,
            SLV_ACK1, SLV_ACK2,
            WRDATA1,WRDATA2,
            SLV_ACK3,SLV_ACK4,
            STOP1,STOP2,STOP3
        );

    signal state           : statetype;
    SIGNAL SDA01           : std_logic;
    SIGNAL bitcount        : integer RANGE 0 TO 7;
    signal SlaveAddress_RW : std_logic_vector(7 downto 0);

begin

    SlaveAddress_RW <= SlaveAddress&RW;
    SDA             <= 'Z' when SDA01 = '1' else '0';

    output : process(clk, reset)
    begin
        if(reset = '1') then
            SCL   <= '1';
            SDA01 <= '1';
            Ack   <= '0';
            state <= IDLE;
        elsif(clk'EVENT and clk = '1') then
            case state is
                -- En IDLE SDA y SCL = 1
                when IDLE =>
                    SCL     <= '1';
                    SDA01   <= '1';
                    DataOut <= "00000000";
                    state   <= START;
                -- Enviar start condition
                when START =>
                    SCL      <= '1';
                    SDA01    <= '0';
                    bitcount <= 7;
                    state    <= SLV_ADDRR1;
                -- Enviar direccion del esclavo + RW bit
                when SLV_ADDRR1 =>
                    SCL   <= '0';
                    SDA01 <= SlaveAddress_RW(bitcount);
                    state <= SLV_ADDRR2;
                when SLV_ADDRR2 =>
                    SCL <= '1';
                    if (bitcount - 1) >= 0 then
                        bitcount <= bitcount - 1;
                        state    <= SLV_ADDRR1;
                    else
                        bitcount <= 7;
                        state    <= SLV_ACK1;
                    end if;
                -- Ack del esclavo
                when SLV_ACK1 =>
                    SCL   <= '0';
                    SDA01 <= '1';
                    state <= SLV_ACK2;
                when SLV_ACK2 =>
                    SCL   <= '1';
                    Ack   <= SDA;
                    state <= WRDATA1; -- Escritura
                                      -- Enviar datos al esclavo
                when WRDATA1 =>
                    SCL   <= '0';
                    SDA01 <= DataIn(bitcount);
                    state <= WRDATA2;
                when WRDATA2 =>
                    SCL <= '1';
                    if (bitcount - 1) >= 0 then
                        bitcount <= bitcount - 1;
                        state    <= WRDATA1;
                    else
                        bitcount <= 7;
                        state    <= SLV_ACK3;
                    end if;
                -- Ack del esclavo
                when SLV_ACK3 =>
                    SCL     <= '0';
                    SDA01   <= '1';
                    DataOut <= DataIn;
                    state   <= SLV_ACK4;
                when SLV_ACK4 =>
                    SCL   <= '1';
                    Ack   <= SDA;
                    state <= STOP1;
                -- Enviar stop condition
                when STOP1 =>
                    SCL   <= '0';
                    SDA01 <= '0';
                    state <= STOP2;
                when STOP2 =>
                    SCL   <= '1';
                    SDA01 <= '0';
                    state <= STOP3;
                when STOP3 =>
                    SCL   <= '1';
                    SDA01 <= '1';
                    state <= STOP3;
                when OTHERS => null;
                    SCL   <= '1';
                    SDA01 <= '1';
            end case;
        end if;
    end process;
end arch;