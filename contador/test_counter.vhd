------------------------------------------
ENTITY test_counter IS
END ENTITY;
------------------------------------------
ARCHITECTURE test_counter OF test_counter IS
	---- declaracao do componente ----
	COMPONENT counter IS
		PORT(clk: IN BIT;
		     count: OUT NATURAL RANGE 0 TO 9);
	END COMPONENT;
	---- declaracao dos sinais ----
	SIGNAL clk: BIT;
	SIGNAL count: NATURAL RANGE 0 TO 9;
BEGIN
	---- instaciacao do componente ----
	dut: counter PORT MAP(clk=>clk, count=>count);
	---- geracao de clk ----
	PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR 30 ns;
		clk <= '1';
		WAIT FOR 30 ns;
	END PROCESS;
END ARCHITECTURE;
------------------------------------------