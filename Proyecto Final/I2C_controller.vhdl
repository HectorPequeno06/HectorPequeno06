llibrary ieee;
use ieee.std_logic_1164.all;

entity I2C_controller is
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

end I2C_controller;

architecture arch OF I2C_controller is
    type statetype is (
            IDLE, START,
            SLV_ADDRR1, SLV_ADDRR2,
            SLV_ACK1, SLV_ACK2,
            WRDATA1,WRDATA2,
            SLV_ACK3,SLV_ACK4,
            STOP1,STOP2,STOP3,
            RDDATA1,RDDATA2,
            NACK1,NACK2,
            STOP4,STOP5,STOP6,
            ACK_ERROR
        );

    signal state           : statetype;
    SIGNAL Data            : std_logic_vector(7 downto 0);
    SIGNAL SDA01           : std_logic;
    SIGNAL bitcount        : integer RANGE 0 TO 7;
    signal SlaveAddress_RW : std_logic_vector(7 downto 0);

    constant C250          : integer := 250;
    signal ClkCountDivider : integer RANGE 0 TO C250;
    signal CLK_200k_Hz     : std_logic;

begin

    SlaveAddress_RW <= SlaveAddress&RW;
    SDA             <= 'Z' when SDA01 = '1' else '0';

    output : process(CLK_200k_Hz, reset)
    begin
        if(reset = '1') then
            SCL     <= '1';
            SDA01   <= '1';
            Ack     <= '0';
            DataOut <= "00000000";
            state   <= IDLE;
        elsif(CLK_200k_Hz'EVENT and CLK_200k_Hz = '1') then
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
                    SCL <= '1';
                    Ack <= SDA;
                    if SDA = '1' then
                        state <= ACK_ERROR;
                    elsif RW = '0' then
                        state <= WRDATA1; -- Escritura
                    else
                        state <= RDDATA1; -- Lectura
                    end if;
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
                    SCL <= '1';
                    Ack <= SDA;
                    if SDA = '1' then
                        state <= ACK_ERROR;
                    else
                        state <= STOP1;
                    end if;
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
                -- Recibir datos del esclavo
                when RDDATA1 =>
                    SCL   <= '0';
                    SDA01 <= '1';
                    state <= RDDATA2;
                when RDDATA2 =>
                    SCL            <= '1';
                    Data(bitcount) <= SDA;
                    if (bitcount - 1) >= 0 then
                        bitcount <= bitcount - 1;
                        state    <= RDDATA1;
                    else
                        bitcount <= 7;
                        state    <= NACK1;
                    end if;
                -- Enviar NAck al esclavo
                when NACK1 =>
                    SCL     <= '0';
                    SDA01   <= '1';
                    state   <= NACK2;
                    DataOut <= Data;
                when NACK2 =>
                    SCL   <= '1';
                    state <= STOP4;
                -- Enviar stop condition
                when STOP4 =>
                    SCL   <= '0';
                    SDA01 <= '0';
                    state <= STOP5;
                when STOP5 =>
                    SCL   <= '1';
                    SDA01 <= '0';
                    state <= STOP6;
                when STOP6 =>
                    SCL   <= '1';
                    SDA01 <= '1';
                    state <= STOP6;
                -- Error, no se recibio Ack
                when ACK_ERROR =>
                    SCL   <= '1';
                    SDA01 <= '1';
                    state <= ACK_ERROR;
                when OTHERS => null;
                    SCL   <= '1';
                    SDA01 <= '1';
            end case;
        end if;
    end process;

    clockdivider200k : process
    begin
        wait until CLK_50_MHz'EVENT and CLK_50_MHz = '1';
        if ClkCountDivider < C250 then
            ClkCountDivider <= ClkCountDivider + 1;
        else
            ClkCountDivider <= 0;
        end if;
        if ClkCountDivider < C250/2 then
            CLK_200k_Hz <= '0';
        else
            CLK_200k_Hz <= '1';
        end if;
    end process;
end arch;
