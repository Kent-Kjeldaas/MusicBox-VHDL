----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 02:33:32 PM
-- Design Name: 
-- Module Name: music_control - arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity music_control is

    Port (  clk, reset : in std_logic;
            start: in std_logic; 
            stop : in std_logic; 
            note : in std_logic_vector (7 downto 0); 
            addr : out integer := 0;
            tick_out : out std_logic;
            toggle_out :out std_logic
            );
           
end music_control;

architecture arch of music_control is

    constant CLK_MS_COUNT : integer := 50000000;  -- 500ms tick 
    type state_type is (idle, play); 
    signal state_reg, state_next : state_type; 
    signal t_reg, t_next : integer := 0; 
    signal p_reg, p_next : integer := 0;
    signal frequency : integer := 0; 
    signal done_tick : std_logic; 
    signal reg_note : std_logic_vector(7 downto 0); 
    signal start_s : std_logic; 
    signal toggle : std_logic; 

begin
reg_note <= note; 
    unit_freq_chooser: entity work.freq_chooser(arch) 
        port map(note => reg_note, frequency => frequency);
        
    unit_buzz_clk: entity work.buzz_clk(arch) 
        port map(   clk => clk, reset => reset, 
                    frequency => frequency,note_change => done_tick,
                    toggle => toggle, tick_out => tick_out);  
    

    process(clk, reset,start) 
    begin   
        if(reset = '1') then 
            state_reg <= idle; 
            t_reg <= 0; 
            p_reg <= 0; 
        elsif(clk'event and clk='1') then 
            state_reg <= state_next; 
            t_reg <= t_next; 
            p_reg <= p_next;
        end if; 
    end process; 
    
    process(start,state_reg,t_reg,t_next,p_reg,reg_note, note,reset) 
    begin
        done_tick <= '0'; 
        state_next <= state_reg; 
        p_next <= p_reg; 
        t_next <= t_reg; 
        case state_reg is   
            when idle => 
                if(start = '1') then    
                    state_next <= play; 
                else 
                    toggle <= '0'; 
                end if; 
              
            when play => 
                toggle <= '1'; 
                done_tick <= '0'; 
                if( note = "11111111") then 
                    p_next <= 0; 
                  else 
                    if(t_reg = CLK_MS_COUNT) then 
                        t_next <= 0; 
                        p_next <= p_reg + 1; 
                        done_tick <= '1'; 
                            else 
                                t_next <= t_reg + 1; 
                    end if; 
                end if; 
                if(stop = '1') then   
                    state_next <= idle;
                end if; 
        end case; 
    end process; 
    
addr <=  p_reg; 
toggle_out <= toggle; 
        
end arch;
