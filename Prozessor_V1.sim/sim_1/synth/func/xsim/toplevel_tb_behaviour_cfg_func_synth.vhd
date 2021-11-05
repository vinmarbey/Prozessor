-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed Nov  3 10:55:00 2021
-- Host        : DESKTOP-F4RPBPN running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/vinma/Xilinx_Projekte/Prozessor_V1/Prozessor_V1.sim/sim_1/synth/func/xsim/toplevel_tb_behaviour_cfg_func_synth.vhd
-- Design      : toplevel
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ALU is
  port (
    p_0_in : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Status_OBUF : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_opa : in STD_LOGIC_VECTOR ( 6 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 0 to 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    register_speicher_reg_0_31_4_4_i_1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \Status[1]\ : in STD_LOGIC;
    \Status[1]_0\ : in STD_LOGIC;
    \Status[1]_1\ : in STD_LOGIC
  );
end ALU;

architecture STRUCTURE of ALU is
  signal \Status_OBUF[1]_inst_i_2_n_0\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \^p_0_in\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW__inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__0/i__carry\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \_inferred__0/i__carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
begin
  p_0_in(7 downto 0) <= \^p_0_in\(7 downto 0);
\Status_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0200"
    )
        port map (
      I0 => \Status[1]\,
      I1 => \^p_0_in\(1),
      I2 => \^p_0_in\(0),
      I3 => \Status_OBUF[1]_inst_i_2_n_0\,
      I4 => \Status[1]_0\,
      I5 => \Status[1]_1\,
      O => Status_OBUF(0)
    );
\Status_OBUF[1]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \^p_0_in\(4),
      I1 => \^p_0_in\(5),
      I2 => \^p_0_in\(2),
      I3 => \^p_0_in\(3),
      I4 => \^p_0_in\(7),
      I5 => \^p_0_in\(6),
      O => \Status_OBUF[1]_inst_i_2_n_0\
    );
\_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__0/i__carry_n_0\,
      CO(2) => \_inferred__0/i__carry_n_1\,
      CO(1) => \_inferred__0/i__carry_n_2\,
      CO(0) => \_inferred__0/i__carry_n_3\,
      CYINIT => data_opa(0),
      DI(3 downto 1) => data_opa(3 downto 1),
      DI(0) => DI(0),
      O(3 downto 0) => \^p_0_in\(3 downto 0),
      S(3 downto 0) => S(3 downto 0)
    );
\_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__0/i__carry_n_0\,
      CO(3) => \NLW__inferred__0/i__carry__0_CO_UNCONNECTED\(3),
      CO(2) => \_inferred__0/i__carry__0_n_1\,
      CO(1) => \_inferred__0/i__carry__0_n_2\,
      CO(0) => \_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => data_opa(6 downto 4),
      O(3 downto 0) => \^p_0_in\(7 downto 4),
      S(3 downto 0) => register_speicher_reg_0_31_4_4_i_1(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Program_Counter is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    w_e_regfile : out STD_LOGIC;
    \PC_reg_reg[6]_0\ : out STD_LOGIC;
    w_e_SREG_OBUF : out STD_LOGIC_VECTOR ( 1 downto 0 );
    addr_opa : out STD_LOGIC_VECTOR ( 0 to 0 );
    data_in : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \PC_reg_reg[0]_0\ : out STD_LOGIC;
    addr_opb : out STD_LOGIC_VECTOR ( 0 to 0 );
    Status_OBUF : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    \PC_reg_reg[1]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S : out STD_LOGIC_VECTOR ( 2 downto 0 );
    data_opb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_opa : in STD_LOGIC_VECTOR ( 7 downto 0 );
    p_0_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC
  );
end Program_Counter;

