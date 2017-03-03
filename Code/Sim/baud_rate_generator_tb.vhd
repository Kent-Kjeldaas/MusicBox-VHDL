----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 03:14:08 PM
-- Design Name: 
-- Module Name: baud_rate_generator_tb - Behavioral
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

entity baud_rate_generator_tb is
--  Port ( );
end baud_rate_generator_tb;

architecture Behavioral of baud_rate_generator_tb is

    component baud_rate_generator is 
        Port ( clk, reset : in STD_LOGIC;
           tick : out STD_LOGIC);
    end component;
     
    signal clk, reset : std_logic; 
    signal tick : std_logic; 
    constant clk_period: time := 10 ns; 

begin
    uut: baud_rate_generator
    port map(   clk => clk, reset => reset, 
                tick => tick); 
                
                
    clk_process: process
    begin 
    clk <= '0'; 
    wait for clk_period/2; 
    clk <= '1'; 
    wait for clk_period/2; 
    end process; 
    
    
   


end Behavioral;
