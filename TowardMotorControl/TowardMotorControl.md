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

<img src="https://rdelpoux.github.io/img/TowardMotorControl/MicrochipMasterGeneral.PNG" width="300"><img src="https://rdelpoux.github.io/img/TowardMotorControl/MicrochipMasterOscillator.PNG" width="300">

The first step to verify the configuration is to blink a LED for example with a frequency of 10Hz.

<img src="https://rdelpoux.github.io/img/TowardMotorControl/DBG_LED.PNG" width="800">

## Pulse Width Modulation (PWM)

## Encoder 

## ADC

**Currents measurements:**

All Shunt resistances are **0.025 Ohms**.

Two shunts measures Ia and Ib on PWM1 and PWM2 (low side). The third shunt measure Ibus which is the current sum of the three PWM (low side) currents.

Op-Amps (Internal or External) with a **gain of 15** boost low voltage measured to higher voltage converted by the dsPIC ADC for signals Ia, Ib and Ibus. (see [fig4 from DS52062B](https://github.com/rdelpoux/INSA_TP_CommandeTempsReel_MCC/tree/f4be492167956b5449ef4fb184332b885cf5780f/Figures/GettingStarted/Internal_OpAmp_DS52062B_Fig4.png))

VADC=0.025∗15∗Ishunt V_{ADC} = 0.025*15*I_{shunt} V_{ADC}=0.025∗15∗Ishunt

For the ADC configured for 10 bits right aligned conversion, the raw output represents:

ADCout=0.025∗15∗10243.3∗Ishunt=116.36∗IshuntADC_{out} = 0.025*15 * \frac{1024}{3.3}* I_{shunt} = 116.36 * I_{shunt}ADCout=0.025∗15∗3.31024∗Ishunt=116.36∗Ishunt

The maximum measurable current is +-4.4 A which provides values within [-512 512] range.