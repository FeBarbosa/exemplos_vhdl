-------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------
ENTITY test_testbench IS
END ENTITY;
-------------------------------------------
ARCHITECTURE testbench OF test_testbench IS
	SIGNAL clock: STD_LOGIC := '1';
	SIGNAL reset: STD_LOGIC := '0';
	CONSTANT wave: STD_LOGIC_VECTOR(1 TO 8) := "10110100";
	SIGNAL c: STD_LOGIC := '0';
	SIGNAL d: STD_LOGIC := '1';
	SIGNAL e: NATURAL RANGE 0 TO 255;
BEGIN
	-------------------------------------------------
	-- CASO 1: Forma de onda repetida regular (clock)
	PROCESS
	BEGIN
		WAIT FOR 30 ns;
		clock <= NOT clock;
	END PROCESS;
	-------------------------------------------------
	-- CASO 2: Forma de onda de um só pulso (reset)
	PROCESS
	BEGIN
		WAIT FOR 30 ns;
		reset <= '1';
		WAIT FOR 30 ns;
		reset <= '0';
		WAIT;
	END PROCESS;
	-------------------------------------------------
	-- Forma de onda não repetida irregular
	PROCESS
	BEGIN
		FOR i IN wave'RANGE LOOP
			c <= wave(i);
			WAIT FOR 30 ns;
		END LOOP;
		WAIT;
	END PROCESS;
	-------------------------------------------------
	-- Forma de onda repetida irregular
	PROCESS
	BEGIN
		FOR i IN wave'RANGE LOOP
			d <= wave(i);
			WAIT FOR 30 ns;
		END LOOP;
		--WAIT;
	END PROCESS;
	-------------------------------------------------
	-- Forma de onda multibit
	PROCESS
	BEGIN
		e <= 0;
		WAIT FOR 120 ns;
		e <= 33;
		WAIT FOR 120 ns;
		e <= 255;
		WAIT FOR 60 ns;
		e <= 99;
		WAIT FOR 180 ns;
	END PROCESS;
	-------------------------------------------------
END ARCHITECTURE;
-------------------------------------------