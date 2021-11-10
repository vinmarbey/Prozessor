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
--      clk_board      : in  STD_LOGIC;
      clk      : in  STD_LOGIC;
      --w_e_SREG : out std_logic_vector(7 downto 0);
      --Status   : out STD_LOGIC_VECTOR (7 downto 0);
      Result   : out STD_LOGIC_VECTOR (7 downto 0);
      -- GPIO
    sw      : in std_logic_vector(15 downto 0);
    led     : out std_logic_vector(15 downto 0);
    seg     : out std_logic_vector(6 downto 0);
    dp      : out std_logic;
    an      : out std_logic_vector (3 downto 0);
    btnC     : in std_logic;
    btnU     : in std_logic;
    btnL     : in std_logic;
    btnR     : in std_logic;
    btnD     : in std_logic
    
    );
  end component;

  -- component ports
  signal reset    : STD_LOGIC;
--  signal clk_board      : STD_LOGIC:='0';
signal clk      : STD_LOGIC:='0';
  signal w_e_SREG : std_logic_vector(7 downto 0);
  --signal Status   : STD_LOGIC_VECTOR (7 downto 0);
  signal Result   : STD_LOGIC_VECTOR (7 downto 0);
  signal sw      :  std_logic_vector(15 downto 0);
  signal   led     :  std_logic_vector(15 downto 0);
   signal  seg     :  std_logic_vector(6 downto 0);
  signal   dp      :  std_logic;
   signal  an      :  std_logic_vector (3 downto 0);
   signal  btnC     :  std_logic;
   signal  btnU     :  std_logic;
  signal   btnL     :  std_logic;
  signal   btnR     :  std_logic;
   signal  btnD     :  std_logic;
  
  


begin  -- behaviour

  -- component instantiation
  DUT: toplevel
    port map (
      reset    => reset,
--      clk_board      => clk_board,
clk      => clk,
      --w_e_SREG => w_e_SREG,
      --Status   => Status,
      Result   => Result,
      sw     => sw,
    led     => led,
    seg    => seg,
    dp     =>  dp,
    an   => an,
    btnC  => btnc,
    btnU   => btnU,
    btnL    => btnl,
    btnR   => btnr,
    btnD => btnd
      );

  -- clock generation
--  clk_board <= not clk_board after 10 ns;
  clk <= not clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here
    wait for 20ns;
    reset <= '1';
    wait for 51ns;
    reset <= '0';
    --PINC <= "00110011";
    wait;

  end process WaveGen_Proc;

  

end behaviour;

-------------------------------------------------------------------------------

configuration toplevel_tb_behaviour_cfg of toplevel_tb is
  for behaviour
  end for;
end toplevel_tb_behaviour_cfg;

-------------------------------------------------------------------------------
