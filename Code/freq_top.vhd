----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 05:19:48 PM
-- Design Name: 
-- Module Name: freq_top - arch
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

entity freq_top is
    
    Port ( clk, reset : in STD_LOGIC;
           note : in STD_LOGIC_VECTOR (7 downto 0);
           note_change : STD_LOGIC; 
           buzzer : out STD_LOGIC);
end freq_top;

architecture arch of freq_top is
signal frequency : integer; 
signal output : std_logic; 
begin

    freq_chooser: entity work.freq_chooser(arch)
    port map(note => note, frequency => frequency);

    buzz_clk_unit: entity work.buzz_clk(arch) 
    port map(clk => clk, reset => reset, note_change => note_change,
           frequency => frequency,max_tick => output); 

buzzer <= output; 
end arch;