architecture STRUCTURE of Program_Counter is
  signal \PC_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \PC_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \PC_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \PC_reg[8]_i_4_n_0\ : STD_LOGIC;
  signal PC_reg_reg : STD_LOGIC_VECTOR ( 8 downto 2 );
  signal \^pc_reg_reg[0]_0\ : STD_LOGIC;
  signal \^pc_reg_reg[6]_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^addr_opb\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal plusOp : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \w_e_SREG_OBUF[5]_inst_i_3_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \PC_reg[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \PC_reg[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \PC_reg[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \PC_reg[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \PC_reg[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \PC_reg[8]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Status_OBUF[3]_inst_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \w_e_SREG_OBUF[5]_inst_i_1\ : label is "soft_lutpair1";
begin
  \PC_reg_reg[0]_0\ <= \^pc_reg_reg[0]_0\;
  \PC_reg_reg[6]_0\ <= \^pc_reg_reg[6]_0\;
  Q(1 downto 0) <= \^q\(1 downto 0);
  addr_opb(0) <= \^addr_opb\(0);
\PC_reg[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => plusOp(0)
    );
\PC_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => plusOp(1)
    );
\PC_reg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => PC_reg_reg(2),
      O => plusOp(2)
    );
\PC_reg[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => PC_reg_reg(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => PC_reg_reg(3),
      O => plusOp(3)
    );
\PC_reg[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => PC_reg_reg(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => PC_reg_reg(2),
      I4 => PC_reg_reg(4),
      O => plusOp(4)
    );
\PC_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => PC_reg_reg(4),
      I1 => PC_reg_reg(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => PC_reg_reg(3),
      I5 => PC_reg_reg(5),
      O => plusOp(5)
    );
\PC_reg[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFF08000000"
    )
        port map (
      I0 => PC_reg_reg(5),
      I1 => PC_reg_reg(3),
      I2 => \PC_reg[8]_i_3_n_0\,
      I3 => PC_reg_reg(2),
      I4 => PC_reg_reg(4),
      I5 => PC_reg_reg(6),
      O => plusOp(6)
    );
\PC_reg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => PC_reg_reg(6),
      I1 => \PC_reg[7]_i_2_n_0\,
      I2 => PC_reg_reg(7),
      O => plusOp(7)
    );
\PC_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => PC_reg_reg(4),
      I1 => PC_reg_reg(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => PC_reg_reg(3),
      I5 => PC_reg_reg(5),
      O => \PC_reg[7]_i_2_n_0\
    );
\PC_reg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000FF2000"
    )
        port map (
      I0 => \PC_reg[8]_i_2_n_0\,
      I1 => \PC_reg[8]_i_3_n_0\,
      I2 => PC_reg_reg(2),
      I3 => PC_reg_reg(7),
      I4 => PC_reg_reg(8),
      I5 => \PC_reg[8]_i_4_n_0\,
      O => plusOp(8)
    );
\PC_reg[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => PC_reg_reg(4),
      I1 => PC_reg_reg(3),
      I2 => PC_reg_reg(6),
      I3 => PC_reg_reg(5),
      O => \PC_reg[8]_i_2_n_0\
    );
\PC_reg[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \PC_reg[8]_i_3_n_0\
    );
\PC_reg[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFFFFFFFFFF"
    )
        port map (
      I0 => PC_reg_reg(5),
      I1 => PC_reg_reg(3),
      I2 => \PC_reg[8]_i_3_n_0\,
      I3 => PC_reg_reg(2),
      I4 => PC_reg_reg(4),
      I5 => PC_reg_reg(6),
      O => \PC_reg[8]_i_4_n_0\
    );
\PC_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(0),
      Q => \^q\(0),
      R => SR(0)
    );
\PC_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(1),
      Q => \^q\(1),
      R => SR(0)
    );
\PC_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(2),
      Q => PC_reg_reg(2),
      R => SR(0)
    );
\PC_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(3),
      Q => PC_reg_reg(3),
      R => SR(0)
    );
\PC_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(4),
      Q => PC_reg_reg(4),
      R => SR(0)
    );
\PC_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(5),
      Q => PC_reg_reg(5),
      R => SR(0)
    );
\PC_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(6),
      Q => PC_reg_reg(6),
      R => SR(0)
    );
\PC_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(7),
      Q => PC_reg_reg(7),
      R => SR(0)
    );
\PC_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => plusOp(8),
      Q => PC_reg_reg(8),
      R => SR(0)
    );
\Status_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABBBABBBA888A88"
    )
        port map (
      I0 => p_0_in(7),
      I1 => \^pc_reg_reg[6]_0\,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => data_opb(7),
      I5 => data_opa(7),
      O => Status_OBUF(0)
    );
