# SKF

MATLAB code and Simulink model to simulate the response of a dynamics mass-spring-damper system using a standard linear Kalman filter.


# Background:

Although building this SKF model began as a tedious assignment for my Advanced Spacecraft Attitude Dynamics and Control class at Cal Poly, SLO in Fall of 2022, it quickly became one of my favorite coding projects up to date. It simply and efficiently estimates the state of a mass-spring-damper (MSD) system in both continuous time and discrete time state-spaces. 

The output is a single figure with three subplots comparing the position of the MSD for the following cases:
  - The continuous system with no noise,
  - the continuous system with noise,
  - and the continuous system with noise and a discrete time Kalman Filter
  
This project was my introduction to state estimation algorithms, and it opened a can of worms that I am excited to delve deeper into.

<img width="1342" alt="Screenshot 2023-01-17 at 11 37 23 PM" src="https://user-images.githubusercontent.com/122119822/213111532-5f9e3364-8f6b-47d2-88bf-9681e1461ef1.png">
