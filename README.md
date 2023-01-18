# SKF

MATLAB code and Simulink model to simulate the response of a dynamics mass-spring-damper system using a standard linear Kalman filter.


# Background:

Although building this SKF model began as a tedious assignment for my Advanced Spacecraft Attitude Dynamics and Control class at Cal Poly, SLO in Fall of 2022, it quickly became one of my favorite coding projects up to date. It simply and efficiently estimates the state of a mass-spring-damper (MSD) system in both continuous time and discrete time state-spaces. 

The output is a single figure with three subplots comparing the position of the MSD for the following cases:
  - The continuous system with no noise,
  - the continuous system with noise,
  - and the continuous system with noise and a discrete time Kalman Filter
  
This project was my introduction to state estimation algorithms, and it opened a can of worms that I am excited to delve deeper into.
