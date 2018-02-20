-- DESCRICAO: verifica quantos zeros consecutivos existe a esquerda
-- (MSB)de uma palavra de 8 bits

------------------------------------------------------------------
ENTITY leading_zeros IS
	GENERIC (N: INTEGER := 8);
	PORT (x: IN BIT_VECTOR(N-1 DOWNTO 0);
	      y: OUT NATURAL RANGE 0 TO N);
END ENTITY;
------------------------------------------------------------------
ARCHITECTURE leading_zeros OF leading_zeros IS
BEGIN
	PROCESS(x)
		VARIABLE temp: NATURAL RANGE 0 TO N;
	BEGIN
		temp := 0;
		FOR i IN x'RANGE LOOP
			EXIT WHEN x(i) = '1';
			temp := temp +1;
		END LOOP;
		y <= temp;
	END PROCESS;
END ARCHITECTURE;