\Status_OBUF[3]_inst_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^pc_reg_reg[6]_0\,
      O => \^pc_reg_reg[0]_0\
    );
\Status_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFAFF00FF080D00"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^pc_reg_reg[6]_0\,
      I3 => data_opa(7),
      I4 => data_opb(7),
      I5 => p_0_in(7),
      O => Status_OBUF(1)
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      I2 => data_opb(7),
      I3 => data_opa(7),
      O => \PC_reg_reg[1]_0\(3)
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      I2 => data_opb(6),
      I3 => data_opa(6),
      O => \PC_reg_reg[1]_0\(2)
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      I2 => data_opb(5),
      I3 => data_opa(5),
      O => \PC_reg_reg[1]_0\(1)
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      I2 => data_opb(4),
      I3 => data_opa(4),
      O => \PC_reg_reg[1]_0\(0)
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      O => DI(0)
    );
\i__carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      I2 => data_opb(3),
      I3 => data_opa(3),
      O => S(2)
    );
\i__carry_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      I2 => data_opb(2),
      I3 => data_opa(2),
      O => S(1)
    );
\i__carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      I2 => data_opb(1),
      I3 => data_opa(1),
      O => S(0)
    );
register_speicher_reg_0_31_0_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00E0E0FF00FF0F"
    )
        port map (
      I0 => data_opb(0),
      I1 => data_opa(0),
      I2 => \^q\(1),
      I3 => p_0_in(0),
      I4 => \^pc_reg_reg[6]_0\,
      I5 => \^q\(0),
      O => data_in(0)
    );
register_speicher_reg_0_31_0_0_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      O => w_e_regfile
    );
register_speicher_reg_0_31_0_0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"14"
    )
        port map (
      I0 => \^pc_reg_reg[6]_0\,
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => addr_opa(0)
    );
register_speicher_reg_0_31_0_0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^pc_reg_reg[6]_0\,
      O => \^addr_opb\(0)
    );
register_speicher_reg_0_31_1_1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0EEF0FF00"
    )
        port map (
      I0 => data_opb(1),
      I1 => data_opa(1),
      I2 => p_0_in(1),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^pc_reg_reg[6]_0\,
      O => data_in(1)
    );
register_speicher_reg_0_31_2_2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8F8F888"
    )
        port map (
      I0 => p_0_in(2),
      I1 => \^pc_reg_reg[0]_0\,
      I2 => \^addr_opb\(0),
      I3 => data_opa(2),
      I4 => data_opb(2),
      O => data_in(2)
    );
register_speicher_reg_0_31_3_3_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8F8F888"
    )
        port map (
      I0 => p_0_in(3),
      I1 => \^pc_reg_reg[0]_0\,
      I2 => \^addr_opb\(0),
      I3 => data_opa(3),
      I4 => data_opb(3),
      O => data_in(3)
    );
register_speicher_reg_0_31_4_4_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8F8F888"
    )
        port map (
      I0 => p_0_in(4),
      I1 => \^pc_reg_reg[0]_0\,
      I2 => \^addr_opb\(0),
      I3 => data_opa(4),
      I4 => data_opb(4),
      O => data_in(4)
    );
register_speicher_reg_0_31_5_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8F8F888"
    )
        port map (
      I0 => p_0_in(5),
      I1 => \^pc_reg_reg[0]_0\,
      I2 => \^addr_opb\(0),
      I3 => data_opa(5),
      I4 => data_opb(5),
      O => data_in(5)
    );
register_speicher_reg_0_31_6_6_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8F8F888"
    )
        port map (
      I0 => p_0_in(6),
      I1 => \^pc_reg_reg[0]_0\,
      I2 => \^addr_opb\(0),
      I3 => data_opa(6),
      I4 => data_opb(6),
      O => data_in(6)
    );
register_speicher_reg_0_31_7_7_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8F8F888"
    )
        port map (
      I0 => p_0_in(7),
      I1 => \^pc_reg_reg[0]_0\,
      I2 => \^addr_opb\(0),
      I3 => data_opa(7),
      I4 => data_opb(7),
      O => data_in(7)
    );
