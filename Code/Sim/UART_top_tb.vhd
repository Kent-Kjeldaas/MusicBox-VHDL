------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 10/25/2016 05:01:27 PM
---- Design Name: 
---- Module Name: UART_top_tb - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity UART_top_tb is
----  Port ( );
--end UART_top_tb;

--architecture Behavioral of UART_top_tb is

--    component UART is 
--        Port ( clk, reset : in STD_LOGIC;
--           rx : in STD_LOGIC;
--           rx_done_tick : out STD_LOGIC;
--           dout : out STD_LOGIC_VECTOR (7 downto 0));
--    end component; 
    
--    signal clk,reset : std_logic; 
--    signal rx : std_logic;
--    signal rx_done_tick : std_logic; 
--    signal dout : std_logic_vector(7 downto 0); 
--    constant clk_period : time := 10 ns; 
--begin
   
--    uut: UART
--    port map(   clk => clk, reset => reset,
--                rx => rx, rx_done_tick => rx_done_tick,
--                dout => dout); 
                
--    clk_process: process
--    begin 
--    clk <= '0'; 
--    wait for clk_period/2; 
--    clk <= '1'; 
--    wait for clk_period/2; 
--    end process; 
    
--    send_process: process
--    begin 
--    rx <= '0'; 
--    wait for 52 ns; 
--    rx <= '1'; 
--    wait for 52 ns; 
--    rx <= '0'; 
--    wait for 52 ns; 
--    rx <= '1'; 
--    wait for 52 ns;
--    rx <= '0'; 
--    wait for 52 ns; 
--    rx <= '1'; 
--    wait for 52 ns;
--    rx <= '1'; 
--    wait for 52 ns; 
--    rx <= '1'; 
--    wait for 52 ns; 
--    rx <= '1'; 
--    wait for 52 ns; 
--    rx <= '0'; 
--    wait for 52 ns; 
--    end process; 
    
    



--end Behavioral;
