# HMI (Human Machine Interface)

 [MPLAB Device Blocks for Simulink](https://www.mathworks.com/matlabcentral/fileexchange/71892) provide a simple but powerful user interface. It allows to send and receive data from the chip using a Serial link.

<img src="https://rdelpoux.github.io/img/picGUI/DataVisu.png" width="1000">



## Connection to the PC

Although the MCLV2 board has ports to connect a serial link (USB, RS232), in this example we are using an special [FTDI cable](https://www.ftdichip.com/Support/Documents/DataSheets/Cables/DS_C232HD_UART_CABLE.pdf). The USB 2.0 Hi-Speed to UART cable incorporates FTDI’s FT232H USB to UART interface IC device which handles all the USB signalling and protocols.  The cable provides a fast, simple way to connect devices with 3.3 volt digital interfaces to USB. 

<img src="https://rdelpoux.github.io/img/picGUI/C232HDconnection.png" width="500">

- The TX pin (orange pin 2) must be connected RX pin of the MCLV2 board.
- The RX pin (yellow pin 3) must be connected TX pin of the MCLV2 board.
- Do not forget to connect the GND (black pin 10) to the MCLV2 board.

The pin connection is represented below.

<img src="https://rdelpoux.github.io/img/MCLV/Serial.png" width="1000">










