# RTL-to-GDS-Implementaton-of-Low-Power-Configurable-Multi-Clock-Digital-System-

# Description of Project
It is resposable of receiving commands through UART receiver to do 
different system functions as register file reading/writing or 
doing some processing using ALU block and send result 
as well as CRC bits of result using 4 bytes frame through 
UART transmitter communication protocol.




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
You will find the system block diagram in the Images directory 
          
# Linkes          
You can find the full specs of the system in this link: https://drive.google.com/file/d/1C0s-sk4Zc53y8HdnepfABpg2tmQpKwzE/view?usp=sharing
