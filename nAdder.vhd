---------------------------------------------------------------
------------------------ N BIT ADDER --------------------------
---------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity nAdder is 
	generic (N: integer := 4);
	port (X, Y: in std_logic_vector(N-1 downto 0);
			 carryIn: in std_logic;
			   sum: out std_logic_vector(N-1 downto 0);
		  carryOut: out std_logic);
end nAdder;

architecture behaviour1 of nAdder is
	signal t: std_logic_vector(N downto 0);	-- inner signal for carrybits 
	component fullAdder 
		port(a, b, cin: in std_logic;
				 s, cout: out std_logic);
	end component;
begin
	t(0) <= carryin;
	carryOut <= t(N);
	
	FA: for i in 0 to n-1 generate
		FA_i: fullAdder port map(X(i), Y(i), t(i), sum(i), t(i+1));
	end generate;
end behaviour1;



---------------------------------------------------------------
------------------------- FULL ADDER --------------------------
---------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity fullAdder is 
	port (a, b, cin: in std_logic;
			  s, cout: out std_logic);
end fullAdder;

architecture behaviour2 of fullAdder is
	signal s1, c1, c2: std_logic := '0';
	component halfAdder 
		port(a, b: in std_logic;
			sum, carry: out std_logic);
	end component;	
begin
	HA1: halfAdder port map(a, b, s1, c1);
	HA2: halfAdder port map(s1, cin, s, c2);
	cout <= c1 or c2;
end behaviour2;

---------------------------------------------------------------
------------------------- HALF ADDER --------------------------
---------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity halfAdder is
	port (a, b: in std_logic;
			sum, carry: out std_logic);
end halfAdder;

architecture behaviour3 of halfAdder is
begin
	sum <= A xor B;
	carry <= A and B;
end behaviour3;