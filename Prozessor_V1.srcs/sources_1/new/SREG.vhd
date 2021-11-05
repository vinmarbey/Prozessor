----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2021 12:00:51
-- Design Name: 
-- Module Name: SREG - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SREG is
    Port ( clk : in STD_LOGIC;
           w_e_SREG : in STD_LOGIC_VECTOR (7 downto 0);
           Status : in STD_LOGIC_VECTOR (7 downto 0);
           SREG_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end SREG;

architecture Behavioral of SREG is
signal SREG_Speicher : std_logic_vector(7 downto 0);
begin

  process (clk)
  begin
    if clk'event and clk = '1' then  -- rising clock edge
      if w_e_SREG /= "00000000" then
        SREG_Speicher <= w_e_SREG AND Status;
      end if;
    end if;
  end process;
  
  SREG_OUT <= SREG_Speicher;
end Behavioral;
