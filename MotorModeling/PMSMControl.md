# PMSM Control

The page describes  a classical cascaded vector control. Based on the motor frequency separation (i.e. a fast electrical dynamics and a slower mechanical dynamics) the control is divided in two loop :

- An inner loop for the electrical dynamic
- An outer loop for the mechanical dynamic

## $d-q$ model

The model of the motor in the $dq$ frame is :

$$
\left\{\begin{array}{rcl}
L \frac{di_d}{dt} & = & v_d-R i_d + Lp\Omega i_q\\\\
L \frac{di_q}{dt} & = & v_q-R i_q - Lp\Omega i_d -\phi_f  p\Omega\\\\
J\frac{d\Omega}{dt} &=& \tau_m -\tau_r \\\\
{\frac{d\theta}{dt}} &=& \Omega\\
\end{array}\right.
$$

$$
\tau_m = p\frac{3}{2}\phi_f  i_q
$$



## Electrical Dynamics

![](../img/PMSM/ElecLoop.png)

Consider the electrical equations : 
$$
\left\{
\begin{array}{rcl}
L \frac{di_d}{dt} & = & v_d-R i_d + Lp\Omega i_q\\\\
L \frac{di_q}{dt} & = & v_q-R i_q - Lp\Omega i_d -\phi_f  p\Omega
\end{array}\right.
$$

### Feedback linearization 

The model $d-q$ is still non-linear. Based on this model, choosing $v_d$ and $v_q$ as :
$$
\left\{
\begin{array}{lcl}
v_d &=& u_d + Lp\Omega i_q\\
v_q &=& u_q + Lp\Omega i_d+\phi_f p\Omega\\
\end{array}
\right.
$$
 One has :
$$
\left\{
\begin{array}{rcl}
L \frac{di_d}{dt} & = & u_d-R i_d\\\\
L \frac{di_q}{dt} & = & u_q-R i_q
\end{array}\right.
$$
whether two decoupled electrical equations. Each current can thus be controlled independently. Therefore, linear control techniques can be used. 



## Mechanical Dynamic

![](../img/PMSM/MecaLoop.png)

## References

(Par29) Park, R.-H. (1929). Two-reaction theory of synchronous machines generalized method of analysis-part I. *Transactions of the American Institute of Electrical Engineers*, *48*(3), 716–727. https://doi.org/10.1109/T-AIEE.1929.5055275