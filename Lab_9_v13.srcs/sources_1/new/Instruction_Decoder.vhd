----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 10:58:23 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           Load_Select : out std_logic;
           Jump_Flag : out std_logic;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Select : out std_logic;
           Mux_In : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Data_Immediate : out STD_LOGIC_VECTOR (3 downto 0);
           Mux1_Control : out STD_LOGIC_VECTOR (2 downto 0);
           Mux2_Control : out STD_LOGIC_VECTOR (2 downto 0))
           ;
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

--signal instruction : STD_LOGIC_VECTOR (11 downto 0);

begin
 Load_Select<=I(11) AND NOT (I(10)); --move instruction
 Add_Sub_Select<=NOT(I(11)) AND (I(10));
 Reg_En(0)<=I(7); -- correct
 Reg_En(1)<=I(8); -- correct
 Reg_En(2)<=I(9); -- correct
 Mux1_Control(0)<=I(7); -- correct
 Mux1_Control(1)<=I(8); -- correct
 Mux1_Control(2)<=I(9); -- correct
 Mux2_Control(0)<=I(4); -- correct
 Mux2_Control(1)<=I(5); -- correct
 Mux2_Control(2)<=I(6); -- correct
 Data_Immediate(0)<=(I(0) AND (NOT(I(4)) AND NOT(I(5)) AND NOT(I(6)))) OR ((I(4) OR I(5) OR I(6)) AND Mux_In(0)); -- correct
 Data_Immediate(1)<=(I(1) AND (NOT(I(4)) AND NOT(I(5)) AND NOT(I(6)))) OR ((I(4) OR I(5) OR I(6)) AND Mux_In(1)); -- correct
 Data_Immediate(2)<=(I(2) AND (NOT(I(4)) AND NOT(I(5)) AND NOT(I(6)))) OR ((I(4) OR I(5) OR I(6)) AND Mux_In(2)); -- correct
 Data_Immediate(3)<=(I(3) AND (NOT(I(4)) AND NOT(I(5)) AND NOT(I(6)))) OR ((I(4) OR I(5) OR I(6)) AND Mux_In(3)); -- correct
 Jump_Address(0)<=I(0); -- correct
 Jump_Address(1)<=I(1); -- correct
 Jump_Address(2)<=I(2); -- correct
 Jump_Flag<=I(11) AND I(10) AND NOT(Mux_In(0)) AND NOT (Mux_In(1)) AND NOT (Mux_In(2)) AND NOT (Mux_In(3));
 -- 1 1 R R R 0 0 0 0 d d d is old syntax for jump instruction, new syntax is 1 1 0 0 0 R R R 0 d d d
end Behavioral;
