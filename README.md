# RTL-to-GDS-Implementaton-of-Low-Power-Configurable-Multi-Clock-Digital-System-


It is resposable of receiving commands through UART receiver to do 
different system functions as register file reading/writing or 
doing some processing using ALU block and send result 
as well as CRC bits of result using 4 bytes frame through 
UART transmitter communication protocol.

RTL --> contains all the verilog codes of the whole system blocks.


Description: 
1. This system contains 9 blocks:-
    
    1) Clock Domain 1 (REF_CLK)
          • RegFile
          • ALU
          • Clock Gating
          • SYS_CTRL
    
    2) Clock Domain 2 (UART_CLK)
          • UART_TX
          • UART_RX
          • Clock Divider
    
    3) Synchronizers
          • RST Synchronizer
          • Data Synchronizer
          
You can find the full specs of the system in this link: https://drive.google.com/file/d/1C0s-sk4Zc53y8HdnepfABpg2tmQpKwzE/view?usp=sharing
