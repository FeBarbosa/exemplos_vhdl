------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------
ENTITY test_buffered_mux IS
END ENTITY;
------------------------------------------------------------
ARCHITECTURE test_buffered_mux OF test_buffered_mux IS
	---- declaracao do componente -----	
	COMPONENT buffered_mux IS
		PORT(a, b, c, d: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		     sel: IN NATURAL RANGE 0 TO 3;
		     ena: IN STD_LOGIC;
		     y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	---- declaracao dos sinais ------
	SIGNAL a: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL b: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL c: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL d: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL sel: NATURAL RANGE 0 TO 3;
	SIGNAL ena: STD_LOGIC;
	SIGNAL y: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	---- instanciacao do componente---
	dut: buffered_mux PORT MAP(a=>a, b=>b, c=>c, d=>d,
	     sel=>sel, ena=>ena, y=>y);
	---- geracao de a ----
		a <= "00000010";
	---- geracao de b ----
		b <= "00000100";
	---- geracao de c ----
		c <= "00001000";
	---- geracao de d ----
		d <= "00010000";
	---- geracao de sel ----
	PROCESS
	BEGIN
		sel <= 0;
		WAIT FOR 50 ns;
		sel <= 1;
		WAIT FOR 50 ns;
		sel <= 2;
		WAIT FOR 50 ns;
		sel <= 3;
		WAIT FOR 50 ns;
	END PROCESS;
	---- geracao de ena ----
	PROCESS
	BEGIN
		ena <= '1';
		WAIT FOR 200 ns;
		ena <= '0';
		WAIT FOR 200 ns;
	END PROCESS;
END ARCHITECTURE;
------------------------------------------------------------