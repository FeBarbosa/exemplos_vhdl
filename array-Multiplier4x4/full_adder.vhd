--DESCRICAO: somador completo de 1 bit
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------------
ENTITY full_adder IS
	PORT(a, b, cin: IN STD_LOGIC;
	     s, cout: OUT STD_LOGIC);
END ENTITY;
-----------------------------------------------------------
ARCHITECTURE full_adder OF full_adder IS
BEGIN
	s <= a XOR b XOR cin;
	cout <= (a AND b) OR (a AND cin) OR (b AND cin);
END ARCHITECTURE;
-----------------------------------------------------------