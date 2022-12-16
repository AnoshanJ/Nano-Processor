----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 03:14:07 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
       data : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

    signal Program_ROM : rom_type :=(
--         "100010000111", --MOVI R1, 7 ; R1 ? 7
--         "100100000001", --MOVI R2, 1 ; R2 ? 1
--         "010100000000", --NEG R2 ; R2 ? -R2
--         "000010100000", --ADD R1, R2 ; R1 ? R1 + R2
--         "110000010111", --JZR R1, 7 ; If R1 = 0 jump to line 7 --"110010000111", --JZR R1, 7 ; If R1 = 0 jump to line 7
--         "110000000011", --JZR R0, 3 ; If R0 = 0 jump to line 3
--         "100010001010", --MOVI R1, 10 ; R1 ? 10  --ADDED EXTRA
--         "100100000001" --MOVI R2, 1 ; R2 ? 1    1000 + 1111 = 0111

--            "100010000011",--MOV R1, 3
--            "100100000010",--MOV R2, 2
--            "100110000001", --MOV R3,1
--            "000110010000", -- ADD R3, R1
--            "000110100000",--ADD R3,R2 
--            "001110110000", --ADD R7,R3
--            "110000000111", --JZR R0,7
--            "110000010111" --JZR R1, 7  --"110010000111" --JZR R1, 7  
            
--           "100010000011",--MOV R1, 3
--           "100100000010",--MOV R2, 2
--           "100110000001", --MOV R3,1
--           "000110010000", -- ADD R3, R1 
--           "000110100000",--ADD R3,R2 
--           --"001110110000", --ADD R7,R3
--           "101110110111", --MOV R7, R3
--           "110000010111", --JZR R1, 7
--           "110000000111" --JZR R0, 7  --"110010000111" --JZR R1, 7 
           
           "101110000000", --MOV R7,0
           "100010000001",--MOV R1, 1
           "100100000010",--MOV R2, 2
           "100110000011", --MOV R3,3
           "001110010000", -- ADD R7, R1 
           "001110100000",--ADD R7,R2 
           "001110110000", --ADD R7,R3
--           "101110110111", --MOV R7, R3           
           "110000000000" --JZR R0, 7  --"110010000111" --JZR R1, 7 
    );

begin

    data <= Program_ROM(to_integer(unsigned(address)));

end Behavioral;
