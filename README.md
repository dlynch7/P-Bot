# P-Bot
Repo for FPGA-based robot project. What can parallelism do for mobile robots?

## Table of Contents
1. [Introduction](#1-introduction)
2. [Hexapod mechanical design](#2-hexapod-mechanical-design)
    1. [Leg design](#leg-design)
        1. [Open-chain leg](#open-chain-leg)
        2. [Klann linkage](#klann-linkage)
3. [Electronics](#3-electronics)

## 1. Introduction

In this project, I'm building a robot and using an FPGA for some of the processing. My reasons are threefold:
1. Learn how to use FPGAs, especially in robotics
2. Learn what aspects of robotics FPGAs excel at, and learn how to incorporate an FPGA into an actual robot.
3. Learn more about embedded programming for robotics. I want to write more elegant and sophisticated embedded code.

## 2. Hexapod mechanical design

### Leg design
Most of the mechanical design of the hexapod deals with designing the legs.

#### Open-chain leg
Open-chain linkages are very straightforward: each link is followed distally by a joint until the end-effector, which is the most distal joint. Because they are straightforward, open-chain designs are almost ubiquitous among robot hexapods.

Based on the static analysis [here](http://www.robotshop.com/blog/en/robot-leg-torque-tutorial-3587), I wrote a simple [MATLAB/Octave program](/Hardware/torque_calc.m) to calculate the torque required per servo for quasi-static motion, given the masses and lengths of the robot's legs and torso.

Currently, I am thinking of using the [EMAX ES08MA II Mini Metal Gear Analog servo](https://www.aliexpress.com/item/Free-shipping-100-orginal-4x-EMAX-ES08MA-II-Mini-Metal-Gear-Analog-Servo-12g-2-0kg/1708746840.html?spm=2114.search0104.3.60.zGgXDn&ws_ab_test=searchweb0_0,searchweb201602_5_10152_10065_10151_10068_10130_10307_10137_10060_10155_10154_5370011_10056_10055_10054_10059_100031_10099_5400020_5410011_10103_10102_5430011_10052_10053_10142_10107_10050_10051_5380020_5390020_10084_10083_10080_10082_10081_10178_10110_10111_10112_10113_10114_10312_10313_10314_10315_10316_10078_10079_10073_5420011-10050,searchweb201603_5,ppcSwitch_5&btsid=4bdcc2a4-2bf1-4f49-91d5-c31a77f9120e&algo_expid=06897d5a-ac7b-4e40-b174-da471e17ec38-7&algo_pvid=06897d5a-ac7b-4e40-b174-da471e17ec38&transAbTest=ae803_3).

#### Klann linkage
An interesting alternative to a open-chain leg is a [Klann linkage](https://en.wikipedia.org/wiki/Klann_linkage), by [Joseph Klann](http://www.mechanicalspider.com):

<p img align="center">
  <a href="/Hardware/images/F1-positions.gif"><img align="center" src="https://raw.githubusercontent.com/dlynch7/P-Bot/master/Hardware/images/F1-positions.gif" width="640" ></a>
</p>

This leg design has some tradeoffs:
* Only one actuator is required to extend and contract the leg, but the leg is much more mechanically complex.
* Also, two legs are _typically_ coupled together by a common actuator, which would constrain the set of possible gaits. They don't have to be coupled, though. I think Klann did that to further reduce the number of actuators required to generate a gait.
* Torque/workspace: generally, parallel mechanisms have a smaller reachable workspace than serial mechanisms, but they are sturdier and faster within that workspace. However, parallel mechanisms behave more nonlinearly. This means that modeling torque requirements is less straightforward:
  * on one hand, the legs can't extend as far, so the actuators might have greater mechanical advantage...
  * ...but on the other hand, because of the complexity of the leg mechanism, there could be positions with great mechanical _disadvantage_ that require greater torque.
* Kinematics: generally, the _forward kinematics_ problem (given the joint angles, what is the position/orientation of the end-effector) is straightforward and the _inverse kinematics_ problem (what joint positions are required for a given end-effector position/orientation) is challenging for serial manipulators, but for parallel manipulators, this is reversed: forward kinematics is challenging and inverse kinematics is easy.
However, something cool is possible: if I treat various gaits as sequences of foot-ground contact points, gait realization becomes an inverse kinematics problem, which is easier with parallel mechanisms.

An interesting side project would be to augment the Klann linkage with linear actuators to vary the link lengths. [This nifty tool](http://www.mechanicalspider.com/spiderinputs.html) shows how varying each link length affects the resulting path of a single leg. You can imagine developing a motion planner that sets a link length based on the required gait.

Here's a screenshot of version 0 of my Klann leg:

<p img align="center">
  <a href="/Hardware/CAD/images/klann_mech_v0/klann_mech_v0.JPG"><img align="center" src="https://raw.githubusercontent.com/dlynch7/P-Bot/master/Hardware/CAD/images/klann_mech_v0/klann_mech_v0.JPG" width="480" ></a>
</p>

I haven't worked out the kinematics yet, but I want to 3D-print a rough draft that I can play with; this will give me some intuition as I work through the math. STL files are [here](/Hardware/CAD/STL/klann_mech_v0/).

Here is the physical version:

<p img align="center">
  <a href="/Hardware/images/klann_v0_kinematics/normal_position.jpg"><img align="center" src="https://raw.githubusercontent.com/dlynch7/P-Bot/master/Hardware/images/klann_v0_kinematics/normal_position.jpg" width="480" ></a>
</p>

##### Lessons from Klann leg v0:
_Singularities_ are possible, depending on link lengths. The three images below show the leg before, during, and after encountering a singularity. Notice how the leg switches configurations after the singularity. This is undesirable! Luckily, some planning and geometry can prevent singularities.

<p img align="center">
  <a href="/Hardware/images/klann_v0_kinemtics/pre_singularity.jpg"><img align="left" src="https://raw.githubusercontent.com/dlynch7/P-Bot/master/Hardware/images/klann_v0_kinematics/pre_singularity.jpg" width="240" ></a>
  <a href="/Hardware/images/klann_v0_kinemtics/singularity.jpg"><img align="center" src="https://raw.githubusercontent.com/dlynch7/P-Bot/master/Hardware/images/klann_v0_kinematics/singularity.jpg" width="240" ></a>
  <a href="/Hardware/images/klann_v0_kinemtics/post_singularity.jpg"><img align="right" src="https://raw.githubusercontent.com/dlynch7/P-Bot/master/Hardware/images/klann_v0_kinematics/post_singularity.jpg" width="240" ></a>
</p>

Link collisions can also restrict the leg's workspace, as shown below where the first rocker arm collides with the base.

<p img align="center">
  <a href="/Hardware/images/klann_v0_kinematics/link_collision.jpg"><img align="center" src="https://raw.githubusercontent.com/dlynch7/P-Bot/master/Hardware/images/klann_v0_kinematics/link_collision.jpg" width="480" ></a>
</p>

## 3. Electronics
My servos arrived! Depending on the leg design, I could be running up to 18 of them, so I need to figure out how to power all the servos, the FPGA dev board, and an Arduino or a PIC32, and still have enough power left over for some sensors. Servos can draw a lot of current, so this power supply needs to be pretty beefy. In a perfect world, there's a power supply small and light enough to mount to the hexapod frame that still delivers enough juice. Let the search begin!

If I have devices that require different voltages, I'll also need to look into DC-DC converters.
