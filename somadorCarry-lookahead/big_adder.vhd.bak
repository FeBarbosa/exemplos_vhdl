-----Main code:-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------
ENTITY big_adder IS
	PORT(a, b: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	     cin: IN STD_LOGIC;
	     sum: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	     cout: OUT STD_LOGIC
	     overflow: OUT STD_LOGIC);
END ENTITY;
--------------------------------------------------------------
ARCHITECTURE big_adder OF big_adder IS
	SIGNAL carry: STD_LOGIC_VECTOR(4 DOWNTO 0);
	------------------------------------------------------
	COMPONENT carry_lookahead_adder IS
		PORT(a, b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		cin: IN STD_LOGIC;
		sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		cout: OUT STD_LOGIC);
	END COMPONENT;
	------------------------------------------------------
BEGIN
	carry(0) <= cin;
	gen_adder: FOR i IN 1 TO 4 GENERATE
		adder: carry_lookahead_adder PORT MAP(
			a(4*i-1 DOWNTO 4*i-4),
			b(4*i-1 DOWNTO 4*i-4),
			carry(i-1),
			sum(4*i-1 DOWNTO 4*i-4),
			carry(i));
	END GENERATE;
	cout <= carry(4);
END big_adder;
--------------------------------------------------------------