------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------
ENTITY carry_ripple_adder IS
	GENERIC (N: INTEGER :=8); --- numero de bits
	PORT(a, b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	     cin: IN STD_LOGIC;
	     s: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	     cout: OUT STD_LOGIC);
END carry_ripple_adder;
------------------------------------------------
ARCHITECTURE structure OF carry_ripple_adder IS
BEGIN 
	PROCESS(a, b, cin)
		VARIABLE carry: STD_LOGIC_VECTOR(N DOWNTO 0);
	BEGIN
		carry(0) := cin;
		FOR i IN 0 TO N-1 LOOP
			s(i) <= a(i) XOR b(i) XOR carry(i);
			carry(i+1) := (a(i) AND b(i)) OR (a(i) AND carry(i)) 
			OR (b(i) AND carry(i)); 
		END LOOP;
		cout <= carry(N);
	END PROCESS;
END structure;
------------------------------------------------
