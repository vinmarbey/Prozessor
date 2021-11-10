----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2021 10:24:04
-- Design Name: 
-- Module Name: seven_segment - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_segment is
    Port ( clk : in std_logic;
--           SEG_enable: in std_logic;
           SER : in STD_LOGIC_VECTOR (3 downto 0);
           SEG0_N : in STD_LOGIC_VECTOR (7 downto 0);
           SEG1_N : in STD_LOGIC_VECTOR (7 downto 0);
           SEG2_N : in STD_LOGIC_VECTOR (7 downto 0);
           SEG3_N : in STD_LOGIC_VECTOR (7 downto 0);
           SEG_Anode : out STD_LOGIC_VECTOR (3 downto 0);
           SEG_Kathode : out STD_LOGIC_VECTOR (7 downto 0));
end seven_segment;

architecture Behavioral of seven_segment is
  type state_type is (st1_AN0, st2_AN1, st3_AN2, st4_AN3);
  signal state, next_state : state_type;
  --Declare internal signals for all outputs of the state-machine
  signal SEG_Anode_tem : std_logic_vector(3 downto 0);
  signal SEG_Kathode_tem : std_logic_vector(7 downto 0);
  
begin
  
  SYNC_PROC: process (clk, next_state, SEG_Anode_tem, SEG_Kathode_tem)
   begin
      if (clk'event and clk = '1') then
--         if (SEG_enable = '1') then
            state <= next_state;
            SEG_Anode <= SEG_Anode_tem;
            SEG_Kathode <= SEG_Kathode_tem;
--         end if;
      end if;
   end process;

   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state, SEG3_N, SEG2_N, SEG1_N, SEG0_N, ser)
   begin
      --insert statements to decode internal output signals
      --below is simple example
      if state = st4_AN3 then
         SEG_Anode_tem <= "1000" and ser;
         SEG_Kathode_tem <= not SEG3_N;
      elsif state = st3_AN2 then
         SEG_Anode_tem <= "0100" and ser;
         SEG_Kathode_tem <= not SEG2_N;
      elsif state = st2_AN1 then
         SEG_Anode_tem <= "0010" and ser;
         SEG_Kathode_tem <= not SEG1_N;
      else --state = st1_AN0
         SEG_Anode_tem <= "0001" and ser;
         SEG_Kathode_tem <= not SEG0_N;
      end if;
   end process;

   NEXT_STATE_DECODE: process (state)
   begin
      --declare default state for next_state to avoid latches
      --next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when st4_AN3 =>
               next_state <= st3_AN2;
         when st3_AN2 =>
               next_state <= st2_AN1;
         when st2_AN1 =>
            next_state <= st1_AN0;
         when others =>
            next_state <= st4_AN3;
      end case;
   end process;

end Behavioral;
