-- fpga4student.com FPGA projects, VHDL projects, Verilog projects
-- VHDL project: VHDL code for digital clock on FPGA
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity CLOCK is
port (
   clk_in: in std_logic; -- clock input on FPGA
   clk_out: out std_logic -- clock output 
  );
end CLOCK;

architecture Behavioral of CLOCK is
signal divisor: std_logic_vector(27 downto 0):=(others =>'0');
begin
 process(clk_in)
 begin
 if(rising_edge(clk_in)) then
 divisor <= divisor + x"2FAF07F";
 -- If(divisor>=x"2FAF07F") then -- for running on FPGA -- comment when running simulation
 -- Modify the divisor (x"2FAF07F"=49999999) above to get the clock frequency you want: 
 -- Frequency of clk_out = Frequency of (clk_in) divided by (divisor + 1)
 -- If the frequency of clk_in is 50MHz and the divisor is 49999999=x"2FAF07F", 
 -- the frequency of clk_out is 1Hz
 if(divisor=x"17D7840") then -- replace x"0000001" by x"17D7840" when running on FPGA  
 clk_out <= '1';
 else 
 clk_out <= '0';
 end if;
 end if;
 end process;
end Behavioral;