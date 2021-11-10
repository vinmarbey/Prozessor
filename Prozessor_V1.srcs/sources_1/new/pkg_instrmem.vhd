library ieee;
use ieee.std_logic_1164.all;
-- ---------------------------------------------------------------------------------
-- Memory initialisation package
-- ---------------------------------------------------------------------------------
package pkg_instrmem is

	type t_instrMem   is array(0 to 512-1) of std_logic_vector(15 downto 0);
	constant PROGMEM : t_instrMem := (
	    "0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"1110000000000001",
		"1110000000010010",
		"0000111100010000",
		"0010101100000001",
		"1000001100000000",
		"1000000111100000",
		"0111000000000001",
		"0001101100000001",
		"1001001100001111",
		"1110000011110000",
		"1110001111100011",
		"1000000011100000",
		"1110001111100101",
		"1000001011100000",
		"1001000011011111",
		"1100111111111111",
		others => (others => '0')
	);

end package pkg_instrmem;
