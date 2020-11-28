# Mplab Solution for Simulink

This page details the important steps for the real-time implementation of a multi-rate control law. MPLAB Device Blocks for Simulink enables Embedded Coder for automated  build and execution of real-time executable for any board equipped with a dsPIC :registered:, PIC32 :registered: or SAMx7 from a Simulink model. Any model can thus be embedded. To compile the generated code and program the board from the Simulink interface with a single `Build' push button on top right of the Simulink interface :

<img src="https://rdelpoux.github.io/img/RCP/RapidPrototypingScheme.png" width="500">



Embedded codes need however respect some constraints.  

## Discrete time 

Simulations are typically performed in the continuous time domain using Matlab/Simulink :registered:. A differential equation solver is used to solve simulation outputs. The real-time embedded software does not implement such solver so a discrete-time equivalent controller must be used.

## Multi-rate model

Multi-rate model comprises blocks running at various rates. For each block, it is possible to set its rate and its offset. Blocks rate offset are multiple of the base model time step defined in the solver panel. A multi-rate model can be implemented using a multi-tasking scheduler (default settings) or a single tasking program.

### Single tasking program

In a **Single tasking program**, all tasks started at a given base model time step must be completed within the end of that time step slot to respect real-time constraints.

### Multi tasking scheduler

In a **Multi tasking scheduler**, a monotonic-rate scheduler is implemented where higher rate tasks have higher priority and interrupt lower task rate which have lower priority whenever required. This multi-tasking scheduler has a simple priority rule which is well suited for automatic. Its limited implementation penalty in execution time worth the gain in flexibility.

<img src="https://rdelpoux.github.io/img/RCP/Model_Hardware_Test_withSampleTime.png" width="500">

<img src="https://rdelpoux.github.io/img/Scheduler_MultiTasking_Scope.png" width="500">







Figure \ref{fig:Scheduler_Scope} presents a timing analysis of the cascaded PI algorithms. One pins driven by the `CPU load' block and two pins driven by the `task state' block shows respectively the CPU state (black curve where 1 is busy and 0 is idle state), the fast task D1 (red) and slow task D2 (green) respective start and stop on rising and falling edges. The lower graph is a magnification of the higher priority task D1 preemption of the lower priority task D2. Note that, the slow D2 task pin state is not cleared when being preempted but exclusively when task is completed. The shaded region in the tasks D1 and D2 shows the CPU execution on each task. Here the control algorithm is modified to show an example of preemption: The mechanical control loop is implemented using floating point instead of fixed point so as to increasing the related task `D2' execution time to $55 \mu$s which is above the $50 \mu$s period of the $20\kilo\hertz$ D1 task. This slow down of the D1 task allows illustrating the benefit of a Multi-tasking scheduler as presented on Figure \ref{fig:Scheduler_Scope}.



\paragraph{\textbf{Fixed point}} Another constraint is the limited power from low cost microcontrollers in comparison to dSPACE of Speed-Goat. Discrete step of $25\mu$s or ($40\kilo\hertz$ control loop frequency) can be reached but floating-point calculation should be avoided in high rate task. Floating-point calculation can be used in lower rate tasks as illustrated by the D2 task in Figure\ref{fig:Scheduler_Scope}. 



Matlab/Simulink provides a Fixed-point toolbox to help with the conversion of the floating-point model into a fixed-point equivalent. One method consists in logging values taken by each variable during a simulation using double datatype. Then for each variable, it is possible from the distribution histogram to choose the variable data length, which typically would be either 16 or 32 bits, and to select its scaling. 



\textbf{Scaling:} Simulink is not limited to floating point value, integers and the classical fixed point (noted Qx.xx) value within $[-1\ 1]$ or $[0\ 1]$ range.

The Simulink fixed-point datatype is very flexible as the \ac{LSB} can represent any quantity. For example if we use the common 16 bits signed fixed-point (Q1.16), the \ac{LSB} would represent the quantity $2^{-15}$. Simulink sine and cosine blocks output provide a 16 bit output value with a LSB representing $2^{-14}$, allowing to represent value in the range $[2-2^{-14} \ -2]$, including thus the value $1$.



\textbf{Notation:} Math blocks can handle inputs having different datatype. Block output datatype could be either determined from the blocks input datatype, or forced to a given datatype. A Simulink option shows on the model the datatype for each block connection. Simulink notation example with their meaning is given below:

\begin{itemize}

\item{sfix16\_En14} is a signed 16 bit variable with a negative power of 2 exponent: \ac{LSB} represents $2^{-14}$.

\item{ufix16\_E2} is an unsigned 16 bit variable with a power of 2 exponent: \ac{LSB} represents $2^2$.

\item{sfix16\_Sp05} is a signed 16 bit variable where the \ac{LSB} represents 0.05.

\end{itemize}

Blocks, where internal or output datatype can be set, provide a user interface with options like `inherited from internal rules' or `inherited from back propagation'. The datatype can also be forced using either the `Binary point', the `Slope and bias' or the `Best precision' option. The `Binary point' and `Slope and Bias' options set the variable \ac{LSB} representation value. The `Best precision' option compute the lowest \ac{LSB} power of $2$ scaling so as to be able to represent the `min' and `max' values set in the block GUI. This will provide the best resolution for this variable. 



