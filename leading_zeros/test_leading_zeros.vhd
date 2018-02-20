------------------------------------------------------------------
ENTITY test_leading_zeros IS
	GENERIC (N: INTEGER := 8);
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE test_leading_zeros OF test_leading_zeros IS
	----declaracao do leading_zeros:--------------------------
	COMPONENT leading_zeros IS
		PORT (x: IN BIT_VECTOR(N-1 DOWNTO 0);
	      	      y: OUT NATURAL RANGE 0 TO N);
	END COMPONENT;
	----declaracao dos sinais:--------------------------------
	SIGNAL x: BIT_VECTOR(N-1 DOWNTO 0);
	SIGNAL y: NATURAL RANGE 0 TO N;
BEGIN
	----instanciacao do leading_zeros:------------------------
	dut: leading_zeros PORT MAP(x=>x, y=>y);
	
	--valores de x:-------------------------------------------
	PROCESS
	BEGIN
		x <= "00110011";
		WAIT FOR 30 ns;
		x <= "00000011";
		WAIT FOR 30 ns;
		x <= "10110011";
		WAIT FOR 30 ns;
		x <= "00000000";
		WAIT FOR 30 ns;
	END PROCESS;
END ARCHITECTURE;