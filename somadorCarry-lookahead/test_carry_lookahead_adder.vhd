----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------
ENTITY test_carry_lookahead_adder IS
END test_carry_lookahead_adder;
----------------------------------------------------
ARCHITECTURE structure OF test_carry_lookahead_adder IS
	--Declaracao do componente:----
	COMPONENT carry_lookahead_adder IS
	 	PORT(a, b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		     cin: IN STD_LOGIC;
		     sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		     cout: OUT STD_LOGIC);
	END COMPONENT;
	--Declaracao dos sinais:-------
	SIGNAL a: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100"; -- 4
	SIGNAL b: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011"; -- 3
	SIGNAL cin: STD_LOGIC := '0';
	SIGNAL sum: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL cout: STD_LOGIC;
BEGIN
	--Instaciacao do componente----
	dut: carry_lookahead_adder PORT MAP(a => a, b => b, 
	     cin => cin, sum => sum, cout => cout);
	--Geracao de a:---------------
	PROCESS
	BEGIN
		WAIT FOR 50 ns;
		a <= "0101";  -- 5
		WAIT FOR 50 ns;
		a <= "0111";  -- 7
		WAIT FOR 50 ns;
		a <= "0001";  -- 1
	END PROCESS;
	
	--Geracao de b:---------------
	PROCESS
	BEGIN
		WAIT FOR 50 ns;
		b <= "0110";  -- 6
		WAIT FOR 50 ns;
		b <= "0010";  -- 2
		WAIT FOR 50 ns;
		b <= "0001"; -- 1
	END PROCESS;
END structure;	
----------------------------------	