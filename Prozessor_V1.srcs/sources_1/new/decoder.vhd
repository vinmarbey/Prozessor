-------------------------------------------------------------------------------
-- Title      : decoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : decoder.vhd
-- Author     : Burkart Voss  <bvoss@Troubadix>
-- Company    : 
-- Created    : 2015-06-23
-- Last update: 2015-06-25
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2015-06-23  1.0      bvoss	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.pkg_processor.all;

-------------------------------------------------------------------------------

entity decoder is
  port (
    Instr       : in  std_logic_vector(15 downto 0);  -- Eingang vom Programmspeicher
    SREG_OUT    : in std_logic_vector(7 downto 0);
    addr_opa    : out std_logic_vector(4 downto 0);   -- Adresse von 1. Operand
    addr_opb    : out std_logic_vector(4 downto 0);   -- Adresse von 2. Operand
    OPCODE      : out std_logic_vector(4 downto 0);   -- Opcode für ALU
    w_e_regfile : out std_logic;         -- write enable for Registerfile
    w_e_SREG    : out std_logic_vector(7 downto 0); -- einzeln Write_enables für SREG - Bits
    w_e_Data    : out std_logic;
    sel_Data    : out std_logic;
    data_immediate: out std_logic_vector(7 downto 0);
    sel_immediate: out std_logic;
    sel_immediate_to_ALU :out std_logic;
    add_PC      : out std_logic_vector (8 downto 0)
    -- hier kommen noch die ganzen Steuersignale der Multiplexer...
 
    );
end decoder;

architecture Behavioral of decoder is

