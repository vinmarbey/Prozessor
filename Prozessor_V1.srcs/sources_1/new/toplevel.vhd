----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2015 08:45:28 PM
-- Design Name: 
-- Module Name: toplevel - Behavioral
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
use IEEE.numeric_std.all;
--library work;
use work.pkg_processor.all;
use work.pkg_instrmem.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel is
  port (

    -- global ports
    reset : in STD_LOGIC;
    clk   : in STD_LOGIC;

    -- ports to "decoder_1"
    --w_e_SREG : out std_logic_vector(7 downto 0);

    -- ports to "ALU_1"
    --Status : out STD_LOGIC_VECTOR (7 downto 0);
    Result : out STD_LOGIC_VECTOR (7 downto 0);
    
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
    
    
    

end toplevel;

architecture Behavioral of toplevel is
  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  -- outputs of "Program_Counter_1"
  signal Addr : STD_LOGIC_VECTOR (8 downto 0);

  -- outputs of "prog_mem_1"
  signal Instr : STD_LOGIC_VECTOR (15 downto 0);

  -- outputs of "decoder_1"
   signal  addr_opa    : std_logic_vector(4 downto 0);
   signal  addr_opb    : std_logic_vector(4 downto 0);
   signal  OPCODE      : std_logic_vector(4 downto 0);
   signal  w_e_regfile : std_logic;
   signal  w_e_SREG    : std_logic_vector (7 downto 0);
   signal w_e_Data     : std_logic;
   signal sel_Data     : std_logic;
   signal data_immediate : std_logic_vector (7 downto 0);
   signal  sel_immediate : std_logic;
   signal add_PC        : std_logic_vector (8 downto 0);
   signal sel_immediate_to_ALU : std_logic;

  -- outputs of Regfile
  signal data_opa : std_logic_vector (7 downto 0);
  signal data_opb : std_logic_vector (7 downto 0);
  signal Z_Addr   : std_logic_vector (9 downto 0);
  
  -- output of ALU
  signal data_res : std_logic_vector(7 downto 0);
  signal Status   : std_logic_vector(7 downto 0);
  
  -- output of SREG
  signal SREG_OUT : std_logic_vector(7 downto 0);
  
  -- output of Datamemory
  signal DM_Data_out : std_logic_vector(7 downto 0); 

  -- auxiliary signals
  signal PM_data : std_logic_vector(7 downto 0);  -- used for wiring immediate data
  signal Result_ALU_DM : std_logic_vector(7 downto 0); -- used for switching ALU and DM Data
  signal Data_B : std_logic_vector(7 downto 0);
  
  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------

  component Program_Counter
    port (
      reset : in  STD_LOGIC;
      add_PC : in std_logic_vector (8 downto 0);
      clk   : in  STD_LOGIC;
      Addr  : out STD_LOGIC_VECTOR (8 downto 0));
  end component;

  component prog_mem
    port (
      Addr  : in  STD_LOGIC_VECTOR (8 downto 0);
      Instr : out STD_LOGIC_VECTOR (15 downto 0));
  end component;
  
 
  component decoder
    port (
      Instr         : in  std_logic_vector(15 downto 0);
      SREG_OUT      : in std_logic_vector(7 downto 0);
      addr_opa      : out std_logic_vector(4 downto 0);
      addr_opb      : out std_logic_vector(4 downto 0);
      OPCODE        : out std_logic_vector(4 downto 0);
      w_e_regfile   : out std_logic;
      w_e_SREG      : out std_logic_vector(7 downto 0);
      w_e_Data      : out std_logic;
      sel_Data      : out std_logic;
      data_immediate: out std_logic_vector(7 downto 0);
      sel_immediate : out std_logic;
      sel_immediate_to_ALU :out std_logic;
      add_PC        : out std_logic_vector (8 downto 0)
      );
  end component;
  
  component Reg_File
    port (
      clk           : in  STD_LOGIC;
      addr_opa      : in  STD_LOGIC_VECTOR (4 downto 0);
      addr_opb      : in  STD_LOGIC_VECTOR (4 downto 0);
      w_e_regfile   : in  STD_LOGIC;
      data_opa      : out STD_LOGIC_VECTOR (7 downto 0);
      data_opb      : out STD_LOGIC_VECTOR (7 downto 0);
      Z_Addr        : out std_logic_vector (9 downto 0);
      data_in       : in  STD_LOGIC_VECTOR (7 downto 0)
      );
  end component;

  component ALU
    port (
      OPCODE : in  STD_LOGIC_VECTOR (4 downto 0);
      OPA    : in  STD_LOGIC_VECTOR (7 downto 0);
      OPB    : in  STD_LOGIC_VECTOR (7 downto 0);
      RES    : out STD_LOGIC_VECTOR (7 downto 0);
      Status : out STD_LOGIC_VECTOR (7 downto 0)
      );
  end component;
  
  component SREG
    port ( 
      clk : in STD_LOGIC;
      w_e_SREG : in STD_LOGIC_VECTOR (7 downto 0);
      Status : in STD_LOGIC_VECTOR (7 downto 0);
      SREG_OUT : out STD_LOGIC_VECTOR (7 downto 0)
      );
  end component;
  
  component Datamemory
    Port ( 
      clk : in STD_LOGIC;
      DM_Data_in : in STD_LOGIC_VECTOR (7 downto 0);
      DM_Addr : in STD_LOGIC_VECTOR (9 downto 0);
      w_e_data : in STD_LOGIC;
      DM_Data_out : out STD_LOGIC_VECTOR (7 downto 0);
      PIND         : in std_logic_vector (7 downto 0);
           PINC         : in std_logic_vector (7 downto 0);
           PINB         : in std_logic_vector (7 downto 0);
           PORTC        : out std_logic_vector(7 downto 0);
           PORTB        : out std_logic_vector(7 downto 0);
           SER        : out std_logic_vector(7 downto 0);
           SEG0_N        : out std_logic_vector(7 downto 0);
           SEG1_N        : out std_logic_vector(7 downto 0);
           SEG2_N        : out std_logic_vector(7 downto 0);
           SEG3_N        : out std_logic_vector(7 downto 0));
  end component;

begin

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  -- instance "Program_Counter_1"
  Program_Counter_1: Program_Counter
    port map (
      reset => reset,
      add_PC => add_PC,
      clk   => clk,
      Addr  => Addr);

  -- instance "prog_mem_1"
  prog_mem_1: prog_mem
    port map (
      Addr  => Addr,
      Instr => Instr);
  
  -- instance "decoder_1"
  decoder_1: decoder
    port map (
      Instr         => Instr,
      SREG_OUT      => SREG_OUT,
      addr_opa      => addr_opa,
      addr_opb      => addr_opb,
      OPCODE        => OPCODE,
      w_e_regfile   => w_e_regfile,
      w_e_SREG      => w_e_SREG,
      data_immediate => data_immediate,
      sel_immediate => sel_immediate,
      sel_immediate_to_ALU => sel_immediate_to_ALU,
      add_PC        => add_PC,
      w_e_Data      => w_e_Data,
      sel_Data      => sel_Data);
  


  -- instance "Reg_File_1"

  Reg_File_1: Reg_File
    port map (
      clk           => clk,
      addr_opa      => addr_opa,
      addr_opb      => addr_opb,
      w_e_regfile   => w_e_regfile,
      data_opa      => data_opa,
      data_opb      => data_opb,
      Z_Addr        => Z_Addr,
      data_in      => PM_Data
      );
  
  -- instance "ALU_1"
  ALU_1: ALU
    port map (
      OPCODE => OPCODE,
      OPA    => data_opa,
      OPB    => Data_B,
      RES    => data_res,
      Status => Status);
      
  -- instance "SREG_1"
  SREG_1: SREG
    port map (
      clk       => clk,
      w_e_SREG  => w_e_SREG,
      Status    => Status,
      SREG_OUT  => SREG_OUT);
    
    -- instance "Datamemory_1"
  Datamemory_1: Datamemory
    port map (
      clk           => clk,
      DM_Data_in    => data_opb,
      DM_Addr       => Z_Addr,
      w_e_Data      => w_e_Data,
      DM_Data_out   => DM_Data_out,
      PIND =>PIND,
    PINC =>PINC,
    PINB =>PINB,
    PORTC =>PORTC,
    PORTB =>PORTB,
    SER =>SER,
    SEG0_N  =>SEG0_N,
    SEG1_N =>SEG1_N,
    SEG2_N =>SEG2_N,
    SEG3_N =>SEG3_N);

  --PM_Data <=  Instr(11 downto 8)&Instr(3 downto 0);
  
  -- MUX for either using data_immediate or data_res
  PM_Data <= Result_ALU_DM                                 when sel_immediate = '0' else
              data_immediate;
              --Instr(11 downto 8)&Instr(3 downto 0)    ;
  
  Result_ALU_DM <=  data_res when sel_data = '0' else
                    DM_Data_out;
                    
  Data_B <= data_opb when sel_immediate_to_ALU = '0' else
            data_immediate;
  
  Result <= Result_ALU_DM;
  

end Behavioral;