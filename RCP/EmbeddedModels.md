# Embedded Simulink models

Finally an example to embed  the control law is proposed 

![Embedded simulink model](..\img\RCP\EmbeddedSimulinkModel.PNG)

The control proposed on this model is detailed in the page [PMSM vector control](../MotorModeling/PMSMControl.md). The implemented control is exactly the same as the simulation model. 

- To build the code and flash it on the microcontroller, press **ctrl+b**.
- To select the mode, press button **S2** and **S3** simultaneously on the MCLV2 board.  
- To increase the reference, press **S3** button only and **S2** to decease the reference. 
- The solution proposes a Graphical User interface. Details on the use of this interface can be found [here](../GUI/GUI.md)
  - To open the GUI click on the block **Interface TxMatlab >> picgui** in the simulink model. 
  - A GUI should open and looks with the configuration looks like this : 



![GUI](..\img\RCP\PicGui.PNG)

- The DataVisu mfile is available in the zip. It allows to plot data in realtime. For this example, for speed control it should be obtained :

![Experimental results](..\img\RCP\Expe.PNG)

The simulink model and the datavisu.m file can be download [here](../Simulink/SAME5xPIM_MCLV2_MotorControl.zip)

