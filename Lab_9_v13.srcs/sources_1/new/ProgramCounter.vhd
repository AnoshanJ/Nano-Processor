----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 11:12:41 PM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( Clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Res : in STD_LOGIC;
           add_in : in STD_LOGIC_VECTOR (2 downto 0);
           add_out : out STD_LOGIC_VECTOR (2 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

process (Clk)

begin 
    if(rising_edge(Clk)) then
        if En='1' then
            if Res='0' then  
                add_out<=add_in;
            end if;
            if Res='1' then
                add_out<="000";
            end if;            
         end if;   
      end if;
end process;


end Behavioral;
