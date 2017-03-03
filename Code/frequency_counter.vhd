----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 12:00:23 PM
-- Design Name: 
-- Module Name: frequency_counter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_counter is
    Port ( clk, reset : in STD_LOGIC;
           input : in STD_LOGIC; 
           start : in STD_LOGIC; 
           note : in STD_LOGIC_VECTOR (7 downto 0);
           buzz : in STD_LOGIC);
end frequency_counter;

architecture Behavioral of frequency_counter is
    constant N : integer := 20; 
    signal counter, c_reg, c_next : std_logic_vector(N-1 downto 0) := (others => '0'); 
    
    type state_type is (idle, waite, count); 
    signal state_reg, state_next : state_type; 
    signal edge, edge_delay : std_logic; 
begin
   
    process(clk, reset)
    begin 
        if reset ='1' then 
            state_reg <= idle; 
            counter <= (others => '0'); 
            edge_delay <= '0';
        elsif(clk'event and clk = '1') then 
            state_reg <= state_next; 
            c_reg <= c_next; 
            edge_delay <= input;
        end if; 
    end process; 
    
   edge <= (not edge_delay) and input;
    
    process(counter, note, start, clk, edge)
    begin 
    case state_reg is 
        when idle => 
            if (start = '1') then 
                state_next <= waite; 
            end if; 
            
        when waite => 
            if edge = '1' then 
                state_next <= count; 
                c_next <= (others => '0'); 
                
            end if; 
        when count =>
        if (edge = '1') then 
            state_next <= idle;
        else 
            if(c_reg = "00000000000000110000") then
                c_reg <= (others => '0'); 
                state_next <= idle;
            else 
                c_next <= std_logic_vector(unsigned(c_reg) + 1);
            end if; 
        end if;        
    end case; 
    end process; 
    


end Behavioral;
