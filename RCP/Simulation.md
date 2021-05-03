# Simulation Simulink Models

Before testing the proposed control on embedded target a simulation of the control strategy apply on a model of the motor is required.

We propose the following simple simulation model :

![Simulation model](..\img\RCP\SimulationSimulinkModel.PNG)

In this simulation file, 3 possible command are proposed. 

- Control variable equal to 1, voltage control in the dq reference frame is applied. Applying a vq ref will spin the motor as a DC motor.
- Control variable equal to 2, current control in the dq reference frame is applied. Apply iq ref as an image of the motor torque.
- Control variable equal to 3, speed control in the dq reference frame is applied. In this mode, the simulation result should look like :

![Speed control simulation result](C:\Users\promu\Documents\rdelpoux\rdelpoux.github.io\img\RCP\SimulationResults.png)

To download the Simulink model click [here](../Simulink/SAME5xPIM_MCLV2_MotorControl_Simulation.zip).