\w_e_SREG_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^pc_reg_reg[6]_0\,
      O => w_e_SREG_OBUF(1)
    );
\w_e_SREG_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^pc_reg_reg[6]_0\,
      O => w_e_SREG_OBUF(0)
    );
\w_e_SREG_OBUF[5]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => PC_reg_reg(6),
      I1 => PC_reg_reg(7),
      I2 => PC_reg_reg(4),
      I3 => PC_reg_reg(5),
      I4 => PC_reg_reg(3),
      I5 => \w_e_SREG_OBUF[5]_inst_i_3_n_0\,
      O => \^pc_reg_reg[6]_0\
    );
\w_e_SREG_OBUF[5]_inst_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => PC_reg_reg(8),
      I1 => PC_reg_reg(2),
      O => \w_e_SREG_OBUF[5]_inst_i_3_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Reg_File is
  port (
    Status_OBUF : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_opa : out STD_LOGIC_VECTOR ( 7 downto 0 );
    data_opb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \PC_reg_reg[0]\ : out STD_LOGIC;
    \PC_reg_reg[1]\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \Status[0]\ : in STD_LOGIC;
    \Status_OBUF[1]_inst_i_1\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    w_e_regfile : in STD_LOGIC;
    addr_opa : in STD_LOGIC_VECTOR ( 0 to 0 );
    addr_opb : in STD_LOGIC_VECTOR ( 0 to 0 );
    w_e_SREG_OBUF : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end Reg_File;

architecture STRUCTURE of Reg_File is
  signal \Status_OBUF[1]_inst_i_5_n_0\ : STD_LOGIC;
  signal \Status_OBUF[1]_inst_i_6_n_0\ : STD_LOGIC;
  signal \Status_OBUF[1]_inst_i_7_n_0\ : STD_LOGIC;
  signal \Status_OBUF[1]_inst_i_8_n_0\ : STD_LOGIC;
  signal \Status_OBUF[1]_inst_i_9_n_0\ : STD_LOGIC;
  signal \^data_opa\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^data_opb\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Status_OBUF[0]_inst_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \Status_OBUF[3]_inst_i_1\ : label is "soft_lutpair4";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of register_speicher_reg_0_31_0_0 : label is 256;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of register_speicher_reg_0_31_0_0 : label is "Reg_File_1/register_speicher";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of register_speicher_reg_0_31_0_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of register_speicher_reg_0_31_0_0 : label is 31;
  attribute ram_offset : integer;
  attribute ram_offset of register_speicher_reg_0_31_0_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of register_speicher_reg_0_31_0_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of register_speicher_reg_0_31_0_0 : label is 0;
  attribute RTL_RAM_BITS of register_speicher_reg_0_31_1_1 : label is 256;
  attribute RTL_RAM_NAME of register_speicher_reg_0_31_1_1 : label is "Reg_File_1/register_speicher";
  attribute ram_addr_begin of register_speicher_reg_0_31_1_1 : label is 0;
  attribute ram_addr_end of register_speicher_reg_0_31_1_1 : label is 31;
  attribute ram_offset of register_speicher_reg_0_31_1_1 : label is 0;
  attribute ram_slice_begin of register_speicher_reg_0_31_1_1 : label is 1;
  attribute ram_slice_end of register_speicher_reg_0_31_1_1 : label is 1;
  attribute RTL_RAM_BITS of register_speicher_reg_0_31_2_2 : label is 256;
  attribute RTL_RAM_NAME of register_speicher_reg_0_31_2_2 : label is "Reg_File_1/register_speicher";
  attribute ram_addr_begin of register_speicher_reg_0_31_2_2 : label is 0;
  attribute ram_addr_end of register_speicher_reg_0_31_2_2 : label is 31;
  attribute ram_offset of register_speicher_reg_0_31_2_2 : label is 0;
  attribute ram_slice_begin of register_speicher_reg_0_31_2_2 : label is 2;
  attribute ram_slice_end of register_speicher_reg_0_31_2_2 : label is 2;
  attribute RTL_RAM_BITS of register_speicher_reg_0_31_3_3 : label is 256;
  attribute RTL_RAM_NAME of register_speicher_reg_0_31_3_3 : label is "Reg_File_1/register_speicher";
  attribute ram_addr_begin of register_speicher_reg_0_31_3_3 : label is 0;
  attribute ram_addr_end of register_speicher_reg_0_31_3_3 : label is 31;
  attribute ram_offset of register_speicher_reg_0_31_3_3 : label is 0;
  attribute ram_slice_begin of register_speicher_reg_0_31_3_3 : label is 3;
  attribute ram_slice_end of register_speicher_reg_0_31_3_3 : label is 3;
  attribute RTL_RAM_BITS of register_speicher_reg_0_31_4_4 : label is 256;
  attribute RTL_RAM_NAME of register_speicher_reg_0_31_4_4 : label is "Reg_File_1/register_speicher";
  attribute ram_addr_begin of register_speicher_reg_0_31_4_4 : label is 0;
  attribute ram_addr_end of register_speicher_reg_0_31_4_4 : label is 31;
  attribute ram_offset of register_speicher_reg_0_31_4_4 : label is 0;
  attribute ram_slice_begin of register_speicher_reg_0_31_4_4 : label is 4;
  attribute ram_slice_end of register_speicher_reg_0_31_4_4 : label is 4;
  attribute RTL_RAM_BITS of register_speicher_reg_0_31_5_5 : label is 256;
  attribute RTL_RAM_NAME of register_speicher_reg_0_31_5_5 : label is "Reg_File_1/register_speicher";
  attribute ram_addr_begin of register_speicher_reg_0_31_5_5 : label is 0;
  attribute ram_addr_end of register_speicher_reg_0_31_5_5 : label is 31;
  attribute ram_offset of register_speicher_reg_0_31_5_5 : label is 0;
  attribute ram_slice_begin of register_speicher_reg_0_31_5_5 : label is 5;
  attribute ram_slice_end of register_speicher_reg_0_31_5_5 : label is 5;
  attribute RTL_RAM_BITS of register_speicher_reg_0_31_6_6 : label is 256;
  attribute RTL_RAM_NAME of register_speicher_reg_0_31_6_6 : label is "Reg_File_1/register_speicher";
  attribute ram_addr_begin of register_speicher_reg_0_31_6_6 : label is 0;
  attribute ram_addr_end of register_speicher_reg_0_31_6_6 : label is 31;
  attribute ram_offset of register_speicher_reg_0_31_6_6 : label is 0;
  attribute ram_slice_begin of register_speicher_reg_0_31_6_6 : label is 6;
  attribute ram_slice_end of register_speicher_reg_0_31_6_6 : label is 6;
  attribute RTL_RAM_BITS of register_speicher_reg_0_31_7_7 : label is 256;
  attribute RTL_RAM_NAME of register_speicher_reg_0_31_7_7 : label is "Reg_File_1/register_speicher";
  attribute ram_addr_begin of register_speicher_reg_0_31_7_7 : label is 0;
  attribute ram_addr_end of register_speicher_reg_0_31_7_7 : label is 31;
  attribute ram_offset of register_speicher_reg_0_31_7_7 : label is 0;
  attribute ram_slice_begin of register_speicher_reg_0_31_7_7 : label is 7;
  attribute ram_slice_end of register_speicher_reg_0_31_7_7 : label is 7;
begin
  data_opa(7 downto 0) <= \^data_opa\(7 downto 0);
  data_opb(7 downto 0) <= \^data_opb\(7 downto 0);
\Status_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C440"
    )
        port map (
      I0 => p_0_in(0),
      I1 => \Status[0]\,
      I2 => \^data_opa\(7),
      I3 => \^data_opb\(7),
      O => Status_OBUF(0)
    );
