----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 03:43:59 PM
-- Design Name: 
-- Module Name: addsub - Behavioral
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

entity addsub is
    port( 
              C_in: in std_logic;
              A,B  : in std_logic_vector(3 downto 0);
              Sum  : out std_logic_vector(3 downto 0);
              Negative, overflow,zero : out std_logic
              );
end addsub;

architecture Behavioral of addsub is
component Full_Adder is
  port( A, B, C_in : in std_logic;
        sum, C_out : out std_logic);
end component;
signal OutPut,R, Sum2: std_logic_vector(3 downto 0);
signal S1, S2, S3, S4: std_logic;

begin
OutPut <= B XOR (C_in & C_in & C_in & C_in);
FA0:Full_Adder 
    port map(
    A=>A(0),
    B=>OutPut(0),
    C_in=>C_in,
    sum=>Sum2(0),
    
    C_out=>S1);
    
FA1:Full_Adder
    port map(
    A=>A(1),
    B=>OutPut(1),
    C_in=>S1,
    sum=>Sum2(1),
    C_out=>S2);
    
FA2:Full_Adder
    port map(
    A=>A(2),
    B=>OutPut(2),
    C_in=>S2,
    sum=>Sum2(2),
    C_out=>S3); 
    
FA3:Full_Adder 
    port map(
    A=>A(3),
    B=>OutPut(3),
    C_in=>S3,
    sum=>Sum2(3),
    C_out=>S4);
        
overflow <= S3 XOR S4 ;
Negative <= Sum2(3);
Sum<=Sum2;
zero<=NOT(Sum2(0)) AND NOT(Sum2(1))AND NOT(Sum2(2)) AND NOT(Sum2(3));
    


end Behavioral;
