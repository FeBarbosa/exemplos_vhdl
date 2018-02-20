--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
--------------------------------------------------------------------------------
ENTITY test_multiplier_divider IS
	GENERIC(N: INTEGER := 8);
END ENTITY;
--------------------------------------------------------------------------------
ARCHITECTURE test_multiplier_divider OF test_multiplier_divider IS

	----Declaracao do componente:-------------------------------------------
	COMPONENT multiplier_divider IS
		PORT(a, b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		     prod: OUT STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);
		     div: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
	END COMPONENT;

	----Declaracao dos sinais:----------------------------------------------
	SIGNAL a: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL b: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL prod: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);
	SIGNAL div: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
BEGIN
	----Instanciacao do componente:----------------------------------------
	dut: multiplier_divider PORT MAP(a => a, b => b, prod => prod, div => div);

	----Geracao do sinal a:
	PROCESS
	BEGIN
		a <= STD_LOGIC_VECTOR(TO_SIGNED(8, 8));
		WAIT FOR 30 ns;
		a <= STD_LOGIC_VECTOR(TO_SIGNED(-8, 8));
		WAIT FOR 30 ns;
		a <= STD_LOGIC_VECTOR(TO_SIGNED(-12, 8));
		WAIT FOR 30 ns;
		a <= STD_LOGIC_VECTOR(TO_SIGNED(0, 8));
		WAIT FOR 30 ns;
	END PROCESS;

	----Geracao do sinal b:
	PROCESS
	BEGIN
		b <= STD_LOGIC_VECTOR(TO_SIGNED(2, 8));
		WAIT FOR 30 ns;
		b <= STD_LOGIC_VECTOR(TO_SIGNED(-8, 8));
		WAIT FOR 30 ns;
		b <= STD_LOGIC_VECTOR(TO_SIGNED(20, 8));
		WAIT FOR 30 ns;
		b <= STD_LOGIC_VECTOR(TO_SIGNED(0, 8));
		WAIT FOR 30 ns;
	END PROCESS;

END;
--------------------------------------------------------------------------------