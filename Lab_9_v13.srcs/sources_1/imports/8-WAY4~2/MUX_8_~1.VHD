----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 01:29:55 AM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit_with_3_to_8_decoder - Behavioral
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

entity Mux_8_way_4_bit_with_3_to_8_decoder is
    Port ( EN : in STD_LOGIC;
       C : in STD_LOGIC_VECTOR (2 downto 0);
       Bus_1 : in STD_LOGIC_VECTOR (3 downto 0);
       Bus_2 : in STD_LOGIC_VECTOR (3 downto 0);
       Bus_3 : in STD_LOGIC_VECTOR (3 downto 0);
       Bus_4 : in STD_LOGIC_VECTOR (3 downto 0);
       Bus_5 : in STD_LOGIC_VECTOR (3 downto 0);
       Bus_6 : in STD_LOGIC_VECTOR (3 downto 0);
       Bus_7 : in STD_LOGIC_VECTOR (3 downto 0);
       Bus_8 : in STD_LOGIC_VECTOR (3 downto 0);
       Out_Bus : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_way_4_bit_with_3_to_8_decoder;

architecture Behavioral of Mux_8_way_4_bit_with_3_to_8_decoder is
component Decoder_3_to_8
    PORT(
         I : in STD_LOGIC_VECTOR (2 downto 0);
              EN : in STD_LOGIC;
              Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
signal DY : STD_LOGIC_VECTOR (7 downto 0);
begin
    Decoder_3_to_8_0 : Decoder_3_to_8
        PORT MAP(
            I=>C,
            EN=>EN,
            Y=>DY
        );
Out_Bus(0) <= EN AND (
                (Bus_1(0) AND DY(0)) 
                OR (Bus_2(0) AND DY(1)) 
                OR (Bus_3(0) AND DY(2)) 
                OR (Bus_4(0) AND DY(3))
                OR (Bus_5(0) AND DY(4)) 
                OR (Bus_6(0) AND DY(5)) 
                OR (Bus_7(0) AND DY(6)) 
                OR (Bus_8(0) AND DY(7))
                );
Out_Bus(1) <= EN AND (
                (Bus_1(1) AND DY(0)) 
                OR (Bus_2(1) AND DY(1)) 
                OR (Bus_3(1) AND DY(2))
                OR (Bus_4(1) AND DY(3))
                OR (Bus_5(1) AND DY(4))
                OR (Bus_6(1) AND DY(5))
                OR (Bus_7(1) AND DY(6))
                OR (Bus_8(1) AND DY(7))
                );
Out_Bus(2) <= EN AND (
                (Bus_1(2) AND DY(0)) 
                OR (Bus_2(2) AND DY(1)) 
                OR (Bus_3(2) AND DY(2))
                OR (Bus_4(2) AND DY(3))
                OR (Bus_5(2) AND DY(4))
                OR (Bus_6(2) AND DY(5))
                OR (Bus_7(2) AND DY(6))
                OR (Bus_8(2) AND DY(7))
                );
Out_Bus(3) <= EN AND (
                (Bus_1(3) AND DY(0)) 
                OR (Bus_2(3) AND DY(1)) 
                OR (Bus_3(3) AND DY(2))
                OR (Bus_4(3) AND DY(3))
                OR (Bus_5(3) AND DY(4))
                OR (Bus_6(3) AND DY(5))
                OR (Bus_7(3) AND DY(6))
                OR (Bus_8(3) AND DY(7))
                );

end Behavioral;
