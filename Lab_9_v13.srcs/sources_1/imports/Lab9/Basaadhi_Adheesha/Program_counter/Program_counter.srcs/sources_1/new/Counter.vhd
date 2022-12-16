----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 02:03:44 AM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC);
end Counter;

architecture Behavioral of Counter is

component D_FF
Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
          END COMPONENT;


signal D0,D1,D2:STD_LOGIC;
signal Q_0,Q_1,Q_2:STD_LOGIC;


begin

 
D_FF0:D_FF
PORT MAP(D=>D0,
Res=>Res,
Clk=>Clk,
Q=>Q_0);

D_FF1:D_FF
PORT MAP(D=>D1,
Res=>Res,
Clk=>Clk,
Q=>Q_1);

D_FF2:D_FF
PORT MAP(
D=>D2,
Res=>Res,
Clk=>Clk,
Q=>Q_2);


D0<=Not(Dir) or (Q_1 AND Dir) or (Q_1 and Q_0);
D1<=(Dir and Q_2) or (Q_0 and not(Dir));
D2<=(Q_1 and not(Q_0)) or (not(Q_0) and Dir) or (Q_0 and Q_1);
Q0 <=Q_0;
Q1 <=Q_1;
Q2 <=Q_2;




end Behavioral;
