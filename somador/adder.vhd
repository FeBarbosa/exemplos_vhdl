--design file(adder.vhd):--------------------------
ENTITY adder IS
	PORT(a, b: IN INTEGER RANGE 0 TO 255;
	     sum: OUT INTEGER RANGE 0 TO 255;
	     cout: OUT BIT);
END ENTITY;
---------------------------------------------------
ARCHITECTURE adder OF adder IS
BEGIN
	sum <= a + b;
	cout <= '1' WHEN (a + b) > 255 ELSE
		'0';
END ARCHITECTURE;
---------------------------------------------------