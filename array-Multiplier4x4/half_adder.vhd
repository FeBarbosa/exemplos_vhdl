LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------------------------
ENTITY half_adder IS
	PORT(a, b: IN STD_LOGIC;
	     s, cout: OUT STD_LOGIC);
END ENTITY;
-----------------------------------------------------------------------
ARCHITECTURE half_adder OF half_adder IS
BEGIN
	s <= a XOR b;
	cout <= a AND b;
END ARCHITECTURE;
-----------------------------------------------------------------------