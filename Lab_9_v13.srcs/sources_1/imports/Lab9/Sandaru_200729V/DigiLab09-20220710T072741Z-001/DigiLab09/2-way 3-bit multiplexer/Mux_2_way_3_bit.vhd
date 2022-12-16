----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 11:38:39 PM
-- Design Name: 
-- Module Name: Mux_2_way_3_bit - Behavioral
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

entity Mux_2_way_3_bit is
    Port ( EN : in STD_LOGIC;
           C : in STD_LOGIC;
           Bus_1 : in STD_LOGIC_VECTOR (2 downto 0);
           Bus_2 : in STD_LOGIC_VECTOR (2 downto 0);
           Out_Bus : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_way_3_bit;

architecture Behavioral of Mux_2_way_3_bit is

begin
Out_Bus(0) <= EN AND ((Bus_1(0) AND NOT(C)) OR (Bus_2(0) AND C));
Out_Bus(1) <= EN AND ((Bus_1(1) AND NOT(C)) OR (Bus_2(1) AND C));
Out_Bus(2) <= EN AND ((Bus_1(2) AND NOT(C)) OR (Bus_2(2) AND C));

end Behavioral;
