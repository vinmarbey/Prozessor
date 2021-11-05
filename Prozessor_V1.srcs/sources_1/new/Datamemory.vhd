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
    Port ( clk          : in STD_LOGIC;
           DM_Data_in   : in STD_LOGIC_VECTOR (7 downto 0);
           DM_Addr      : in STD_LOGIC_VECTOR (9 downto 0);
           w_e_data     : in STD_LOGIC;
           DM_Data_out  : out STD_LOGIC_VECTOR (7 downto 0);
           PIND         : in std_logic_vector (7 downto 0);
           PINC         : in std_logic_vector (7 downto 0);
           PINB         : in std_logic_vector (7 downto 0);
           PORTC        : out std_logic_vector(7 downto 0);
           PORTB        : out std_logic_vector(7 downto 0);
           SER        : out std_logic_vector(7 downto 0);
           SEG0_N        : out std_logic_vector(7 downto 0);
           SEG1_N        : out std_logic_vector(7 downto 0);
           SEG2_N        : out std_logic_vector(7 downto 0);
           SEG3_N        : out std_logic_vector(7 downto 0)
           --I2C_SCR_in    : in std_logic_vector(7 downto 0);
           --I2C_SCR_out   : out std_logic_vector(7 downto 0);
           --I2C_DaTr      : out std_logic_vector(7 downto 0);
           --I2C_DaRR      : in std_logic_vector(7 downto 0)
           );
end Datamemory;

architecture Behavioral of Datamemory is
    type ram_type is array (1023 downto 0) of std_logic_vector (7 downto 0);
    signal RAM              : ram_type;
    signal pind_temp        : std_logic_vector(7 downto 0);
    signal pinc_temp        : std_logic_vector(7 downto 0);
    signal pinb_temp        : std_logic_vector(7 downto 0);
    --signal i2c_scr_in_temp  : std_logic_vector(7 downto 0);
    --signal i2c_darr_temp    : std_logic_vector(7 downto 0);
    
begin
    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (w_e_data = '1') then
                RAM(to_integer(unsigned(DM_Addr))) <= DM_Data_in;
            end if;
            pind_temp <= pind;
            pinc_temp <= pinc;
            pinb_temp <= pinb;
--            i2c_scr_in_temp <= i2c_scr_in;
--            i2c_darr_temp <= i2c_darr;
        end if;
    end process;
    
    --Memory_Mapped Input
    process (DM_Addr)
    begin
      case DM_Addr is
        when "0000110000" =>
          DM_Data_out <= pind_temp;
        when "0000110011" =>
          DM_Data_out <= pinc_temp;
        when "0000110110" =>
          DM_Data_out <= pinb_temp;
--        when "0001010000" =>
--          DM_Data_out <= i2c_scr_in_temp;
--        when "0001010010" =>
--          DM_Data_out <= i2c_darr_temp;
        when others => 
          DM_Data_out <= RAM(to_integer(unsigned(DM_Addr)));
      end case;
    end process;
      
--    DM_Data_out <= RAM(to_integer(unsigned(DM_Addr)));
    
    -- Memory-Mapped Output
    PORTC <= RAM(53); -- 0x36
    PORTB <= RAM(56); -- 0x38
    SER <= RAM(64); -- 0x40
    SEG0_N <= RAM(65); -- 0x41
    SEG1_N <= RAM(66); -- 0x42
    SEG2_N <= RAM(67); -- 0x43
    SEG3_N <= RAM(68); -- 0x44
--    I2c_SCR_out <= RAM(80); -- 0x50
--    I2c_DaTr <= RAM(81); -- 0x51
    

end Behavioral;
