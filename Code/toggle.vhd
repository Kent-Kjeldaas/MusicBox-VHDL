----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2016 06:08:29 PM
-- Design Name: 
-- Module Name: toggle - arch
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toggle is

    Port (  clk, reset : in STD_LOGIC;
            toggle : in STD_LOGIC;
            tick_in : in STD_LOGIC;
            tick_out : out STD_LOGIC);
end toggle;

architecture arch of toggle is
signal toggle_s : std_logic;

begin

    process 
    begin 
        if(reset = '1') then 
            tick_out <= '0';
        elsif(clk'event and clk = '1') then  
            if(toggle = '1') then 
                tick_out <= tick_in; 
            else 
                tick_out <= '0';
            end if;  
        end if;
    end process; 

end arch;
