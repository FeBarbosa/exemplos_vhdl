---------------------------------------------------------------------
ENTITY test_address_decoder IS
END ENTITY;
---------------------------------------------------------------------
ARCHITECTURE test_address_decoder OF test_address_decoder IS
	----Declaracao do componente:--------------------------------	
	COMPONENT address_decoder IS
		PORT(x: IN BIT_VECTOR(2 DOWNTO 0);
		     y: OUT BIT_VECTOR(7 DOWNTO 0));
	END COMPONENT;	
	----Declaracao dos sinais:-----------------------------------
	SIGNAL x: BIT_VECTOR(2 DOWNTO 0);
	SIGNAL y: BIT_VECTOR(7 DOWNTO 0);
BEGIN
	----Instaciacao do componente:-------------------------------
	dut: address_decoder PORT MAP(x => x, y => y);
	
	----valores de x:--------------------------------------------
	PROCESS
	BEGIN
		x <= "000";
		WAIT FOR 30 ns;
		x <= "100";
		WAIT FOR 30 ns;
		x <= "110";
		WAIT FOR 30 ns;
		x <= "010";
		WAIT FOR 30 ns;
	END PROCESS;
END ARCHITECTURE;
----------------------------------------------------------------------