begin  -- Behavioral

  -- purpose: Decodierprozess
  -- type   : combinational
  -- inputs : Instr
  -- outputs: addr_opa, addr_opb, OPCODE, w_e_regfile, w_e_SREG, ...
  dec_mux: process (Instr,SREG_OUT)
  variable SREG_Auswertung : std_logic_vector(7 downto 0);
  begin  -- process dec_mux


    -- ACHTUNG!!!
    -- So einfach wie hier unten ist das Ganze nicht! Es soll nur den Anfang erleichtern!
    -- Etwas muss man hier schon nachdenken und sich die Operationen genau ansehen...
    
    -- Vorzuweisung der Signale, um Latches zu verhindern
    addr_opa <= "00000";
    addr_opb <= "00000";
    OPCODE <= op_nop;
    w_e_regfile <= '0';
    w_e_SREG <= "00000000";
    w_e_Data <= '0';
    sel_Data <= '0';
    data_immediate <= "00000000";
    sel_immediate <= '0';
    sel_immediate_to_ALU <= '0';
    add_PC <= "000000000";
    
    
 
    case Instr(15 downto 10) is
      -- ADD
      when "000011" =>
        addr_opa <= Instr(8 downto 4);
        addr_opb <= Instr(9) & Instr (3 downto 0);
        OPCODE <= op_add;
        w_e_regfile <= '1';
        w_e_SREG <= "00111111";
      -- CP
      when "000101" =>
        addr_opa <= Instr(8 downto 4);
        addr_opb <= Instr(9) & Instr (3 downto 0);
        OPCODE <= op_cp;
        w_e_SREG <= "00111111";
      -- SUB
      when "000110" =>
        addr_opa <= Instr(8 downto 4);
        addr_opb <= Instr(9) & Instr (3 downto 0);
        OPCODE <= op_sub;
        w_e_regfile <= '1';
        w_e_SREG <= "00111111";
      -- ADC
      when "000111" =>
        addr_opa <= Instr(8 downto 4);
        addr_opb <= Instr(9) & Instr (3 downto 0);
        OPCODE <= op_adc;
        w_e_regfile <= '1';
        w_e_SREG <= "00111111";
      -- AND
      when "001000" =>
        addr_opa <= Instr(8 downto 4);
        addr_opb <= Instr(9) & Instr (3 downto 0);
        OPCODE <= op_and;
        w_e_regfile <= '1';
        w_e_SREG <= "00011110";
      -- EOR
      when "001001" =>
        addr_opa <= Instr(8 downto 4);
        addr_opb <= Instr(9) & Instr (3 downto 0);
        OPCODE <= op_eor;
        w_e_regfile <= '1';
        w_e_SREG <= "00011110";
      -- OR
      when "001010" =>
        addr_opa <= Instr(8 downto 4);
        addr_opb <= Instr(9) & Instr (3 downto 0);
        OPCODE <= op_or;
        w_e_regfile <= '1';
        w_e_SREG <= "00011110";
      -- MOV
      when "001011" =>
        addr_opa <= Instr(8 downto 4);
        addr_opb <= Instr(9) & Instr (3 downto 0);
        OPCODE <= op_mov;
        w_e_regfile <= '1';
        w_e_SREG <= "00000000";
      -- BRBS
      when "111100" =>
        SREG_Auswertung := std_logic_vector(to_unsigned(to_integer(unsigned(Instr(2 downto 0))),8)) and SREG_OUT;
        if SREG_Auswertung /= "00000000" then
          add_pc <= std_logic_vector(to_signed(to_integer(signed(Instr(9 downto 3))),9));
        end if;
      -- BRBC
      when "111101" =>
        SREG_Auswertung := std_logic_vector(to_unsigned(to_integer(unsigned(Instr(2 downto 0))),8)) and SREG_OUT;
        if SREG_Auswertung = "00000000" then
          add_pc <= std_logic_vector(to_signed(to_integer(signed(Instr(9 downto 3))),9));
        end if;
        
      when others =>
        case Instr(15 downto 12) is
          -- CPI
          when "0011" =>
            addr_opa <= '1' & Instr(7 downto 4);
            data_immediate <= Instr(11 downto 8) & Instr(3 downto 0);
            OPCODE <= op_cpi;
            w_e_SREG <= "00111111";
            sel_immediate_to_ALU <= '1';
          -- SUBI
          when "0101" =>
            addr_opa <= '1' & Instr(7 downto 4);
            data_immediate <= Instr(11 downto 8) & Instr(3 downto 0);
            OPCODE <= op_subi;
            w_e_regfile <= '1';
            w_e_SREG <= "00111111";
            sel_immediate_to_ALU <= '1';
          -- ORI
          when "0110" =>
            addr_opa <= '1' & Instr(7 downto 4);
            data_immediate <= Instr(11 downto 8) & Instr(3 downto 0);
            OPCODE <= op_ori;
            w_e_regfile <= '1';
            w_e_SREG <= "00011110";
            sel_immediate_to_ALU <= '1';
          -- ANDI
          when "0111" =>
            addr_opa <= '1' & Instr(7 downto 4);
            data_immediate <= Instr(11 downto 8) & Instr(3 downto 0);
            OPCODE <= op_andi;
            w_e_regfile <= '1';
            w_e_SREG <= "00011110";
            sel_immediate_to_ALU <= '1';
          -- LDI
          when "1110" =>
          	addr_opa <= '1' & Instr(7 downto 4);
          	data_immediate <= Instr(11 downto 8) & Instr(3 downto 0);
          	OPCODE <= op_add;
            w_e_regfile <= '1';
            w_e_SREG <= "00000000";
            sel_immediate <= '1';
          -- rjmp
          when "1100" =>
            add_pc <= Instr(8 downto 0);
          when others => 
            case Instr(15 downto 9) & Instr (3 downto 0) is
              -- LD
              when "10000000000" =>
                addr_opa <= Instr(8 downto 4);
                w_e_regfile <= '1';
                sel_data <= '1';
              -- ST
              when "10000010000" =>
                addr_opb <= Instr(8 downto 4);
                w_e_Data <= '1';
              -- COM
              when "10010100000" =>
                addr_opa <= Instr(8 downto 4);
                OPCODE <= op_com;
                w_e_regfile <= '1';
                w_e_SREG <= "00111111";
              -- ASR
              when "10010100101" =>
                addr_opa <= Instr(8 downto 4);
                addr_opb <= Instr(8 downto 4);
                OPCODE <= op_asr;
                w_e_regfile <= '1';
                w_e_SREG <= "00011111";
              -- DEC
              when "10010101010" =>
                addr_opa <= Instr(8 downto 4);
                OPCODE <= op_dec;
                w_e_regfile <= '1';
                w_e_SREG <= "00011110";
              -- INC
              when "10010100011" =>
                addr_opa <= Instr(8 downto 4);
                OPCODE <= op_inc;
                w_e_regfile <= '1';
                w_e_SREG <= "00011110";
              -- LSR
              when "10010100110" =>
                addr_opa <= Instr(8 downto 4);
                addr_opb <= Instr(8 downto 4);
                OPCODE <= op_lsr;
                w_e_regfile <= '1';
                w_e_SREG <= "00011111";
              when others =>
                case Instr(15 downto 0) is
                  -- SEC
                  when "1001010000001000" =>
                    OPCODE <= op_sec;
                    w_e_SREG <= "00000001";
                  -- CLC
                  when "1001010010001000" =>
                    OPCODE <= op_clc;
                    w_e_SREG <= "00000001";
                  when others => null;
                end case;
            end case;
        end case;
    end case;
  end process dec_mux;

end Behavioral;