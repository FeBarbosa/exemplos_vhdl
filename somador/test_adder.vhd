-----test file (test_adder.vhd)---------------------------
ENTITY test_adder IS
END ENTITY;
----------------------------------------------------------
ARCHITECTURE test_adder OF test_adder IS
	----component declaration:
	COMPONENT adder IS
		PORT (a,b: IN INTEGER RANGE 0 TO 255;
		      sum: OUT INTEGER RANGE 0 TO 255;
		      cout: OUT BIT);
	END COMPONENT;
	----signal declarations:
	SIGNAL a: INTEGER RANGE 0 TO 255;
	SIGNAL b: INTEGER RANGE 0 TO 255;
	SIGNAL sum: INTEGER RANGE 0 TO 511;
	SIGNAL cout: BIT;
BEGIN
	----component instatiation:
	dut: adder PORT MAP (a => a, b => b, sum => sum, cout => cout);
	----generate a:---
	PROCESS
	BEGIN
		a <= 0;
		WAIT FOR 50 ns;
		a <= 150;
		WAIT FOR 50 ns;
		a <= 200;
		WAIT FOR 50 ns;
		a <= 250;
		WAIT FOR 50 ns;
	END PROCESS;
	----generate b:---
	PROCESS
	BEGIN
		b <= 0;
		WAIT FOR 75 ns;
		b <= 120;
		WAIT FOR 75 ns;
		b <= 240;
		WAIT FOR 50 ns;
	END PROCESS;
END ARCHITECTURE;
	