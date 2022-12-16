----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 11:34:31 PM
-- Design Name: 
-- Module Name: Nanoporcessor_TB - Behavioral
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

entity NanoProcessor_TB is
--  Port ( );
end NanoProcessor_TB;

architecture Behavioral of NanoProcessor_TB is

component NanoProcessor
Port ( Clk : in std_logic;
       Res : in std_logic);
end component;

signal Res : std_logic := '1';
signal Clk_in : std_logic := '0';
begin

UUT : NanoProcessor
    port map(
    Clk=>Clk_in, 
    Res=>Res   
    );
    
    process
    begin
    
    wait for 5ns;
    Clk_in <= not(Clk_in); 
    
    end process;     
    
    process
        begin
        
        wait for 110ns;
        Res<='0'; 
        wait;
        
        end process;       


end Behavioral;
