# Getting Started

#### Hardware requirements:

- [MCLV-V2](https://www.microchip.com/dsPICDEMMCLV-2DevelopmentBoard866) Motor Control Board
- [PIM dsPIC33EP256MC506](https://www.microchip.com/DevelopmentTools/ProductDetails/ma330031) with internal Op-Amp
- Programmer ([PICkit 4](https://www.microchip.com/pickit4), [ICD4](https://www.microchip.com/icd4), [Real-Ice](https://www.microchip.com/realice), [PICkit 3](https://www.microchip.com/pickit3), [ICD3](https://www.microchip.com/icd3), ...)
- PMSM motor ([N23 Industrial Grade Motors](https://rdelpoux.github.io/Datasheets/N23_Industrial_Grade_Motors_v6.0.pdf))
- Cable to send data from the MCLV board (Tx) to the PC (Rx) (like a [FTDI cable](https://www.ftdichip.com/Products/Cables/USBTTLSerial.htm))

#### 

#### Software requirements:

- Matlab/Simulink
  - Embedded coder (Matlab Coder & Simulink Coder)
  - Fixed point toolbox
- [MPLAB device blocks for Simulink](https://www.microchip.com/SimulinkBlocks)
- [MPLAB X IDE](https://www.microchip.com/MPLABX) development (required to flash the binary from matlab)
- [XC16](https://www.microchip.com/XC16) compiler