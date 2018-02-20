--DESCRICAO: multiplicador com/sem sinal 4x4 com saida de 8 bits
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------------------
ENTITY array_multiplier4x4 IS
	PORT(x, y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	        z: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;
--------------------------------------------------------------------------------
ARCHITECTURE array_multiplier4x4 OF array_multiplier4x4 IS
	----Declaracao do half_adder:-------------------------------------------
	COMPONENT half_adder IS
		PORT(a, b: IN STD_LOGIC;
		     s, cout: OUT STD_LOGIC);
	END COMPONENT;
	----Declaracao do full_adder:-------------------------------------------
	COMPONENT full_adder IS
		PORT(a, b, cin: IN STD_LOGIC;
		     s, cout: OUT STD_LOGIC);
	END COMPONENT;
	-----Declaracao dos sinais auxiliares:----------------------------------

	-- sinais auxiliares para gerar os produtos parciais(pp):
	SIGNAL y0: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL y1: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL y2: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL y3: STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	-- produtos parciais(pp):
	SIGNAL pp0: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL pp1: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL pp2: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL pp3: STD_LOGIC_VECTOR(3 DOWNTO 0);

	-- carry's:
	SIGNAL c0: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL c1: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL c2: STD_LOGIC_VECTOR(4 DOWNTO 0); -- 1 bit a mais para o mapeamento do carry-out do ultimo HA
	
	-- somas temporaris:
	SIGNAL sums: STD_LOGIC_VECTOR(5 DOWNTO 0);  

BEGIN
	y0 <= (OTHERS => y(0));
	y1 <= (OTHERS => y(1));
	y2 <= (OTHERS => y(2));
	y3 <= (OTHERS => y(3));

	--Geracao dos produtos parciais(pp):------------------------------------
	pp0 <= y0 AND x;
	pp1 <= y1 AND x;
	pp2 <= y2 AND x;
	pp3 <= y3 AND x;
	
	z(0) <= pp0(0); -- z0
	

	--stage 0
	HA0: half_adder PORT MAP(a => pp0(1), b => pp1(0), s => z(1), cout => c0(0)); -- z1
	FA0: full_adder PORT MAP(pp0(2), pp1(1), c0(0), sums(0), c0(1));
	FA1: full_adder PORT MAP("NOT"(pp0(3)), pp1(2), c0(1), sums(1), c0(2));
	FA2: full_adder PORT MAP('1', "NOT"(pp1(3)), c0(2), sums(2), c0(3));

	--stage 1
	HA1: half_adder PORT MAP(sums(0), pp2(0), z(2), c1(0)); -- z2
	FA3: full_adder PORT MAP(sums(1), pp2(1), c1(0), sums(3), c1(1));
	FA4: full_adder PORT MAP(sums(2), pp2(2), c1(1), sums(4), c1(2)); 
	FA5: full_adder PORT MAP(c0(3), "NOT"(pp2(3)), c1(2), sums(5), c1(3));

	--stage 2:
	HA2: half_adder PORT MAP(sums(3), "NOT"(pp3(0)), z(3), c2(0)); -- z3
	FA6: full_adder PORT MAP(sums(4), "NOT"(pp3(1)), c2(0), z(4), c2(1)); -- z4
	FA7: full_adder PORT MAP(sums(5), "NOT"(pp3(2)), c2(1), z(5), c2(2)); -- z5 
	FA8: full_adder PORT MAP(c1(3), pp3(3), c2(2), z(6), c2(3)); -- z6
	HA3: half_adder PORT MAP(c2(3), '1', z(7), c2(4)); -- z7

END ARCHITECTURE;
--------------------------------------------------------------------------------