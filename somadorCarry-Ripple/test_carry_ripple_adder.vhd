-------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------
ENTITY test_carry_ripple_adder IS
	GENERIC(N: INTEGER := 8); --numero de bits
END ENTITY;
-------------------------------------
ARCHITECTURE structure OF test_carry_ripple_adder IS
	----Declaracao do componente:-----
	COMPONENT carry_ripple_adder IS
		PORT(a,b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		     cin: IN STD_LOGIC;
		     s: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		     cout: OUT STD_LOGIC);
	END COMPONENT;
	----Declaracao dos sinais:--------
	SIGNAL a: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL b: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL cin: STD_LOGIC := '0';
	SIGNAL s: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL cout: STD_LOGIC;
BEGIN
	--Instanciacao do componente-----
	dut: carry_ripple_adder PORT MAP(a=>a, b=>b, cin=>cin,
	     s=>s, cout=>cout);
	--Geracao de a:------------------
	PROCESS
	BEGIN
		a <= "00010111"; -- 23
		WAIT FOR 50 ns;
		a <= "01100100"; -- 100
		WAIT FOR 50 ns;
		a <= "01111000"; -- 120
		WAIT FOR 50 ns;
		a <= "10000011"; -- 3
		WAIT FOR 50 ns;

	END PROCESS;
	--Geracao de b:------------------
	PROCESS
	BEGIN
		b <= "00000111"; -- 7
		WAIT FOR 50 ns;
		b <= "00010111"; -- 23
		WAIT FOR 50 ns;
		b <= "00001000"; -- 8
		WAIT FOR 50 ns;
		b <= "10000011"; -- 3
		WAIT FOR 50 ns;
	END PROCESS;
END ARCHITECTURE;
-------------------------------------