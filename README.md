# RTL-to-GDS-Implementaton-of-Low-Power-Configurable-Multi-Clock-Digital-System-

# Description of Project
It is resposable of receiving commands through UART receiver to do 
different system functions as register file reading/writing or 
doing some processing using ALU block and send result 
as well as CRC bits of result using 4 bytes frame through 
UART transmitter communication protocol.


# Documents
You will find a full description for the system in the system documentaion in the DOCs directory
Also DOCs directory contains a documentaion for the UART Tx and Rx blocks.

# ASIC Flow 
All files needed to implement this sytem design is provided in the Backend folder
foe ex.: 
1. you will fine all the library files and tcl scripts used for synthesis in the Backend/synthesis
2. you will fine all the library files and tcl scripts used for DFT insrtion in the Backend/DFT
3. you will fine all the library files and tcl scripts used for Formalityin the Backend/formality


# RTL Code
This system is designed using the VERILOG HDL and all the .v files can be found in the RTL floder.

# Test Bench
The system is tested using a verilog test bench which you will find in the TB directory

# Images
You will find the system block diagram and other diagrams related to the design in the Images directory 
         
