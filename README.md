# Nano-Processor
The simple Nano-Processor was developed using VHDL and Xilinx Vivado as the semester project of Semester 2 CS1050 Computer Organization and Digital Design module

## Introduction
In this lab, we designed a very simple 4-bit processor capable of executing 4 types of instructions.

![image](https://user-images.githubusercontent.com/101160077/208155958-979a344e-7e14-4c18-83dc-acadad856965.png)

According to the above diagram the processor consists with multiple subunits which we designed separately using VHDL and simulated each to verify their functionality.
- 4-bit Add/Subtract unit - capable of adding and subtracting input numbers (in 2’ complement)
- 3-bit adder - to increment the program counter by one
- 3-bit program counter - need to reset to 0 when required
- k-way b-bit multiplexers - used to enable registers and other actions
- Register bank - contains 8, 4-bit registers
- Program ROM - stores the assembly program
-Instruction decoder – activates the necessary components based on the instructions user wish to execute
Busses were used to connect components which are 3,4 and 12-bit as required. Rather than running multiple wires, Buses make the design simpler.
Finally, we included all the components we designed separately including the clock in the nano processor VHDL and simulated to obtain the find circuit.

1. 4-bit Add/Subtract Unit
4 bit adder subtractor unit is used to perform addition and subtraction in Nano processor. we developed the previously designed ripple carry adder (RCA) into a subtractor unit by adding an extra control signal (Enable). Extra negative and zero flag were used to represent the sign and to check the zero value respectively.
XOR gate was used to modify the input signals for subtractor unit (to get the complement of the input) when the enable signal is set to one.

2. 3-bit adder
3 bit adder is used to increment the output from the program counter by one. Here we modify the RCA by removing one full adder and design it to 3 bit.

3. Program counter
Program counter used here is a 3-bit counter designed using D flip flops and is used to select relevant instructions from the program ROM. The reset input is used to reset the program counter when required.

4. k-way b-bit multiplexer
A k way b bit multiplexer takes k inputs each with b bits and gives an output of b bits. There are log2 k control bits, and these control bits are used to select one of the k groups of b bits.
Here we implement the components using 8 to 1 multiplexer.

5. Register bank
Here we designed a register bank that contains 8, 4-bit registers (R0 to R7) , which is R0 is hardcoded to ‘0000’. We used 3 to 8 decoder to enable a single register at a time with D flip flops.

6. Program ROM
Program ROM is used to store our Assembly program so it was designed using a ROM based Look Up Table (LUT) .Here we hardcode our 12-bit instruction set into the ROM .
Assembly Program and its Machine Code Representation 
"100010000011",--MOV R1, 3 
"100100000010",--MOV R2, 2 
"100110000001", --MOV R3,1 
"000110010000", -- ADD R3, R1 
"000110100000",--ADD R3,R2 
"101110110111", --MOV R7, R3 
"110000010111", --JZR R1, 7 
"110000000111" --JZR R0, 7

7. Instruction decoder
We need to design and build the Instruction Decoder in order to activate the necessary components based on the instructions we need to execute. Here we need to execute 4 types of instructions (ADD , NEG ,JZR , MOVI).

8. Report

1.Slice Logic --------------
60
+-------------------------+------+-------+-----------+-------+ 
| Site Type | Used | Fixed | Available | Util% | 
+-------------------------+------+-------+-----------+-------+ 
| Slice LUTs* | 39 | 0 | 20800 | 0.19 | 
| LUT as Logic | 39 | 0 | 20800 | 0.19 | 
| LUT as Memory | 0 | 0 | 9600 | 0.00 | 
| Slice Registers | 53 | 0 | 41600 | 0.13 | 
| Register as Flip Flop | 53 | 0 | 41600 | 0.13 | 
| Register as Latch | 0 | 0 | 41600 | 0.00 | 
| F7 Muxes | 0 | 0 | 16300 | 0.00 | 
| F8 Muxes | 0 | 0 | 8150 | 0.00 
| +--- ----------------------+------+-------+-----------+-------+
2. Primitives -------------
+----------+------+---------------------+ 
| Ref Name | Used | Functional Category 
| +----------+------+---------------------+ 
| FDRE | 53 | Flop & Latch | 
| LUT4 | 20 | LUT | 
| OBUF | 18 | IO | 
| LUT6 | 12 | LUT | 
| LUT5 | 11 | LUT | 
| LUT3 | 11 | LUT | 
| CARRY4 | 8 | CarryLogic | 
| IBUF | 2 | IO | 
| BUFG | 1 | Clock | 
+----------+------+---------------------+
