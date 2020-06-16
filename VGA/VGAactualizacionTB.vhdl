library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGAactualizacionTB is
        constant h_pulse   : integer := 96;
        constant h_bp      : integer := 48;
        constant h_display : integer := 640;
        constant h_fp      : integer := 16;
        constant h_pol     : std_logic := '0';
        constant v_pulse   : integer := 2;
        constant v_bp      : integer := 33;
        constant v_display : integer := 480;
        constant v_fp      : integer := 10;
        constant v_pol     : std_logic := '0';
        constant period    : time := 40 ps;
end entity;

architecture behavioral of VGAactualizacionTB is
   
    component VGAactualizacion is
   
    generic (
        h_pulse: integer:= 96;
        h_bp: integer:= 48;
        h_display: integer:= 640;
        h_fp: integer:= 16;
        h_pol: std_logic:= '0';
        v_pulse: integer:= 2;
        v_bp: integer:= 33;
        v_display: integer:= 480;
        v_fp: integer:= 10;
        v_pol: std_logic:= '0'
     );

     port(
   
        clk: in std_logic;
        en: out std_logic;
        columna: out integer;
        fila: out integer;
        --red,green,blue: in std_logic;
        --rgb: out std_logic_vector(2 downto 0);
        h_sync, v_sync: out std_logic;
        clk_vga: out std_logic

    );
end component;
--Inputs

    signal clk: std_logic:='0';

--Outpus

    signal en: std_logic:='0';
    signal columna: integer:=0;
    signal fila: integer:=0;
    signal h_sync: std_logic; 
    signal v_sync: std_logic;
    signal clk_vga: std_logic;

begin

      uut1: VGAactualizacion
            generic map (
             
             h_pulse => h_pulse,
             h_bp => h_bp,
             h_display => h_display, 
             h_fp => h_fp,
             h_pol => h_pol,
             v_pulse => v_pulse,
             v_bp => v_bp,
             v_display => v_display, 
             v_fp => v_fp, 
             v_pol => v_pol

             )
            port map (
 
                clk => clk, 
                en => en, 
                columna => columna, 
                fila => fila, 
                h_sync => h_sync, 
                v_sync => v_sync, 
                clk_vga => clk_vga
            
            );

CLOCK:process
      
        begin
        
            clk <= '0';
            
            wait for period/2;
            
            clk <= '1';
            
            wait for period/2;

        end process;

end behavioral;