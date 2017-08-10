# P-Bot
Repo for FPGA-based robot project. What can parallelism do for mobile robots?

## Table of Contents
1. [Introduction](#introduction)
2. [Hexapod mechanical design](#hexapod-(mechanical)-design)

## 1. Introduction

In this project, I'm building a robot and using an FPGA for some of the processing. My reasons are threefold:
1. Learn how to use FPGAs, especially in robotics
2. Learn what aspects of robotics FPGAs excel at, and learn how to incorporate an FPGA into an actual robot.
3. Learn more about embedded programming for robotics.

## 2. Hexapod mechanical design
Based on the static analysis [here](http://www.robotshop.com/blog/en/robot-leg-torque-tutorial-3587), I wrote a simple [MATLAB/Octave program](/Hardware/torque_calc.m) to calculate the torque required per servo for quasi-static motion, given the masses and lengths of the robot's legs and torso.
