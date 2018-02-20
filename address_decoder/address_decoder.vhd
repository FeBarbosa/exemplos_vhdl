--DESCRICAO: decodificador de endereco de 3 entradas com codigo one-hot
-------------------------------------------------------------------------
ENTITY address_decoder IS
	PORT(x: IN BIT_VECTOR(2 DOWNTO 0);
	     y: OUT BIT_VECTOR(7 DOWNTO 0));
END ENTITY;
-------------------------------------------------------------------------
ARCHITECTURE address_decoder OF address_decoder IS
BEGIN
	y <= (0 => '1', OTHERS => '0') WHEN x = "000" ELSE
  	     (1 => '1', OTHERS => '0') WHEN x = "001" ELSE
  	     (2 => '1', OTHERS => '0') WHEN x = "010" ELSE
  	     (3 => '1', OTHERS => '0') WHEN x = "011" ELSE
  	     (4 => '1', OTHERS => '0') WHEN x = "100" ELSE
  	     (5 => '1', OTHERS => '0') WHEN x = "101" ELSE
  	     (6 => '1', OTHERS => '0') WHEN x = "110" ELSE
  	     (7 => '1', OTHERS => '0');
END ARCHITECTURE;