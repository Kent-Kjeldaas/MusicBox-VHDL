-- Listing 4.11
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity buzz_clk is

   port(
      clk, reset: in std_logic;
      toggle : in std_logic; 
      frequency : in integer; 
      note_change : in std_logic;
      tick_out : out std_logic
   );
end buzz_clk;

architecture arch of buzz_clk is
   signal r_reg: integer := 0;
   signal output : std_logic := '0'; 
   constant gnd : std_logic := '0'; 
   signal toggle_out : std_logic; 
begin

    toggle_unit: entity work.toggle(arch) 
    port map(   clk => clk, reset => reset, 
                toggle => toggle, tick_in => output,tick_out => tick_out); 
   -- register
   process(clk,reset,r_reg,note_change)
   begin
      if (reset='1') then
         r_reg <= 0;
      elsif (clk'event and clk='1') then
      if (note_change = '1') then 
            r_reg <= 0; 
        else 
         r_reg <= r_reg +1;
         if(r_reg >= frequency-1) then 
            output <= not output; 
            r_reg <= 0; 
            end if;
        end if; 
      end if;
   end process;
   -- output logic
end arch;