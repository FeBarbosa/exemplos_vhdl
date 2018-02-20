------------------------------------------
ENTITY counter IS
	PORT(clk: IN BIT;
	     count: OUT NATURAL RANGE 0 TO 9);
END ENTITY;
------------------------------------------
ARCHITECTURE counter OF counter IS
BEGIN
	PROCESS(clk)
		VARIABLE temp: NATURAL RANGE 0 TO 10;
	BEGIN
		IF(clk'EVENT AND clk='1') THEN
			temp := temp + 1;
			IF (temp = 10) THEN
				temp := 0;
			END IF;
		END IF;
		count <= temp;
	END PROCESS;
END ARCHITECTURE;
------------------------------------------
