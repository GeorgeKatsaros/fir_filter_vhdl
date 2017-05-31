
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity fir is
port (
clk : in std_logic;
x:in std_logic_vector(7 downto 0);
y:out std_logic_vector (15 downto 0));
end fir;

architecture Behavioral of fir is
component dff 
port (
clk : in std_logic;
D : in signed (7 downto 0);
Q : out signed (7 downto 0));
end component;



--signals
signal xin: signed (7 downto 0);  
signal q1,q2,q3 : signed (7 downto 0) ; --- eksodoi twn DFF
signal add0,add1,add2 : signed (15 downto 0) ; --- ekswdoi twn adders
signal c0,c1,c2,c3 : signed (7 downto 0 ); --- oi suntelestes


begin

xin <=signed(x); -- cast to shma eiswdou gia prakseis

-------
c0 <= to_signed ( -2 , 8 );  --sunteleset cast se signed
c1 <= to_signed ( -1 , 8 );
c2 <= to_signed ( 1 , 8 );
c3 <= to_signed ( 2 , 8 );
-----------
add0<= (xin * c0) + (q1 * c1);  
add1<= add0 + (q2 * c2);
add2 <= add1 +(q3 *c3);
---------
y <= std_logic_vector(add2); --cast se std logic gia thn eksodo
dff1 : dff port map (clk,xin,q1);  -- clk , D ,Q
dff2 : dff port map (clk ,q1,q2);
dff3 : dff port map (clk,q2,q3);

end Behavioral;
