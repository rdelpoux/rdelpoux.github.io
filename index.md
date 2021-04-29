# Embedded Motor Control

## Embedded Motor Control solution based on the Rapid Control Prototyping (RCP) tool MPLAB Device Blocks for Simulink

### Authors

- Romain DELPOUX (Romain.Delpoux at insa-lyon.fr), Assistant Professor, INSA de Lyon, Laboratoire Ampère UMR CNRS 5005.
- Lubin KERHUEL (Lubin.Kerhuel at microchip.com), Software Engineer, Microchip Technology Inc.

### Introduction

This website provides keys for motor Rapid Control Prototyping of PMSM (Permanent Magnet Synchronous Motor). Originally intended to 5th year students in the [electrical engineering department](http://ge.insa-lyon.fr/) of [INSA Lyon](http://www.insa-lyon.fr/) for the [CCSA](http://ge-option5a.insa-lyon.fr/content/ccsa-commande-de-convertisseurs-et-de-systemes-dactionnement) option, the objective of these pages is to propose an initiation to the programming environment toolbox [MPLAB Device Blocks for Simulink](https://www.mathworks.com/matlabcentral/fileexchange/71892). It allows targeting Microchip Microcontrollers directly from the Matlab-Simulink environment. 

Developing embedded code for microcontrollers requires skills that are out of scope of the curriculum of control system engineers which is typically limited to high level tools like Matlab/Simulink and Rapid Control Prototyping tools like dSPACE or Speedgoat. This task is often left to embedded system engineers who are specialists of hardware architecture but have little knowledge in control theory. It is clear that there is a lack of engineers able to deal with the full process from control design to hardware implementation. 

This observation is also confirmed by the increasing desire of students in control system courses to learn how to implement algorithms directly on dedicated hardware. Based on this assessment, it has been decided to propose a simple and fast methodology for RCP based on the interface of a microcontroller directly with Matlab/Simulink by taking advantage of the graphical interface provided by the Microchip Technology MPLAB device blocks for Simulink. 

The objective is not to hide and make totally transparent the code generation but on the contrary to make it accessible in order to tackle the problems that arise from this implementation. In addition to the teaching benefit, the second objective is to fill the gap between convenient but expensive RCP platforms and complex but cheaper microcontroller tools. The developed methodology will speed up the implementation of advanced control algorithms on real hardware by removing the phase of coding on the target :

<img src="https://rdelpoux.github.io/img/RCP/design_process.png" width="500">



This work is realized in collaboration between [ctrl+elec](http://www.ctrl-elec.fr/en/ctrl-elec/) and Microchip engineers developing [MPLAB Device Blocks for Simulink](https://github.com/LubinKerhuel/MPLAB-Device-Blocks-for-Simulink.git).

### ctrl + elec

<img src="https://rdelpoux.github.io/img/logo.png" width="300">


The platform [ctrl+elec](http://www.ctrl-elec.fr/en/ctrl-elec/) is positioned between the disciplines of power  electronics on the one hand, and control theory on the other hand: The  objective is to take advantage of a fine knowledge of power electronics  systems and of an expertise on some control theory tools, identified as  relevant for these applications. This platform is related to the  research work of the group [Automatique pour l’Electronique de puissance](http://www.ampere-lab.fr/spip.php?article921) of [Ampere UMR CNRS 5005](http://www.ampere-lab.fr/)



### MPLAB Device Blocks for Simulink

 [MPLAB Device Blocks for Simulink](https://www.mathworks.com/matlabcentral/fileexchange/71892) enables Embedded Coder for automated build and execution of real-time executable for any board equipped with a dsPIC :registered:, PIC32 :registered:, SAMx5 or SAMx7 from a Simulink model.

<img src="https://github.com/LubinKerhuel/MPLAB-Device-Blocks-for-Simulink/raw/master/mplab-deviceblocksforsimulink-whitebackground.png" width="150">

For more informations refer to [MPLAB Device Blocks for Simulink](https://www.mathworks.com/matlabcentral/fileexchange/71892)

## Content

- ### [PMSM Modelling and control](/MotorModeling/PMSM.md)

- ### [Mplab for Simulink](/MplabForSimulink/MplabForSimulink.md)

- ### [Getting started](/GettingStarted/GettingStarted.md)

- ### [Block configuration for Motor Control](/BlockconfigurationforMotorControl/BlockconfigurationforMotorControl.md) 

- ### [GUI (Graphical User Interface)](/GUI/GUI.md)

## License

The proposed algorithms on this website are free of charge to use and is openly distributed, but note that

1.  Copyright owned by Romain Delpoux.
2. The content of the website must be referenced when used in published work :
   1. Romain Delpoux, Lubin Kerhuel, Vincent Léchappé, Arnaud Duvernois. On Chip Rapid Control Prototyping for Education. *21st IFAC World Congress (IFAC 2020)*, Jul 2020, Berlin, Germany. [⟨hal-02928430⟩](https://hal.archives-ouvertes.fr/hal-02928430)
3. The algorithms, or forks of the algorithms may not be re-distributed as a part of a commercial product unless agreed upon with the copyright owner. 
4. This work is distributed in the hope that it will be useful, but without any warranty, without event the implied warranty of merchantability or fitness for a particular purpose.