\Status_OBUF[1]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002000"
    )
        port map (
      I0 => \Status_OBUF[1]_inst_i_5_n_0\,
      I1 => \Status_OBUF[1]_inst_i_1\,
      I2 => Q(0),
      I3 => \Status_OBUF[1]_inst_i_6_n_0\,
      I4 => \Status_OBUF[1]_inst_i_7_n_0\,
      I5 => \Status_OBUF[1]_inst_i_8_n_0\,
      O => \PC_reg_reg[0]\
    );
\Status_OBUF[1]_inst_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \Status_OBUF[1]_inst_i_9_n_0\,
      I1 => \^data_opa\(0),
      I2 => \^data_opa\(1),
      I3 => Q(1),
      I4 => \Status_OBUF[1]_inst_i_1\,
      O => \PC_reg_reg[1]\
    );
\Status_OBUF[1]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \^data_opa\(2),
      I1 => \^data_opb\(2),
      I2 => \^data_opa\(1),
      I3 => \^data_opb\(1),
      I4 => \^data_opb\(0),
      I5 => \^data_opa\(0),
      O => \Status_OBUF[1]_inst_i_5_n_0\
    );
\Status_OBUF[1]_inst_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \^data_opa\(5),
      I1 => \^data_opb\(5),
      I2 => \^data_opa\(4),
      I3 => \^data_opb\(4),
      I4 => \^data_opb\(3),
      I5 => \^data_opa\(3),
      O => \Status_OBUF[1]_inst_i_6_n_0\
    );
