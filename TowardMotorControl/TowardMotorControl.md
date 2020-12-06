# Toward Motor Control

## System Configuration

The Mplab Solution do not support continuous time. Indeed micro-controllers are themselves discrete. 

- The fisrt step is to define the simulink motel settings as follow : 

<img src="https://rdelpoux.github.io/img/TowardMotorControl/ConfigParam.PNG" width="800">

The Mplab Solution for Simulink adds to the Simulink Library Browser a library including all the available blocks for the micro-controller. 

<img src="https://rdelpoux.github.io/img/TowardMotorControl/LibraryBrowser.PNG" width="800">

- Systems configuration : 

Add the following blocks :

 <img src="https://rdelpoux.github.io/img/TowardMotorControl/SystemConfig.PNG" width="800">



And configure the Microchip master. It allows the choice of the micro-controller,  and the oscillator. For this project, the block must be configured as follow : 

<img src="https://rdelpoux.github.io/img/TowardMotorControl/MicrochipMasterGeneral.PNG" width="350"><img src="https://rdelpoux.github.io/img/TowardMotorControl/MicrochipMasterOscillator.PNG" width="350">

The first step to verify the configuration is to blink a LED for example with a frequency of 10Hz.

<img src="https://rdelpoux.github.io/img/TowardMotorControl/DBG_LED.PNG" width="800">

## Motor interface

 For motor vector control, three blocks needs to be inserted and configured :

<img src="https://rdelpoux.github.io/img/TowardMotorControl/MotorConfig.PNG" width="800">

- Pulse Width Modilation (PWM)
- Quadrature Encodre (PDEC)
- Analog Digital Converters (ADC)

### Pulse Width Modulation (PWM)

<img src="https://rdelpoux.github.io/img/TowardMotorControl/PWM_Main.PNG" width="350"><img src="https://rdelpoux.github.io/img/TowardMotorControl/PWM_Initial_Values.PNG" width="350"><img src="https://rdelpoux.github.io/img/TowardMotorControl/PWM_Inputs.PNG" width="350">



### Encoder 

<img src="https://rdelpoux.github.io/img/TowardMotorControl/PDECmain.PNG" width="350"><img src="https://rdelpoux.github.io/img/TowardMotorControl/PDECoptions.PNG" width="350">

### ADC

**Currents measurements:**

All Shunt resistances are **0.025 Ohms**.

<img src="https://rdelpoux.github.io/img/TowardMotorControl/Shunt.PNG" height="300"><img src="https://rdelpoux.github.io/img/TowardMotorControl/GainADC.PNG" height="180">



Two shunts measures Ia and Ib on PWM1 and PWM2 (low side). The third shunt measure Ibus which is the current sum of the three PWM (low side) currents.

Op-Amps (Internal or External) with a **gain of 15** boost low voltage measured to higher voltage converted by the dsPIC ADC for signals Ia, Ib and Ibus. 

<img src="https://rdelpoux.github.io/img/TowardMotorControl/DifferentialGain.PNG" width="300">

Vadc=0.025∗15∗Ishunt

For the ADC configured for 12 bits right aligned conversion, the raw output represents:

ADCout=0.025∗15∗4096/3.3∗Ishunt=465.45∗Ishunt

The maximum measurable current is +-4.4 A which provides values within [0 4096] range.

The ADC bloc is the following : 

And must be configure as follow : 

<img src="https://rdelpoux.github.io/img/TowardMotorControl/ADCMain.PNG" width="250"><img src="https://rdelpoux.github.io/img/TowardMotorControl/ADCSeq0.PNG" width="250"><img src="https://rdelpoux.github.io/img/TowardMotorControl/ADCSeq1.PNG" width="250">





