----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 07:23:11 AM
-- Design Name: 
-- Module Name: Reg_Bank_TB - Behavioral
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

entity Reg_Bank_TB is
--  Port ( );
end Reg_Bank_TB;



architecture Behavioral of Reg_Bank_TB is

component RegisterBank
    Port ( RegEnable : in STD_LOGIC_VECTOR (2 downto 0);
           Data : in STD_LOGIC_VECTOR (3 downto 0);          
           Clk : in STD_LOGIC; --Make sure to input Slow Clock
           Clr : in STD_LOGIC; --Assign to reset button
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clr : STD_LOGIC;
signal RegEnable : STD_LOGIC_VECTOR (2 downto 0);
signal Data, R0, R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR (3 downto 0); 
signal Clk : std_logic := '0';

begin

UUT : RegisterBank
    port map(
    RegEnable=>RegEnable,
    Data=>Data,
    Clk =>Clk,
    Clr =>Clr,
    R0=>R0,
    R1=>R1,
    R2=>R2,
    R3=>R3,
    R4=>R4,
    R5=>R5,
    R6=>R6,
    R7=>R7    
    );
    
    process
    begin    
    wait for 5ns;
    Clk <= not(Clk);     
    end process;   
      
    process
    begin
        Clr<='1';
        wait for 20ns;
        Clr<='0';
        RegEnable<="001";
        Data<="0001";
        wait for 20ns;
        RegEnable<="010";
        Data<="0010";
        wait for 20ns;
        RegEnable<="011";
        Data<="0011";
        wait for 20ns;
        RegEnable<="100";
        Data<="0100";
        wait for 20ns;
        RegEnable<="101";
        Data<="0101";
        wait for 20ns;
        RegEnable<="110";
        Data<="0110";
        wait for 20ns; 
        RegEnable<="111";
        Data<="0111";
        wait;
     
    end process;
 end Behavioral;