\begin{figure}[t]

​    \centering

​    \includegraphics[width=\columnwidth]{../Figures/Scheduler_MultiTasking_Scope.pdf}

​    \caption{Scope measurement of task execution for a Multi-rate model with a multi-tasking rate monotonic scheduler} \label{fig:Scheduler_Scope}

\end{figure}



\subsection{Timing analysis and efficiency}



Some blocks are available for timing analysis.

\paragraph{\ac{MCU} overload} The block detects overload. A physical pin can be used to detect an overload through a LED or a scope. A block output can provide overload information to the embedded program. 

The pin output works asynchronously: the pin is set as soon as an overload occurs and is never reset by the \ac{DSCs} load block. It is however possible to reset the pin using a `digital output write' block which can be set again by the \ac{MCU} overload block.

The block output works synchronously. For each \ac{MCU} overload block present on the model, any overload occurrence between successive evaluation of the block are reported in a 16 bit-field integer where the bit 0 code for an overload of the task D0 (fastest rate), bit 1 for the task D1 until D14. The bit D15 represents overload on task D15 and higher if the model use more than 16 different tasks.



\paragraph{\ac{MCU} Load}The block measures the overall load of the \ac{DSCs}. It can output the load by toggling a pin. The high state shows the load. The block can also measure the \ac{DSCs} load using internal timers providing the value to the embedded program as a block output. A timer is incremented when the \ac{DSCs} is either running a task, or running a peripheral interrupt (\textit{i.e} not idle). The block report the timer increment between two evaluations of this block. The timer resolution should be selected to be able to measure a period corresponding to the block sample time. The measured time should be equal or lower than the block sample time. It's worth noticing that a $100\%$ load on one time step (for example in Figure \ref{fig:Scheduler_Scope} from time $0$ to $50\mu $s) does not mean that an overload takes place. 

Multiple \ac{MCU} load blocks can be placed within one model with different sample times, allowing to average the load over different time period corresponding to the respective block sample time.



\paragraph{Task State} The block allows to represent task execution state through output pin. Each pin representing one selected task. Each task switches its pin high when it starts, and switches back its dedicated pin low when completed. Figure \ref{fig:Scheduler_Scope} shows such analysis for the inner and outer control loop tasks of the cascaded PI controller detailed in the above section. 



Figure \ref{fig:Scheduler_Scope} presenting \ac{DSCs} load measurement in a multi-tasking scheduler use theses blocks.

\\

\paragraph{Code efficiency} The code performance are surprisignly good. Peripheral are handled as in background through interrupts. Peripheral blocks for input peripherals are thus not blocking as they just have to read the last result obtained from that peripheral;  keeping the CPU time dedicated to the control algorithm. For example, the base time step is typically triggered by the ADC block end of conversion interrupt thus when the ADC block is evaluated within the algorithm, the conversion results are already available. The ADC block do not have to wait for a sample and hold sequence nor by the following conversion sequence. The same remark holds for others peripheral blocks like the UART transmission/reception, the SPI or I2C blocks\ldots

\\

\paragraph{Code replacement} This MathWorks functionality allows replacing code of standard Simulink blocks by an optimized code for the target so as to benefit from the optimized target hardware architecture like its DSP unit or specific instruction set. Code replacement is implemented for common operations like rounding, saturation and few operations on matrix. It is also implemented for functions like square root, sine and cosine functions when used with fixed point datatype input. 







The Simulink interface with the motor using the MPLAB device blocks is represented on Figure \ref{fig:dcmotorinterface}. The control voltage is applied to a \ac{PWM} signal driving a H-bridge converter. The inputs of the control algorithm are the current and velocity measurements. The velocity is obtained from an incremental encoder through the use of a \ac{QEI} peripheral. The current is measured using shunt resistor, conditioned with the dsPIC \ac{DSCs} internal op-amps and converted with the ADC peripheral. The \ac{ADC} conversion is synchronized with the \ac{PWM} period. It ensures that the \ac{ADC} sampling time is taken when the low side of the H-bridge is on. Speed and current control loops are sampled at different rates. An option in Simulink highlights with color the different rates in a model as presented on Figure \ref{fig:dcmotorinterface}. The red color represents the fastest sampling rate. Here the sampling frequency for the control of the fast current  dynamics is $F_{\rm elec} = 20~\kilo\hertz$. The green color represents the sampling rate for the mechanical dynamics, here $F_{\rm meca} = 1~\kilo\hertz$. %Magenta is used for infinite sampling time (for example constant), computed only once when program starts.