\Status_OBUF[1]_inst_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^data_opa\(7),
      I1 => \^data_opb\(7),
      O => \Status_OBUF[1]_inst_i_7_n_0\
    );
\Status_OBUF[1]_inst_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^data_opa\(6),
      I1 => \^data_opb\(6),
      O => \Status_OBUF[1]_inst_i_8_n_0\
    );
\Status_OBUF[1]_inst_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \^data_opa\(4),
      I1 => \^data_opa\(5),
      I2 => \^data_opa\(2),
      I3 => \^data_opa\(3),
      I4 => \^data_opa\(7),
      I5 => \^data_opa\(6),
      O => \Status_OBUF[1]_inst_i_9_n_0\
    );
\Status_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2008"
    )
        port map (
      I0 => \Status[0]\,
      I1 => p_0_in(0),
      I2 => \^data_opb\(7),
      I3 => \^data_opa\(7),
      O => Status_OBUF(1)
    );
\i__carry_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^data_opb\(0),
      O => S(0)
    );
register_speicher_reg_0_31_0_0: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => addr_opa(0),
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => w_e_regfile,
      D => data_in(0),
      DPO => \^data_opb\(0),
      DPRA0 => addr_opb(0),
      DPRA1 => '0',
      DPRA2 => '0',
      DPRA3 => '0',
      DPRA4 => w_e_SREG_OBUF(0),
      SPO => \^data_opa\(0),
      WCLK => clk_IBUF_BUFG,
      WE => w_e_regfile
    );
register_speicher_reg_0_31_1_1: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => addr_opa(0),
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => w_e_regfile,
      D => data_in(1),
      DPO => \^data_opb\(1),
      DPRA0 => addr_opb(0),
      DPRA1 => '0',
      DPRA2 => '0',
      DPRA3 => '0',
      DPRA4 => w_e_SREG_OBUF(0),
      SPO => \^data_opa\(1),
      WCLK => clk_IBUF_BUFG,
      WE => w_e_regfile
    );
register_speicher_reg_0_31_2_2: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => addr_opa(0),
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => w_e_regfile,
      D => data_in(2),
      DPO => \^data_opb\(2),
      DPRA0 => addr_opb(0),
      DPRA1 => '0',
      DPRA2 => '0',
      DPRA3 => '0',
      DPRA4 => w_e_SREG_OBUF(0),
      SPO => \^data_opa\(2),
      WCLK => clk_IBUF_BUFG,
      WE => w_e_regfile
    );
register_speicher_reg_0_31_3_3: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => addr_opa(0),
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => w_e_regfile,
      D => data_in(3),
      DPO => \^data_opb\(3),
      DPRA0 => addr_opb(0),
      DPRA1 => '0',
      DPRA2 => '0',
      DPRA3 => '0',
      DPRA4 => w_e_SREG_OBUF(0),
      SPO => \^data_opa\(3),
      WCLK => clk_IBUF_BUFG,
      WE => w_e_regfile
    );
