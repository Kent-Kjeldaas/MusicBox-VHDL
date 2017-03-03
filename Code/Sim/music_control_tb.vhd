----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2016 07:57:31 PM
-- Design Name: 
-- Module Name: music_control_tb - Behavioral
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

entity music_control_tb is
--  Port ( );
end music_control_tb;

architecture Behavioral of music_control_tb is

component music_control 
    Port ( clk, reset : in STD_LOGIC;
       start : in STD_LOGIC;
       note : std_logic_vector(7 downto 0); 
       addr : out integer;
       max_tick : out std_logic);
    end component;
    
    signal clk, reset : std_logic; 
    signal start : std_logic; 
    signal addr : integer; 
    signal note: std_logic_vector(7 downto 0);
    signal max_tick: std_logic;  
    constant clk_period : time := 10 ns; 
    
begin

    uut: music_control
    port map(   clk => clk, reset => reset, 
                start => start,note => note,
                addr => addr, max_tick => max_tick); 
     
    clk_process: process
    begin 
        clk <= '0'; 
        wait for clk_period/2;
        clk <= '1'; 
        wait for clk_period/2; 
    end process; 
    

    enable_process: process
    begin 
        start <= '0';
        wait for 150 ns; 
        start <= '1'; 
        wait for 1000000000 ns; 
    end process; 
    
    note_process: process
    begin 
        note <= "01000001"; 
        wait for 10000000 ns; 
        note <= "01100001"; 
        wait for 10000000 ns; 
    end process; 
    

                
  
    

end Behavioral;
