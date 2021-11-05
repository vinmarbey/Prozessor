-------------------------------------------------------------------------------
-- Title      : Testbench for design "toplevel"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : toplevel_tb.vhd
-- Author     : Burkart Voss  <bvoss@Troubadix>
-- Company    : 
-- Created    : 2015-06-23
-- Last update: 2015-06-23
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

-------------------------------------------------------------------------------

entity toplevel_tb is

end toplevel_tb;

-------------------------------------------------------------------------------

architecture behaviour of toplevel_tb is

  component toplevel
    port (
      reset    : in  STD_LOGIC;
      clk      : in  STD_LOGIC;
      --w_e_SREG : out std_logic_vector(7 downto 0);
      --Status   : out STD_LOGIC_VECTOR (7 downto 0);
      Result   : out STD_LOGIC_VECTOR (7 downto 0);
      -- GPIO
    PIND    : in std_logic_vector(7 downto 0);
    PINC    : in std_logic_vector(7 downto 0);
    PINB    : in std_logic_vector(7 downto 0);
    PORTC   : out std_logic_vector(7 downto 0);
    PORTB   : out std_logic_vector(7 downto 0);
    SER     : out std_logic_vector(7 downto 0);
    SEG0_N  : out std_logic_vector(7 downto 0);
    SEG1_N  : out std_logic_vector(7 downto 0);
    SEG2_N  : out std_logic_vector(7 downto 0);
    SEG3_N  : out std_logic_vector(7 downto 0)
    );
  end component;

  -- component ports
  signal reset    : STD_LOGIC;
  signal clk      : STD_LOGIC:='0';
  --signal w_e_SREG : std_logic_vector(7 downto 0);
  --signal Status   : STD_LOGIC_VECTOR (7 downto 0);
  signal Result   : STD_LOGIC_VECTOR (7 downto 0);
  signal  PIND    :  std_logic_vector(7 downto 0);
  signal  PINC    :  std_logic_vector(7 downto 0);
  signal PINB    :  std_logic_vector(7 downto 0);
  signal PORTC   :  std_logic_vector(7 downto 0);
  signal PORTB   :  std_logic_vector(7 downto 0);
  signal SER     :  std_logic_vector(7 downto 0);
  signal SEG0_N  :  std_logic_vector(7 downto 0);
  signal SEG1_N  :  std_logic_vector(7 downto 0);
  signal SEG2_N  :  std_logic_vector(7 downto 0);
  signal SEG3_N  :  std_logic_vector(7 downto 0);


begin  -- behaviour

  -- component instantiation
  DUT: toplevel
    port map (
      reset    => reset,
      clk      => clk,
      --w_e_SREG => w_e_SREG,
      --Status   => Status,
      Result   => Result,
      PIND =>PIND,
      PINC =>PINC,
      PINB =>PINB,
      PORTC =>PORTC,
      PORTB =>PORTB,
      SER =>SER,
      SEG0_N  =>SEG0_N,
      SEG1_N =>SEG1_N,
      SEG2_N =>SEG2_N,
      SEG3_N =>SEG3_N
      );

  -- clock generation
  clk <= not clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here
    wait for 20ns;
    reset <= '1';
    wait for 51ns;
    reset <= '0';
    PINC <= "00110011";
    wait;

  end process WaveGen_Proc;

  

end behaviour;

-------------------------------------------------------------------------------

configuration toplevel_tb_behaviour_cfg of toplevel_tb is
  for behaviour
  end for;
end toplevel_tb_behaviour_cfg;

-------------------------------------------------------------------------------