register_speicher_reg_0_31_4_4: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => addr_opa(0),
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => w_e_regfile,
      D => data_in(4),
      DPO => \^data_opb\(4),
      DPRA0 => addr_opb(0),
      DPRA1 => '0',
      DPRA2 => '0',
      DPRA3 => '0',
      DPRA4 => w_e_SREG_OBUF(0),
      SPO => \^data_opa\(4),
      WCLK => clk_IBUF_BUFG,
      WE => w_e_regfile
    );
register_speicher_reg_0_31_5_5: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => addr_opa(0),
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => w_e_regfile,
      D => data_in(5),
      DPO => \^data_opb\(5),
      DPRA0 => addr_opb(0),
      DPRA1 => '0',
      DPRA2 => '0',
      DPRA3 => '0',
      DPRA4 => w_e_SREG_OBUF(0),
      SPO => \^data_opa\(5),
      WCLK => clk_IBUF_BUFG,
      WE => w_e_regfile
    );
register_speicher_reg_0_31_6_6: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => addr_opa(0),
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => w_e_regfile,
      D => data_in(6),
      DPO => \^data_opb\(6),
      DPRA0 => addr_opb(0),
      DPRA1 => '0',
      DPRA2 => '0',
      DPRA3 => '0',
      DPRA4 => w_e_SREG_OBUF(0),
      SPO => \^data_opa\(6),
      WCLK => clk_IBUF_BUFG,
      WE => w_e_regfile
    );
