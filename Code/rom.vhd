----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2016 02:52:18 PM
-- Design Name: 
-- Module Name: rom - Behavioral
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

entity rom is
    generic(
            SONG_WIDTH: integer:=7;
            ADDR_WIDTH: integer:=7;
            DATA_WIDTH: integer:=8);
    Port ( clk : in STD_LOGIC;
           we_t, we_b : in STD_LOGIC;
           re : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(7 downto 0); 
           addr : in integer;
           song_nr : in STD_LOGIC_VECTOR(2 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           song_reg : out STD_LOGIC_VECTOR(2 downto 0));
end rom;

architecture arch of rom is
    type ram_type is array (0 to SONG_WIDTH,0 to 2**ADDR_WIDTH-1) of     
 std_logic_vector(DATA_WIDTH-1 downto 0); 
    signal ram : ram_type; 
    signal song_nr_w : std_logic_vector(2 downto 0) := "000"; 
    signal addr_mc, addr_tx: integer := 0;
begin
addr_mc <= addr; 
    process(clk, data_in,re,we_t,we_b)
    begin 
        if(clk'event and clk = '1') then 
            if(we_t = '1' and we_b = '1') then 
                if(data_in = "01110011") then 
                    ram(to_integer(unsigned(song_nr_w)), addr_tx) <= "11111111"; 
                    song_nr_w <= std_logic_vector(unsigned(song_nr_w)+1);
                    addr_tx <= 0; 
                else 
                ram(to_integer(unsigned(song_nr_w)), addr_tx) <= data_in; 
                addr_tx <= addr_tx+1;
            end if;
            elsif(re = '1') then
                data_out <= ram(to_integer(unsigned(song_nr)),addr_mc);
                end if; 
        end if; 
    end process; 
    
song_reg <= song_nr_w;
end arch;
