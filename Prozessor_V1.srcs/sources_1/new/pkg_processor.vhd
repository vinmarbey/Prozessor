library ieee;
use ieee.std_logic_1164.all;

package pkg_processor is

  constant op_add : std_logic_vector(4 downto 0) := "00000";  -- Addition
  constant op_NOP : std_logic_vector(4 downto 0) := "00000";  -- NoOperation (als Addition implementiert, die Ergebnisse werden aber nicht gespeichert...
  constant op_cp : std_logic_vector(4 downto 0) := "00001";  -- Compare
  constant op_sub  : std_logic_vector(4 downto 0) := "00010";  -- Subtraction
  constant op_adc : std_logic_vector(4 downto 0) := "00011";  -- add two register, load carry to Bit 0
  constant op_and : std_logic_vector(4 downto 0) := "00100";  -- bitwise AND
  constant op_eor : std_logic_vector(4 downto 0) := "00101";  -- bitwise EXCLUSIVE OR
  constant op_or : std_logic_vector(4 downto 0) := "00110";  -- bitwise AND
  constant op_mov : std_logic_vector(4 downto 0) := "00111";  -- move Register Rr to Rd
  constant op_cpi : std_logic_vector(4 downto 0) := "01000";  -- Compare with immediate
  constant op_subi : std_logic_vector(4 downto 0) := "01001";  -- Subtraction  with immediate
  constant op_ori : std_logic_vector(4 downto 0) := "01010";  -- bitwise OR with immediate
  constant op_andi : std_logic_vector(4 downto 0) := "01011";  -- bitwise AND  with immediate
  constant op_com : std_logic_vector(4 downto 0) := "01100";  -- one's complement of Rd
  constant op_asr : std_logic_vector(4 downto 0) := "01101";  -- arithmetic shift right
  constant op_dec : std_logic_vector(4 downto 0) := "01110";  -- decrement
  constant op_inc : std_logic_vector(4 downto 0) := "01111";  -- increment
  constant op_lsr : std_logic_vector(4 downto 0) := "10000";  -- logical shift right
  constant op_sec : std_logic_vector(4 downto 0) := "10001";  -- set carry flag
  constant op_clc : std_logic_vector(4 downto 0) := "10010";  -- clear carry flag


end pkg_processor;