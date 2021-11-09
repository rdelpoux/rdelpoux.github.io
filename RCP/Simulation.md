# Simulation Simulink Models

Before testing the proposed control on embedded target a simulation of the control strategy apply on a model of the motor is required.

We propose the following simple simulation model :

![Simulation model](..\img\RCP\SimulationSimulinkModel.PNG)

In this simulation file, 3 possible command are proposed. 

- Control variable equal to 1, voltage control in the dq reference frame is applied. Applying a vq ref will spin the motor as a DC motor.
- Control variable equal to 2, current control in the dq reference frame is applied. Apply iq ref as an image of the motor torque.
- Control variable equal to 3, speed control in the dq reference frame is applied. In this mode, the simulation result should looks like :

![Speed control simulation result](..\img\RCP\SimulationResults.png)

To download the Simulink model click [here](../Simulink/SAME5xPIM_MCLV2_MotorControl_Simulation.zip).

## Site Map

- [PMSM Description](../MotorModeling/PMSM.html) / [PMSM Modeling](../MotorModeling/PMSMModeling.html) - [PMSM Control](../MotorModeling/PMSMControl.html)
- [Mplab Device Block For Simulink](../MplabForSimulink/MplabForSimulink.html)
- [Embedded Motor Control](../RCP/PMSMRCP.html) / [Getting Started](../RCP/GettingStarted.html) - [Block configuration for Motor Control](../RCP/BlockconfigurationforMotorControl.html) - [Simulation Simulink models](../RCP/Simulation.html) - [Embedded Simulink models](../RCP/EmbeddedModels.html)
- [GUI (Graphical User Interface)](../GUI/GUI.html)

