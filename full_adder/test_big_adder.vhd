----------------------------------------------------------------------
ENTITY test_big_adder IS
	GENERIC(N: INTEGER := 8);
END ENTITY;
----------------------------------------------------------------------
ARCHITECTURE test_big_adder OF test_big_adder IS
	----Declaracao dos sinais:------------------------------------
	SIGNAL a: BIT_VECTOR(N-1 DOWNTO 0);
	SIGNAL b: BIT_VECTOR(N-1 DOWNTO 0);
	SIGNAL cin: BIT := '0';
	SIGNAL s: BIT_VECTOR(N-1 DOWNTO 0);
	SIGNAL cout: BIT;
	---Declaracao do componente:----------------------------------
	COMPONENT big_adder IS
		PORT(a, b: IN BIT_VECTOR(N-1 DOWNTO 0);
		     cin: IN BIT;
		     s: OUT BIT_VECTOR(N-1 DOWNTO 0);
		     cout: OUT BIT);
	END COMPONENT;
BEGIN
	----Instanciacao do componente:-------------------------------
	dut: big_adder PORT MAP(a, b, cin, s, cout);
	--------------------------------------------------------------
	----Geracao de a:---------------------------------------------
	PROCESS
	BEGIN
		a <= "00001100";
		WAIT FOR 30 ns;
		a <= "00000001";
		WAIT FOR 30 ns;
		a <= "10000000";
		WAIT FOR 30 ns;
		a <= "11111111";
		WAIT FOR 30 ns;
	END PROCESS;
	---Geracao de b:----------------------------------------------
	PROCESS
	BEGIN
		b <= "00000011";
		WAIT FOR 30 ns;
		b <= "00000001";
		WAIT FOR 30 ns;
		b <= "01000000";
		WAIT FOR 30 ns;
		b <= "11111111";
		WAIT FOR 30 ns;
	END PROCESS;
END ARCHITECTURE;
	
