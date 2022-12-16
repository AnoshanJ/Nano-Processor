----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 04:53:50 PM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
COMPONENT HA
Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC);
           END COMPONENT;
           
SIGNAL HA0_SUM,HA0_CARRY,HA1_SUM,HA1_CARRY:STD_LOGIC;
begin
HA_0:HA
PORT MAP(
A=>A,
B=>B,
S=>HA0_SUM,
C=>HA0_CARRY);

HA_1:HA
PORT MAP(
A=>HA0_SUM,
B=>C_IN,
S=>HA1_SUM,
C=>HA1_CARRY);


C_OUT<=HA0_CARRY OR HA1_CARRY;
SUM<=HA1_SUM;


end Behavioral;
