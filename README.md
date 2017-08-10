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

Currently, I am thinking of using the [EMAX ES08MA II Mini Metal Gear Analog servo](https://www.aliexpress.com/item/Free-shipping-100-orginal-4x-EMAX-ES08MA-II-Mini-Metal-Gear-Analog-Servo-12g-2-0kg/1708746840.html?spm=2114.search0104.3.60.zGgXDn&ws_ab_test=searchweb0_0,searchweb201602_5_10152_10065_10151_10068_10130_10307_10137_10060_10155_10154_5370011_10056_10055_10054_10059_100031_10099_5400020_5410011_10103_10102_5430011_10052_10053_10142_10107_10050_10051_5380020_5390020_10084_10083_10080_10082_10081_10178_10110_10111_10112_10113_10114_10312_10313_10314_10315_10316_10078_10079_10073_5420011-10050,searchweb201603_5,ppcSwitch_5&btsid=4bdcc2a4-2bf1-4f49-91d5-c31a77f9120e&algo_expid=06897d5a-ac7b-4e40-b174-da471e17ec38-7&algo_pvid=06897d5a-ac7b-4e40-b174-da471e17ec38&transAbTest=ae803_3).
