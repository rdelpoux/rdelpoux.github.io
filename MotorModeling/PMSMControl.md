# PMSM Control

The page describes  a classical cascaded vector control. Based on the motor frequency separation (i.e. a fast electrical dynamics and a slower mechanical dynamics) the control is divided in two loop :

- An inner loop for the electrical dynamic
- An outer loop for the mechanical dynamic

## $d-q$ model

The model of the motor in the $dq$ frame is :

\begin{equation}

\label{eq:modeledq}

\left\{\begin{array}{rcl}

L \frac{di_d}{dt} & = & v_d-R i_d + Lp\Omega i_q\\\\

L \frac{di_q}{dt} & = & v_q-R i_q - Lp\Omega i_d -\phi_f  p\Omega\\\\

J\frac{d\Omega}{dt} &=& \tau_m -\tau_r \\\\

{\frac{d\theta}{dt}} &=& \Omega\\

\end{array}\right.

\end{equation}

\begin{equation}

\tau_m = p\frac{3}{2}\phi_f  i_q

\end{equation}



## Electrical Dynamics

![](../img/PMSM/ElecLoop.png)

## Mechanical Dynamics

![](../img/PMSM/MecaLoop.png)