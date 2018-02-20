-------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------
ENTITY clock_divider IS
	PORT(clk, ena: IN STD_LOGIC;
		 output: OUT STD_LOGIC);
END ENTITY;
-------------------------------------------
ARCHITECTURE clock_divider OF clock_divider IS
	CONSTANT max: NATURAL := 5;
BEGIN
	PROCESS(clk)
		VARIABLE count: NATURAL RANGE 0 TO max := 0;
		VARIABLE temp: STD_LOGIC := '0';
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			IF (ena = '1') THEN
				count := count + 1;
				IF (count=max) THEN
					temp := NOT temp;
					count := 0;
				END IF;
			END IF;
			output <= temp;
		END IF;
	END PROCESS;
END ARCHITECTURE;
-------------------------------------------