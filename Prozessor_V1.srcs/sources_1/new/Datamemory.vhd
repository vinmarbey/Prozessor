----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2021 13:22:26
-- Design Name: 
-- Module Name: Datamemory - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Datamemory is
    Port ( clk : in STD_LOGIC;
           DM_Data_in : in STD_LOGIC_VECTOR (7 downto 0);
           DM_Addr : in STD_LOGIC_VECTOR (9 downto 0);
           w_e_data : in STD_LOGIC;
           DM_Data_out : out STD_LOGIC_VECTOR (7 downto 0));
end Datamemory;

architecture Behavioral of Datamemory is
    type ram_type is array (1023 downto 0) of std_logic_vector (7 downto 0);
    signal RAM : ram_type;
begin
    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (w_e_data = '1') then
                RAM(to_integer(unsigned(DM_Addr))) <= DM_Data_in;
            end if;
        end if;
    end process;

    DM_Data_out <= RAM(to_integer(unsigned(DM_Addr)));

end Behavioral;
