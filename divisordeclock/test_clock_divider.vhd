-------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------
ENTITY test_clock_divider IS
END ENTITY;
-------------------------------------------
ARCHITECTURE test_clock_divider OF test_clock_divider IS
	-----component declaration:-----
	COMPONENT clock_divider IS
		PORT(clk, ena: IN STD_LOGIC;
			output: OUT STD_LOGIC);
	END COMPONENT;
	-----signal declarations:-------
	SIGNAL clk: STD_LOGIC := '0';
	SIGNAL ena: STD_LOGIC := '0';
	SIGNAL output: STD_LOGIC;
BEGIN
	-----component instatiation:----
	dut: clock_divider PORT MAP (clk => clk, ena=>ena, output=>output);
	-----generate clock:------------
	PROCESS
	BEGIN
		WAIT FOR 30 ns;
		clk <=  NOT clk;
	END PROCESS;
	-----generate enable:-----------
	PROCESS
	BEGIN
		WAIT FOR 60 ns;
		ena <= '1';
		WAIT; --optional
	END PROCESS;
END ARCHITECTURE;