----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 05:25:14 PM
-- Design Name: 
-- Module Name: freq_top_tb - Behavioral
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

entity freq_top_tb is
--  Port ( );
end freq_top_tb;

architecture Behavioral of freq_top_tb is
component freq_top
    Port ( clk, reset : in STD_LOGIC;
       note_change : STD_LOGIC;
       note : in STD_LOGIC_VECTOR (7 downto 0);
       buzzer : out STD_LOGIC);
end component; 
signal clk, reset : std_logic;
signal note : std_logic_vector(7 downto 0); 
signal buzzer : std_logic; 
constant clk_period : time := 10 ns; 
signal note_change : std_logic; 
begin

uut: freq_top
port map(clk => clk, reset => reset, note => note, buzzer => buzzer, note_change => note_change); 

clk_process: process
    begin 
    clk <= '0'; 
    wait for clk_period; 
    clk <= '1'; 
    wait for clk_period; 
    end process; 
    
    process
    begin 
    note <= "01100001";
     note_change <= '1';  
     wait for 10 ns; 
     note_change <= '0'; 
    wait for 20000000 ns; 
    note <= "01000001";
    note_change <= '1'; 
    wait for 10 ns; 
    note_change <= '0';
    wait for 20000000 ns; 
    end process;



end Behavioral;
