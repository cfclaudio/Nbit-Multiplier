library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;





---------------------------------------------------------------
------------------- INNER COMPONENTS USED ---------------------
---------------------------------------------------------------

entity fullAdder is 
	port (a, b, cin: in bit;
			  s, cout: out bit);
end fullAdder;

architecture behaviour2 of fullAdder is
	signal s1, c1, c2: bit := '0';
	component halfAdder 
		port(a, b: in bit;
			sum, carry: out bit);
	end component;	
begin
	HA1: halfAdder port map(a, b, s1, c1);
	HA2: halfAdder port map(s1, cin, s, c2);
	cout <= c1 or c2;
end behaviour2;

entity halfAdder is
	port (a, b: in bit;
			sum, carry: out bit);
end halfAdder;

architecture behaviour3 of halfAdder is
begin
	sum <= A xor B;
	carry <= A and B;
end behaviour3;