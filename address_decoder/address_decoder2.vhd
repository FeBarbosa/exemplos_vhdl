--DESCRICAO: Decodificador de endereco de 3 entradas com codigo one_hot
---------------------------------------------------------------------------
ENTITY address_decoder2 IS
	GENERIC(N: POSITIVE := 3);
	PORT(x: IN INTEGER RANGE 0 TO 2**N-1;
	     y: OUT BIT_VECTOR(2**N-1 DOWNTO 0));
END ENTITY;
---------------------------------------------------------------------------
ARCHITECTURE address_decoder2 OF address_decoder2 IS
BEGIN
	gen: FOR i IN y'REVERSE_RANGE GENERATE
		y(i) <= '1' WHEN i =  x ELSE '0';
	END GENERATE;
END ARCHITECTURE;