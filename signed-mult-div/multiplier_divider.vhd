----Signed mult/div with STD_LOGIC_VECTOR:-----------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-----------------------------------------------------------------
ENTITY multiplier_divider IS
	GENERIC(N: INTEGER := 8); -- number of bits
	PORT(a, b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	     prod: OUT STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);
	     div: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END ENTITY;
-----------------------------------------------------------------
ARCHITECTURE multiplier_divider OF multiplier_divider IS
	SIGNAL a_sig: SIGNED(N-1 DOWNTO 0);
	SIGNAL b_sig: SIGNED(N-1 DOWNTO 0);
BEGIN
	a_sig <= SIGNED(a);
	b_sig <= SIGNED(b);
	prod <= STD_LOGIC_VECTOR(a_sig * b_sig);
	div <= STD_LOGIC_VECTOR(a_sig / b_sig);
END ARCHITECTURE;