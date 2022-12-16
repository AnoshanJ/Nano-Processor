----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/16/2022 10:03:43 AM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
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
end RegisterBank;

architecture Behavioral of RegisterBank is

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal EnR0, EnR1, EnR2, EnR3, EnR4, EnR5, EnR6, EnR7: STD_LOGIC;          

begin


Decoder_3_to_8_RegBank : Decoder_3_to_8
    port map( I=>RegEnable,
              EN=>'1',
              Y(0)=>EnR0,
              Y(1)=>EnR1,
              Y(2)=>EnR2,
              Y(3)=>EnR3,
              Y(4)=>EnR4,
              Y(5)=>EnR5,
              Y(6)=>EnR6,
              Y(7)=>EnR7);              
              
    
RegR0 : Reg
    port map(
    D=>"0000", 
    En=>'0',
    Reset=>Clr, 
    Clk=>Clk, 
    Q=>R0
    );
    
RegR1 : Reg
        port map(
        D=>Data, 
        En=>EnR1,
        Reset=>Clr, 
        Clk=>Clk, 
        Q=>R1
        );

RegR2 : Reg
        port map(
        D=>Data, 
        En=>EnR2,
        Reset=>Clr, 
        Clk=>Clk, 
        Q=>R2
        );

RegR3 : Reg
        port map(
        D=>Data, 
        En=>EnR3,
        Reset=>Clr, 
        Clk=>Clk, 
        Q=>R3
        ); 
        
RegR4 : Reg
            port map(
            D=>Data, 
            En=>EnR4,
            Reset=>Clr, 
            Clk=>Clk, 
            Q=>R4
            ); 
                
RegR5 : Reg
            port map(
            D=>Data, 
            En=>EnR5,
            Reset=>Clr, 
            Clk=>Clk, 
            Q=>R5
            ); 
                        
RegR6 : Reg
            port map(
            D=>Data, 
            En=>EnR6,
            Reset=>Clr, 
            Clk=>Clk, 
            Q=>R6
            ); 
                                
RegR7 : Reg
            port map(
            D=>Data, 
            En=>EnR7,
            Reset=>Clr, 
            Clk=>Clk, 
            Q=>R7
            ); 


end Behavioral;
