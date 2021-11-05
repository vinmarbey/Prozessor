----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2015 09:44:25 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library work;
use work.pkg_processor.all;


entity ALU is
    Port ( OPCODE : in STD_LOGIC_VECTOR (4 downto 0);
           OPA : in STD_LOGIC_VECTOR (7 downto 0);
           OPB : in STD_LOGIC_VECTOR (7 downto 0);
           RES : out STD_LOGIC_VECTOR (7 downto 0);
           Status : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
  signal h : std_logic := '0';            -- h Flag
  signal z : std_logic := '0';            -- Zero Flag
  signal c : std_logic := '0';            -- Carry Flag
  signal v : std_logic := '0';            -- Overflow Flag
  signal n : std_logic := '0';            -- negative flag
  signal s : std_logic := '0';            -- sign flag
  signal erg : std_logic_vector(7 downto 0);  -- Zwischenergebnis
begin
  -- purpose: Kern-ALU zur Berechnung des Datenausganges
  -- type   : combinational
  -- inputs : OPA, OPB, OPCODE
  -- outputs: erg
  kern_ALU: process (OPA, OPB, OPCODE)
  begin  -- process kern_ALU
    erg <= "00000000";                  -- verhindert Latches
    case OPCODE is
      -- ADD --> Addition
      when op_add =>
        erg <= std_logic_vector(unsigned(OPA) + unsigned(OPB));
      -- CP
      when op_cp =>
        erg <= std_logic_vector(unsigned(OPA) - unsigned(OPB));
      -- SUB
      when op_sub =>
        erg <= std_logic_vector(unsigned(OPA) - unsigned(OPB));
      -- adc
      when op_adc =>
        erg <= std_logic_vector(unsigned(OPA) + unsigned(OPB));
        erg(0) <= c;
      -- AND
      when op_and =>
        erg <= OPA and OPB;
      -- EOR
      when op_eor =>
        erg <= OPA xor OPB;
      -- OR
      when op_or =>
        erg <= OPA or OPB;
      -- MOV
      when op_mov =>
        erg <= OPB;
      -- CPI
      when op_cpi =>
        erg <= std_logic_vector(unsigned(OPA) - unsigned(OPB));
      -- SUBI
      when op_subi =>
        erg <= std_logic_vector(unsigned(OPA) - unsigned(OPB));
      -- ORI
      when op_ori =>
        erg <= OPA and OPB;
      -- ANDI
      when op_andi =>
        erg <= OPA and OPB;
      -- COM
      when op_com =>
        --erg <= std_logic_vector(signed("11111111") - signed(OPA));
      -- ASR
      when op_asr =>
        erg <= std_logic_vector(unsigned(OPA) - unsigned(OPB));
        erg(7) <= OPA(7);
      -- DEC
      when op_dec =>
        erg <= std_logic_vector(unsigned(OPA) - 1);
      -- INC
      when op_inc =>
        erg <= std_logic_vector(unsigned(OPA) + 1);
      -- LSR
      when op_lsr =>
        erg <= std_logic_vector(unsigned(OPA) - unsigned(OPB));
        erg(7) <= '0';
        
      when others => null;
    end case;
  end process kern_ALU;

  -- purpose: berechnet die Statusflags
  -- type   : combinational
  -- inputs : OPA, OPB, OPCODE, erg
  -- outputs: z, c, v, n
  Berechnung_SREG: process (OPA, OPB, OPCODE, erg)
  begin  -- process Berechnung_SREG
    
    z<=not (erg(7) or erg(6) or erg(5) or erg(4) or erg(3) or erg(2) or erg(1) or erg(0));
    n <= erg(7);

    c <= '0';                           -- um Latches zu verhindern
    v <= '0';
    
    case OPCODE is
      -- ADD
      when op_add =>
        c<=(OPA(7) AND OPB(7)) OR (OPB(7) AND (not erg(7))) OR ((not erg(7)) AND OPA(7));
        v<=(OPA(7) AND OPB(7) AND (not erg(7))) OR ((not OPA(7)) and (not OPB(7)) and  erg(7));
        h<=(OPA(3) AND OPB(3)) OR (OPB(3) AND not(erg(3))) OR (not(erg(3)) AND OPB(3));
      -- CP
      when op_cp =>
        c<=(not(OPA(7)) AND OPB(7)) OR (OPB(7) AND erg(7)) OR (erg(7) AND (not OPA(7)));
        v<=(OPA(7) AND (not OPB(7)) AND (not erg(7))) OR ((not OPA(7)) and OPB(7) and  erg(7));
        h<=((not OPA(3)) AND OPB(3)) OR (OPB(3) AND erg(3)) OR (erg(3) AND OPB(3));
      -- SUB
      when op_sub =>
        c<=((not OPA(7)) and OPB(7)) or (OPB(7) and erg(7)) or ((not OPA(7)) and erg(7));
        v<=(OPA(7) and (not OPB(7)) and (not erg(7))) or (not OPA(7) and OPB(7) and erg(7));
        h<=((not OPA(3)) AND OPB(3)) OR (OPB(3) AND erg(3)) OR (erg(3) AND (not OPB(3)));
      -- ADC
      when op_adc =>
        c<=(OPA(7) and OPB(7)) or (OPB(7) and (not erg(7))) or ((not erg(7)) and OPA(7));
        v<=(OPA(7) and OPB(7) and (not erg(7))) or (not OPA(7) and (not OPB(7)) and erg(7));
        h<=(OPA(3) AND OPB(3)) OR (OPB(3) AND (not erg(3))) OR ((not erg(3)) AND OPB(3));
      -- CPI
      when op_cpi =>
        c<=((not OPA(7)) and OPB(7)) or (OPB(7) and erg(7)) or (erg(7) and (not OPA(7)));
        v<=(OPA(7) and (not OPB(7)) and (not erg(7))) or ((not OPA(7)) and OPB(7) and erg(7));
        h<=((not OPA(3)) and OPB(3)) or (OPB(3) and erg(3)) or (erg(3) and (not OPA(3)));
      -- SUBI
      when op_subi =>
        c<=((not OPA(7)) and OPB(7)) or (OPB(7) and erg(7)) or ((not OPA(7)) and erg(7));
        v<=(OPA(7) and (not OPB(7)) and (not erg(7))) or (not OPA(7) and OPB(7) and erg(7));
        h<=((not OPA(3)) AND OPB(3)) OR (OPB(3) AND erg(3)) OR (erg(3) AND (not OPB(3)));
      -- com
      when op_com =>
        c<='1';
      -- asr
      when op_asr =>
        c<=OPA(0);
        v<=OPA(7) xor OPA(0);
      -- dec
      when op_dec =>
        v<=(not erg(7)) and erg(6) and erg(5) and erg(4) and erg(3) and erg(2) and erg(1) and erg(0);
      -- inc
      when op_inc =>
        v<=erg(7) and (not erg(6)) and (not erg(5)) and (not erg(4)) and (not erg(3)) and (not erg(2)) and (not erg(1)) and (not erg(0));
      -- lsr
      when op_lsr =>
        c<=OPA(0);
        v<='0' xor OPA(0);
        n<='0';
      -- SEC
      when op_sec =>
        c<='1';
      when others => null;
    end case;
    
  end process Berechnung_SREG;  

  s <= v xor n;
  RES <= erg;
  Status <= '0' & '0' & h & s & v & n & z & c;
  
end Behavioral;
