----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 04:58:03 PM
-- Design Name: 
-- Module Name: BIT_3_ADDER - Behavioral
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

entity BIT_3_ADDER is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_IN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_OUT : out STD_LOGIC);
end BIT_3_ADDER;

architecture Behavioral of BIT_3_ADDER is
COMPONENT FA
Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
           
 END COMPONENT;       
 SIGNAL FA0_C,FA1_C:STD_LOGIC;

begin
FA_0:FA
PORT MAP(
A=>A(0),
B=>'1',
C_IN=>'0',
SUM=>S(0),
C_OUT=>FA0_C);

FA_1:FA
PORT MAP(
A=>A(1),
B=>'0',
C_IN=>FA0_C,
SUM=>S(1),
C_OUT=>FA1_C);

FA_2:FA
PORT MAP(
A=>A(2),
B=>'0',
C_IN=>FA1_C,
SUM=>S(2),
C_OUT=>C_OUT);



end Behavioral;
