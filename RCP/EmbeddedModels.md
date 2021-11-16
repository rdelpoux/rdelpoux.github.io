# Embedded Simulink models

Finally an example to embed  the control law is proposed 

![Embedded simulink model](..\img\RCP\EmbeddedSimulinkModel.PNG)

The control proposed on this model is detailed in the page [PMSM vector control](../MotorModeling/PMSMControl.md). The implemented control is exactly the same as the simulation model. 

- To build the code and flash it on the microcontroller, press **ctrl+b**.
- To select the mode, press button **S2** on the MCLV2 board.  
  - Mode 0 : Off
  - Mode 1 : Open loop, apply **vq** voltage from potentiometer [0 12V]
  - Mode 2 : Current mode, apply **iq** reference current from potentiometer [0 4A]
  - Mode 3 : Speed mode, apply **om** reference voltage from potentiometer [0 350rad/s]

-  To change reference direction, press button **S3** on the MCLV2 board.  
- The solution proposes a Graphical User interface. Details on the use of this interface can be found [here](../GUI/GUI.md)
  - To open the GUI click on the block **Interface TxMatlab >> picgui** in the simulink model. 
  - A GUI should open and looks with the configuration looks like this : 



![GUI](..\img\RCP\PicGui.PNG)

- The DataVisu mfile is available in the zip. It allows to plot data in realtime. For this example, for speed control it should be obtained :

![Experimental results](..\img\RCP\Expe.PNG)

The simulink model and the datavisu.m file can be download [here](../Simulink/SAME5xPIM_MCLV2_MotorControl.zip)

## Site Map

- [PMSM Description](../MotorModeling/PMSM.html) / [PMSM Modeling](../MotorModeling/PMSMModeling.html) - [PMSM Control](../MotorModeling/PMSMControl.html)
- [Mplab Device Block For Simulink](../MplabForSimulink/MplabForSimulink.html)
- [Embedded Motor Control](../RCP/PMSMRCP.html) / [Getting Started](../RCP/GettingStarted.html) - [Block configuration for Motor Control](../RCP/BlockconfigurationforMotorControl.html) - [Simulation Simulink models](../RCP/Simulation.html) - [Embedded Simulink models](../RCP/EmbeddedModels.html)
- [GUI (Graphical User Interface)](../GUI/GUI.html)

