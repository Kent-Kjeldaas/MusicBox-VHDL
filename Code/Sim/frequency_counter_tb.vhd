----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2016 12:25:27 PM
-- Design Name: 
-- Module Name: frequency_counter_tb - Behavioral
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
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_counter_tb is
--  Port ( );
end frequency_counter_tb;

architecture Behavioral of frequency_counter_tb is

    component frequency_counter is 
        Port ( clk, reset : in STD_LOGIC;
               input : in STD_LOGIC;
               start : in STD_LOGIC; 
               note : in STD_LOGIC_VECTOR (7 downto 0);
               buzz : in STD_LOGIC);
    end component; 
    
    signal clk, reset, start, buzz : std_logic;
    signal note : std_logic_vector(7 downto 0);
    signal input : std_logic;
    constant clk_period : time := 10 ns;  --clk period
    constant signal_period :time := 12000000 ns; 
begin

    uut: frequency_counter
     port map(   clk => clk, reset => reset, input => input, 
                start => start, note => note, 
                buzz => buzz); 

    -- clock behaviour 
    clk_process: process
    begin 
        clk <= '0';
        wait for clk_period/2; 
        clk <= '1';
        wait for clk_period/2; 
    end process; 
    
    input <= not input after signal_period/2;   
    

    reset <= '0'; 
    start <= '1'; 
    
end Behavioral;
