ENTITY test_address_decoder2 IS
	GENERIC(N: POSITIVE := 3);
END ENTITY;
-------------------------------------------------------------------------
ARCHITECTURE test_address_decoder2 OF test_address_decoder2 IS
	----Declaracao do componente:------------------------------------
	COMPONENT address_decoder2 IS
		PORT(x: IN INTEGER RANGE 0 TO 2**N-1;
		     y: OUT BIT_VECTOR(2**N-1 DOWNTO 0));
	END COMPONENT; 
	----Declaracao de sinais:----------------------------------------
	SIGNAL x: INTEGER RANGE 0 TO 2**N-1;
	SIGNAL y: BIT_VECTOR(2**N-1 DOWNTO 0);
BEGIN
	----Instanciacao do componente:----------------------------------
	dut: address_decoder2 PORT MAP(x => x, y => y);

	----Valores de x:------------------------------------------------
	PROCESS
	BEGIN
		x <= 1;
		WAIT FOR 30 ns;
		x <= 0;
		WAIT FOR 30 ns;
		x <= 7;
		WAIT FOR 30 ns;
		x <= 2;
		WAIT FOR 30 ns;
	END PROCESS;
END ARCHITECTURE;