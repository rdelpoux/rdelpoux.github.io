# HMI (Human Machine Interface)

 [MPLAB Device Blocks for Simulink](https://www.mathworks.com/matlabcentral/fileexchange/71892) provide a simple but powerful user interface. It allows to send and receive data from the chip using a Serial link.

<img src="https://rdelpoux.github.io/img/picGUI/DataVisu.png" width="1000">



## Connection to the PC

Although the MCLV2 board has ports to connect a serial link (USB, RS232), in this example we are using an special [FTDI cable](https://www.ftdichip.com/Support/Documents/DataSheets/Cables/DS_C232HD_UART_CABLE.pdf). The USB 2.0 Hi-Speed to UART cable incorporates FTDI’s FT232H USB to UART interface IC device which handles all the USB signalling and protocols.  The cable provides a fast, simple way to connect devices with 3.3 volt digital interfaces to USB. 
[FTDI cable Driver](https://www.ftdichip.com/Drivers/VCP.htm)

<img src="https://rdelpoux.github.io/img/picGUI/C232HDconnection.png" width="500">

- The TX pin (orange pin 2) must be connected RX pin of the MCLV2 board.
- The RX pin (yellow pin 3) must be connected TX pin of the MCLV2 board.
- Do not forget to connect the GND (black pin 10) to the MCLV2 board.

The pin connection is represented below.

<img src="https://rdelpoux.github.io/img/MCLV/Serial.jpg" width="500">

## picGUI

The use of **picgui** is illustrated through a simple exemple. A repeating sequence stair sapled at 1s is apply to a simple fisrt order system where K= 1 and tau = 0.1. The input and the output of the system are linked to the with **Tx - Matlab block** to plot using **picgui**. The model used is represented blow and can be download [here](https://github.com/rdelpoux/rdelpoux.github.io/blob/master/Dev/ExPicGUI/SAME5x_EXpicGUI_base.slx): 

<img src="https://rdelpoux.github.io/img/picGUI/ModelSerial_base.PNG" title="pigui demo: base">

The model is sampled at 0.1ms while the UART is sampled at 0.5ms. For this sampling rate, a high baudrate is required. Using a BaudRate = 921600, the serial link is able to send 9.22 bytes/step. After build, the **Tx - Matlab block** highlight the *Bytes / Step*. Note that using configuration,  sending 2 variables takes 2 bytes / step. The UART configuration is the following : 

<img src="https://rdelpoux.github.io/img/picGUI/Serial_matlab.PNG" width="400">

Double click on the **picgui Graphical interface** open the following interface : 

<img src="https://rdelpoux.github.io/img/picGUI/picgui.PNG" width="400">

Select the right **Com** port and **baudrate** then press **Connexion**. A click on **Start button** plot the figure(50), based on code written in the central window.

<img src="https://rdelpoux.github.io/img/picGUI/StepResponse.PNG" width="400">





















