----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------
ENTITY carry_lookahead_adder IS
	PORT(a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	     cin: IN STD_LOGIC;
	     sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	     cout: OUT STD_LOGIC);
END carry_lookahead_adder;
----------------------------------------------------
ARCHITECTURE structure OF carry_lookahead_adder IS
	SIGNAL G, P, c: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	--Computation of G and P:-----
	G <= a AND b;
	P <= a XOR b;
	--Computation of carry:-------
	c(0) <= cin;
	c(1) <= G(0) OR 
		(P(0) AND cin);
	c(2) <= G(1) OR
		(P(1) AND G(0)) OR
		(P(1) AND P(0) AND cin);
	c(3) <= G(2) OR
		(P(2) AND G(1)) OR
		(P(2) AND P(1) AND G(0)) OR
		(P(2) AND P(1) AND P(0) AND cin);
	cout <= G(3) OR
		(P(3) AND G(2)) OR
		(P(3) AND P(2) AND G(1)) OR
		(P(3) AND P(2) AND P(1) AND G(0)) OR
		(P(3) AND P(2) AND P(1) AND P(0) AND cin);
	--Computation of sum:---------
	sum <= P XOR c;
END structure;		
---------------------------------------------------