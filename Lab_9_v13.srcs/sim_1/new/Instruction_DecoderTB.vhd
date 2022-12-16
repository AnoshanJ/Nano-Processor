----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:23:46 AM
-- Design Name: 
-- Module Name: Instruction_DecoderTB - Behavioral
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

entity Instruction_DecoderTB is
--  Port ( );
end Instruction_DecoderTB;

architecture Behavioral of Instruction_DecoderTB is

component Instruction_Decoder
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
end component;

signal I : STD_LOGIC_VECTOR (11 downto 0);
signal Load_Select : std_logic;
signal Jump_Flag : std_logic;
signal Jump_Address : STD_LOGIC_VECTOR (2 downto 0);
signal  Add_Sub_Select : std_logic;
signal Mux_In : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_En : STD_LOGIC_VECTOR (2 downto 0);
signal Data_Immediate : STD_LOGIC_VECTOR (3 downto 0);
signal Mux1_Control : STD_LOGIC_VECTOR (2 downto 0);
signal  Mux2_Control : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Instruction_Decoder
    port map(
    I=>I,
    Load_Select=>Load_Select,
    Jump_Flag=>Jump_Flag,
    Jump_Address =>Jump_Address,
   Add_Sub_Select=>Add_Sub_Select,
    Mux_In=>"0000",
    Reg_En=>Reg_En,
    Data_Immediate=>Data_Immediate,
    Mux1_Control =>Mux1_Control,
     Mux2_Control=>Mux2_Control
     );
     
 process
    begin
  wait for 20ns;
  I<="100010000011";
  wait for 20ns;
  I<="100100000010";
  wait for 20ns;
  I<="100110000001";
  wait for 20ns;
  I<="000110010000";
  wait for 20ns;
  I<="000110100000";
  wait for 20ns;
  I<="010110100000";
  wait for 20ns;
  I<="101110110111";
  wait for 20ns;
  I<="110000010111";
  wait;    
  end process;


end Behavioral;
