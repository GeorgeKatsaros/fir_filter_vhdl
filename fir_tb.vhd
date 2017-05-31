--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:44:59 05/20/2017
-- Design Name:   
-- Module Name:   /home/katsaros/work/vhdl designs/fir_filter/fir_tb.vhd
-- Project Name:  fir_filter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY fir_tb IS
END fir_tb;
 
ARCHITECTURE behavior OF fir_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fir
    PORT(
         clk : IN  std_logic;
         x : IN  std_logic_vector(7 downto 0);
         y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal x : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fir PORT MAP (
          clk => clk,
          x => x,
          y => y
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*2;

      -- insert stimulus here
x<= std_logic_vector(to_signed(3,8)); wait for clk_period;	
x<= std_logic_vector(to_signed(2,8)); wait for clk_period;
x<= std_logic_vector(to_signed(4,8)); wait for clk_period;
x<= std_logic_vector(to_signed(1,8)); wait for clk_period;
x<= std_logic_vector(to_signed(3,8)); wait for clk_period;
x<= std_logic_vector(to_signed(2,8)); wait for clk_period;
x<= std_logic_vector(to_signed(4,8)); wait for clk_period;
x<= std_logic_vector(to_signed(1,8)); wait for clk_period;

      wait;
   end process;

END;
