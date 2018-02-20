--DESCRICAO: somador completo de 1 bit
-----------------------------------------------------------
ENTITY full_adder IS
	PORT(a, b, cin: IN BIT;
	     s, cout: OUT BIT);
END ENTITY;
-----------------------------------------------------------
ARCHITECTURE full_adder OF full_adder IS
BEGIN
	s <= a XOR b XOR cin;
	cout <= (a AND b) OR (a AND cin) OR (b AND cin);
END ARCHITECTURE;
-----------------------------------------------------------