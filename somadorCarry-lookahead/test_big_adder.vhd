--TESTE DO SOMADOR CARRY-RIPPLE 16 BITS, LOOKAHEAD INTERNO 4 BITS--
-------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-------------------------------------------------------------
ENTITY test_big_adder IS
END ENTITY;
-------------------------------------------------------------
ARCHITECTURE test_big_adder OF test_big_adder IS
	-----Declaracao do somador:--------------------------
	COMPONENT big_adder IS
		PORT(a, b: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		     cin: IN STD_LOGIC;
		     sum: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		     cout: OUT STD_LOGIC);
	END COMPONENT;
	-----Declracao dos sinais:---------------------------
	SIGNAL a: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL b: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL cin: STD_LOGIC := '0';
	SIGNAL sum: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL cout: STD_LOGIC;
BEGIN
	--Instaciacao do somador:----------------------------
	dut: big_adder PORT MAP(a=>a, b=>b, cin=>cin, 
				sum=>sum, cout=>cout);
	----Valores de a:------------------------------------
	PROCESS
	BEGIN
		a <= STD_LOGIC_VECTOR(TO_SIGNED(15, 16));
		WAIT FOR 50 ns;
		a <= STD_LOGIC_VECTOR(TO_SIGNED(12, 16));
		WAIT FOR 50 ns;
		a <= STD_LOGIC_VECTOR(TO_SIGNED(2017, 16));
		WAIT FOR 50 ns;
	END PROCESS;
	----Valores de b:------------------------------------
	PROCESS
	BEGIN
		b <= STD_LOGIC_VECTOR(TO_SIGNED(15, 16));
		WAIT FOR 50 ns;
		b <= STD_LOGIC_VECTOR(TO_SIGNED(455, 16));
		WAIT FOR 50 ns;
		b <= STD_LOGIC_VECTOR(TO_SIGNED(-1994, 16));
		WAIT FOR 50 ns;
	END PROCESS;
END ARCHITECTURE;
---------------------------------------------------------