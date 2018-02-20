-------------------------------------------------------------------
ENTITY big_adder IS
	GENERIC(N: NATURAL := 8);
	PORT(a,b: IN BIT_VECTOR(N-1 DOWNTO 0);
	     cin: IN BIT;
	     s: OUT BIT_VECTOR(N-1 DOWNTO 0);
	     cout: OUT BIT);
END ENTITY;
-------------------------------------------------------------------
ARCHITECTURE big_adder OF big_adder IS
	----Declaracao de um vetor de bits para o carry:-----------
	SIGNAL carry: BIT_VECTOR(N DOWNTO 0);
	----Declracao do somador completo:-------------------------
	COMPONENT full_adder IS
		PORT(a, b, cin: IN BIT;
		     s, cout: OUT BIT);
	END COMPONENT;
	-----------------------------------------------------------
BEGIN
	carry(0) <= cin;
	gen_adder: FOR i IN a'RANGE GENERATE
		FA: full_adder PORT MAP(a(i), b(i), carry(i), s(i), carry(i+1));
	END GENERATE;
	cout <= carry(N);
END ARCHITECTURE;
-------------------------------------------------------------------
