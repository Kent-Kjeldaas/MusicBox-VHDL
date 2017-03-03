----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 02:24:24 PM
-- Design Name: 
-- Module Name: UART - Behavioral
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

entity UART is
    generic(
        DBIT : integer := 8; 
        SB_TICK : integer := 16;
        N : integer := 4
        );
    Port ( clk, reset : in STD_LOGIC;
           rx : in STD_LOGIC;
           rx_done_tick : out STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (7 downto 0));
end UART;

architecture Behavioral of UART is
    
    component baud_rate_generator is 
        Port (clk, reset: in std_logic;
    max_tick: out std_logic;
    q: out std_logic_vector(N-1 downto 0);
    end component; 

    type state_type is (idle, start, data, stop); 
    signal state_reg, state_next : state_type; 
    signal s_reg, s_next : unsigned(3 downto 0); 
    signal n_reg, n_next : unsigned(2 downto 0); 
    signal b_reg, b_next : std_logic_vector(7 downto 0); 
    
    signal s_tick : std_logic;
   
begin

    uut: baud_rate_generator
    port map(clk => clk, reset => reset, tick => s_tick);
    
    
    process(clk, reset) 
    begin 
        if(reset = '1') then 
            state_reg <= idle; 
            s_reg <= (others => '0');
            n_reg <= (others => '0');
            b_reg <= (others => '0');
        elsif(clk'event and clk = '1') then 
            state_reg <= state_next; 
            s_reg <= s_next; 
            n_reg <= n_next; 
            b_reg <= b_next; 
        end if; 
    end process; 
    
    --next state logic 
    process( state_reg, s_reg, n_reg, b_reg, s_tick, rx) 
    begin 
        state_next <= state_reg; 
        s_next <= s_reg; 
        n_next <= n_reg; 
        b_next <= b_reg; 
        rx_done_tick <= '0'; 
        case state_reg is 
            when idle => 
            if (rx = '0') then 
                state_next <= start; 
                s_next <= (others => '0'); 
            end if; 
            when start => 
                if(s_tick = '1') then 
                    if (s_reg = 7) then 
                        state_next <= data; 
                        s_next <= (others => '0'); 
                        n_next <= (others => '0'); 
                    else 
                        s_next <= s_reg + 1; 
                    end if; 
                end if; 
            when data => 
                if(s_tick = '1') then 
                    if (s_reg = 15) then 
                        s_next <= (others => '0'); 
                        b_next <= rx & b_reg(7 downto 1); 
                        if (n_reg = (DBIT-1)) then 
                            state_next <= stop; 
                        else 
                            n_next <= n_reg + 1; 
                        end if; 
                    else 
                        s_next <= s_reg + 1; 
                end if; 
                end if;
            when stop => 
                if(s_tick = '1') then 
                    if s_reg = (SB_TICK - 1) then 
                        state_next <= idle; 
                        rx_done_tick <= '1'; 
                    end if;
                end if; 
            end case; 
        end process; 
        
        dout <= b_reg; 
                
         


end Behavioral;