register_speicher_reg_0_31_7_7: unisim.vcomponents.RAM32X1D
    generic map(
      INIT => X"00000000"
    )
        port map (
      A0 => addr_opa(0),
      A1 => '0',
      A2 => '0',
      A3 => '0',
      A4 => w_e_regfile,
      D => data_in(7),
      DPO => \^data_opb\(7),
      DPRA0 => addr_opb(0),
      DPRA1 => '0',
      DPRA2 => '0',
      DPRA3 => '0',
      DPRA4 => w_e_SREG_OBUF(0),
      SPO => \^data_opa\(7),
      WCLK => clk_IBUF_BUFG,
      WE => w_e_regfile
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity toplevel is
  port (
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    w_e_SREG : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Status : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of toplevel : entity is true;
end toplevel;

architecture STRUCTURE of toplevel is
  signal OPCODE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PC_reg_reg : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Program_Counter_1_n_15 : STD_LOGIC;
  signal Program_Counter_1_n_20 : STD_LOGIC;
  signal Program_Counter_1_n_21 : STD_LOGIC;
  signal Program_Counter_1_n_22 : STD_LOGIC;
  signal Program_Counter_1_n_23 : STD_LOGIC;
  signal Program_Counter_1_n_24 : STD_LOGIC;
  signal Program_Counter_1_n_25 : STD_LOGIC;
  signal Program_Counter_1_n_26 : STD_LOGIC;
  signal Program_Counter_1_n_3 : STD_LOGIC;
  signal Reg_File_1_n_18 : STD_LOGIC;
  signal Reg_File_1_n_19 : STD_LOGIC;
  signal Reg_File_1_n_20 : STD_LOGIC;
  signal Status_OBUF : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal addr_opa : STD_LOGIC_VECTOR ( 0 to 0 );
  signal addr_opb : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal data_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data_opa : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data_opb : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal reset_IBUF : STD_LOGIC;
  signal w_e_SREG_OBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal w_e_regfile : STD_LOGIC;
begin
ALU_1: entity work.ALU
     port map (
      DI(0) => OPCODE(0),
      S(3) => Program_Counter_1_n_24,
      S(2) => Program_Counter_1_n_25,
      S(1) => Program_Counter_1_n_26,
      S(0) => Reg_File_1_n_20,
      \Status[1]\ => Program_Counter_1_n_15,
      \Status[1]_0\ => Reg_File_1_n_18,
      \Status[1]_1\ => Reg_File_1_n_19,
      Status_OBUF(0) => Status_OBUF(1),
      data_opa(6 downto 0) => data_opa(6 downto 0),
      p_0_in(7 downto 0) => p_0_in(7 downto 0),
      register_speicher_reg_0_31_4_4_i_1(3) => Program_Counter_1_n_20,
      register_speicher_reg_0_31_4_4_i_1(2) => Program_Counter_1_n_21,
      register_speicher_reg_0_31_4_4_i_1(1) => Program_Counter_1_n_22,
      register_speicher_reg_0_31_4_4_i_1(0) => Program_Counter_1_n_23
    );
Program_Counter_1: entity work.Program_Counter
     port map (
      DI(0) => OPCODE(0),
      \PC_reg_reg[0]_0\ => Program_Counter_1_n_15,
      \PC_reg_reg[1]_0\(3) => Program_Counter_1_n_20,
      \PC_reg_reg[1]_0\(2) => Program_Counter_1_n_21,
      \PC_reg_reg[1]_0\(1) => Program_Counter_1_n_22,
      \PC_reg_reg[1]_0\(0) => Program_Counter_1_n_23,
      \PC_reg_reg[6]_0\ => Program_Counter_1_n_3,
      Q(1 downto 0) => PC_reg_reg(1 downto 0),
      S(2) => Program_Counter_1_n_24,
      S(1) => Program_Counter_1_n_25,
      S(0) => Program_Counter_1_n_26,
      SR(0) => reset_IBUF,
      Status_OBUF(1) => Status_OBUF(4),
      Status_OBUF(0) => Status_OBUF(2),
      addr_opa(0) => addr_opa(0),
      addr_opb(0) => addr_opb(0),
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      data_in(7 downto 0) => data_in(7 downto 0),
      data_opa(7 downto 0) => data_opa(7 downto 0),
      data_opb(7 downto 0) => data_opb(7 downto 0),
      p_0_in(7 downto 0) => p_0_in(7 downto 0),
      w_e_SREG_OBUF(1 downto 0) => w_e_SREG_OBUF(1 downto 0),
      w_e_regfile => w_e_regfile
    );
Reg_File_1: entity work.Reg_File
     port map (
      \PC_reg_reg[0]\ => Reg_File_1_n_18,
      \PC_reg_reg[1]\ => Reg_File_1_n_19,
      Q(1 downto 0) => PC_reg_reg(1 downto 0),
      S(0) => Reg_File_1_n_20,
      \Status[0]\ => Program_Counter_1_n_15,
      Status_OBUF(1) => Status_OBUF(3),
      Status_OBUF(0) => Status_OBUF(0),
      \Status_OBUF[1]_inst_i_1\ => Program_Counter_1_n_3,
      addr_opa(0) => addr_opa(0),
      addr_opb(0) => addr_opb(0),
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      data_in(7 downto 0) => data_in(7 downto 0),
      data_opa(7 downto 0) => data_opa(7 downto 0),
      data_opb(7 downto 0) => data_opb(7 downto 0),
      p_0_in(0) => p_0_in(7),
      w_e_SREG_OBUF(0) => w_e_SREG_OBUF(1),
      w_e_regfile => w_e_regfile
    );
\Status_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Status_OBUF(0),
      O => Status(0)
    );
\Status_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Status_OBUF(1),
      O => Status(1)
    );
\Status_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Status_OBUF(2),
      O => Status(2)
    );
\Status_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Status_OBUF(3),
      O => Status(3)
    );
\Status_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Status_OBUF(4),
      O => Status(4)
    );
\Status_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => Status(5)
    );
\Status_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => Status(6)
    );
\Status_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => Status(7)
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
\w_e_SREG_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => w_e_SREG_OBUF(0),
      O => w_e_SREG(0)
    );
\w_e_SREG_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => w_e_SREG_OBUF(1),
      O => w_e_SREG(1)
    );
\w_e_SREG_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => w_e_SREG_OBUF(1),
      O => w_e_SREG(2)
    );
\w_e_SREG_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => w_e_SREG_OBUF(1),
      O => w_e_SREG(3)
    );
\w_e_SREG_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => w_e_SREG_OBUF(1),
      O => w_e_SREG(4)
    );
\w_e_SREG_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => w_e_SREG_OBUF(0),
      O => w_e_SREG(5)
    );
\w_e_SREG_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => w_e_SREG(6)
    );
\w_e_SREG_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => w_e_SREG(7)
    );
end STRUCTURE;
