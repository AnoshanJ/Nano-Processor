----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 10:39:11 PM
-- Design Name: 
-- Module Name: NanoProcess - Behavioral
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

entity NanoProcessor is
Port ( Clk : in std_logic;
       Res : in std_logic;
       Zero : out std_logic;
       Negative_out : out std_logic;
       sev_seg_output:out std_logic_vector(6 downto 0);
       Overflow : out std_logic;
       Anode : out STD_LOGIC_VECTOR (3 downto 0);
       R7_out:out std_logic_vector(3 downto 0));
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component addsub
    port(     C_in: in std_logic;
              A,B  : in std_logic_vector(3 downto 0);
              Sum  : inout std_logic_vector(3 downto 0);
              Negative, overflow,zero : out std_logic
              );
end component;

component BIT_3_ADDER
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_IN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_OUT : out STD_LOGIC);
end component;

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

component ProgramROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
       data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Mux_2_way_4_bit
    Port ( EN : in STD_LOGIC;
           C : in STD_LOGIC;
           Bus_1 : in STD_LOGIC_VECTOR (3 downto 0);
           Bus_2 : in STD_LOGIC_VECTOR (3 downto 0);
           Out_Bus : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component ProgramCounter
    Port ( Clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Res : in STD_LOGIC;
           add_in : in STD_LOGIC_VECTOR (2 downto 0);
           add_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Mux_2_way_3_bit
    Port ( EN : in STD_LOGIC;
           C : in STD_LOGIC;
           Bus_1 : in STD_LOGIC_VECTOR (2 downto 0);
           Bus_2 : in STD_LOGIC_VECTOR (2 downto 0);
           Out_Bus : out STD_LOGIC_VECTOR (2 downto 0));
end component;

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

component Mux_8_way_4_bit_with_3_to_8_decoder
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
end component;

component LUT_16_7 
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal data : STD_LOGIC_VECTOR (3 downto 0);
signal pc_address : STD_LOGIC_VECTOR (2 downto 0);
signal s_out : STD_LOGIC_VECTOR (2 downto 0);
signal Clk_Slow : std_logic;
signal address : STD_LOGIC_VECTOR (2 downto 0);
signal I1 : STD_LOGIC_VECTOR (11 downto 0);
signal Load_Select1 : std_logic;
signal Jump_Flag1 : std_logic := '0';
signal Jump_Address1 : STD_LOGIC_VECTOR (2 downto 0);
signal Add_Sub_Select1 : std_logic;
signal Mux_1out : STD_LOGIC_VECTOR (3 downto 0);
signal Mux_2out : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_En1 : STD_LOGIC_VECTOR (2 downto 0);
signal Data_Immediate1 : STD_LOGIC_VECTOR (3 downto 0);
signal Mux1_Control1 : STD_LOGIC_VECTOR (2 downto 0);
signal Mux2_Control1 : STD_LOGIC_VECTOR (2 downto 0);
signal Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7: STD_LOGIC_VECTOR (3 downto 0);
signal sum : STD_LOGIC_VECTOR (3 downto 0);


begin

AddSubUnit: addsub
port map(

C_in=>Add_Sub_Select1,
A =>Mux_2out,
B =>Mux_1out,
Sum =>sum,
Negative=>Negative_out,
overflow=>Overflow,
zero=>Zero
);


RegisterBank0 : RegisterBank
port map(
RegEnable=>Reg_En1,
Data =>data,
Clk =>Clk_Slow,
Clr =>Res,
R0 => Reg0,
R1 =>Reg1,
R2=>Reg2,
R3=>Reg3,
R4=>Reg4,
R5=>Reg5,
R6=>Reg6,
R7=>Reg7
);


Mux0:Mux_8_way_4_bit_with_3_to_8_decoder
port map(
EN=>'1',
C=> Mux1_Control1,
Bus_1=>Reg0,
Bus_2=>Reg1,
Bus_3=>Reg2,
Bus_4=>Reg3,
Bus_5=>Reg4,
Bus_6=>Reg5,
Bus_7=>Reg6,
Bus_8=>Reg7,
Out_Bus=>Mux_1out

);

Mux1:Mux_8_way_4_bit_with_3_to_8_decoder
port map(
EN=>'1',
C=> Mux2_Control1,
Bus_1=>Reg0,
Bus_2=>Reg1,
Bus_3=>Reg2,
Bus_4=>Reg3,
Bus_5=>Reg4,
Bus_6=>Reg5,
Bus_7=>Reg6,
Bus_8=>Reg7,
Out_Bus=>Mux_2out

);

Twoway3bitMul:Mux_2_way_3_bit
port map(
EN=>'1',
C=> Jump_Flag1,
Bus_1=>s_out,
Bus_2=> Jump_Address1,
Out_Bus=>pc_address


);

Twoway4bitMul:Mux_2_way_4_bit
port map(
EN=>'1',
C=> Load_Select1,
Bus_1=>sum,
Bus_2=> Data_Immediate1,
Out_Bus=>data


);
SlowClock1 : Slow_Clk
port map(
Clk_in=>Clk,
Clk_out=>Clk_Slow
);

LUT_16_7_0 :LUT_16_7
port map(
address=>Reg7,
data=>sev_seg_output);


ThreeBitAdder : BIT_3_ADDER
port map(
A=>address,
C_IN => '0',
S => s_out
--C_OUT =>

);

ProgramCounter0 : ProgramCounter
port map(
Clk=>Clk_Slow,
En=>'1',
Res=>Res,
add_in=>pc_address,
add_out=>address 
);

ProgramROM0 : ProgramROM
port map(
address=>address,
data=>I1
);

Instruction_Decoder0 : Instruction_Decoder
port map(
I=>I1,
Load_Select=>Load_Select1,
Jump_Flag=>Jump_Flag1,
Jump_Address=>Jump_Address1,
Add_Sub_Select=>Add_Sub_Select1,
Mux_In=>Mux_2out, --Mux_In=>Mux_1out,
Reg_En=>Reg_En1,
Data_Immediate=>Data_Immediate1,
Mux1_Control=>Mux1_Control1,
Mux2_Control=>Mux2_Control1
);

Anode<="1110";
R7_out<=Reg7;
end Behavioral;
