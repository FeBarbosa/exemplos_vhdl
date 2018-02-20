--DESCRICAO: multiplicador com sinal 4x4 com saida de 16 bits
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------------------
ENTITY test_array_multiplier4x4 IS
END ENTITY;
--------------------------------------------------------------------------------
ARCHITECTURE test_array_multiplier4x4 OF test_array_multiplier4x4 IS

	----Declaracao do componente:-------------------------------------------
	COMPONENT array_multiplier4x4 IS
		PORT(x, y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		     z: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	----Declaracao dos sinais:----------------------------------------------
	SIGNAL x: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL y: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL z: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	--Instaciacao do componente:--------------------------------------------
	dut: array_multiplier4x4 PORT MAP(x => x, y => y, z => z);

	--Geracao do sinal x:---------------------------------------------------
	PROCESS
	BEGIN
		x <= "0001";
		WAIT FOR 30 ns;
		x <= "0010";
		WAIT FOR 30 ns;
		x <= "0011";
		WAIT FOR 30 ns;
		x <= "1000";
		WAIT FOR 30 ns;
		x <= "1111";
		WAIT FOR 30 ns;
		x <= "1001";
		WAIT FOR 30 ns;
	END PROCESS;

	--Geracao do sinal y:---------------------------------------------------
	PROCESS
	BEGIN
		y <= "0001";
		WAIT FOR 30 ns;
		y <= "0010";
		WAIT FOR 30 ns;
		y <= "0011";
		WAIT FOR 30 ns;
		y <= "1000";
		WAIT FOR 30 ns;
		y <= "1000";
		WAIT FOR 30 ns;
		y <= "0111";
		WAIT FOR 30 ns;
	END PROCESS;

END ARCHITECTURE;
--------------------------------------------------------------------------------