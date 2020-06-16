library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGAactualizacion is 
    
-----------Generic para adaptar a cualquier resolucion----------
generic (
        h_pulse: integer := 96;
        h_bp: integer := 48;
        h_display: integer := 640;
        h_fp: integer := 16;
        h_pol: std_logic := '0';
        v_pulse: integer := 2;
        v_bp: integer := 33;
        v_display: integer := 480;
        v_fp: integer := 10;
        v_pol: std_logic := '0'
    );
    port(
        clk: in std_logic;
        en: out std_logic;
        columna: out integer;
        fila: out integer;
      --  red,green,blue: in std_logic;
      --  rgb: out std_logic_vector(2 downto 0);
        h_sync, v_sync: out std_logic;
        clk_vga: out std_logic
    );
end entity;
-- 640x480
architecture behavioral of VGAactualizacion is

    constant h_period: integer := h_pulse + h_bp + h_display + h_fp;
    constant v_period: integer := v_pulse + v_bp + v_display + v_fp;
    signal h_count: integer range 0 to h_period - 1 := 0;
    signal v_count: integer range 0 to v_period - 1 := 0;
    


begin

    clk_vga <= clk; --- clock es de 25Mhz

    --video_on <= video_on_h and video_on_v;

process 
    begin 
        
        wait until clk'event and clk ='1';
  
        -- Horizontal
  
        if h_count < h_period - 1 then

                    h_count <= h_count + 1;

                else

                    h_count <= 0;
    
            if v_count < v_period - 1 then
        
                    v_count <= v_count + 1;
                    
                else

                    v_count <= 0;
        
            end if;        
        
        end if;

        -- h_sync
        
        if h_count >= h_display + h_fp + h_pulse or h_count < h_display + h_fp then 
        
            h_sync <= not h_pol;
        
        else
            
          h_sync <= h_pol;
          
        end if;

        -- Vertical
        if v_count >= v_display + v_fp + v_pulse or v_count < v_display + v_fp then 

            v_sync <= not v_pol;
        
        else
        
            v_sync <= v_pol;
        
         end if;
        
        --posicion
        if h_count < h_display then
          
            columna <= h_count;
          
            end if;
  
          if v_count < v_display then
          
            fila <= v_count;
          
          end if;
  
          if h_count < h_display and v_count < v_display then
          
            en <= '1';
          
          else
            
          en <= '0';

        end if;
    
    end process;

end behavioral;