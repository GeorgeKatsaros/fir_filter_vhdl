----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:11:00 05/20/2017 
-- Design Name: 
-- Module Name:    dff - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.numeric_std.all;

entity dff is
port(
clk : in std_logic;
D : in signed (7 downto 0);
Q :out signed (7 downto 0));
end dff;

architecture Behavioral of dff is

begin
process (clk)
begin
if (clk'event and clk='1') then
Q<=D;
end if;
end process;

end Behavioral;

