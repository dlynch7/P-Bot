# Notes on DC-DC converters

This document is a distillation of the important concepts of DC-DC converters described in the references below.

References:
1. M. Wens, M. Steyaert, Design and Implementation of Fully-Integrated Inductive DC-DC Converters in Standard CMOS, Analog Circuits and Signal Processing, DOI 10.1007/978-94-007-1436-6_2, &copy; Springer Science_Business Media B. V. 2011.

## ToC
1. [Introduction](#1-introduction)
2. [Linear Voltage Converters](#2-linear-voltage-converters)
    1. [Series Converters](#21-series-converters)
    2. [Shunt Converters](#22-shunt-converters)
3. [Charge-Pump DC-DC Converters](#3-charge-pump-dc-dc-converters)
    1. [On Capacitors](#31-on-capacitors)
    2. [Series-Parallel Step-Down Converter](#32-series-parallel-step-down-converter)
    3. [Series-Parallel Step-Up Converter](#33-series-parallel-step-up-converter)
4. [Inductive Type DC-DC Converters](#4-inductive-type-dc-dc-converters)
    1. [On Inductors](#41-on-inductors)
    2. [Combining Inductors And Capacitors](#42-combining-inductors-and-capacitors)
    3. [Reflections on Steady-State Calculation Methods](#43-reflections-on-steady-state-calculation-methods)
5. [INTERMEZZO: The Efficiency Enhancement Factor](#5-intermezzo-the-efficiency-enhancement-factor)
    1. [The Concept](#51-the-concept)
    2. [Interpretations](#52-interpretations)
6. [Conclusions](#6-conclusions)

## 1 Introduction
Broadly, there are two methods of DC-DC conversion:
1. Linear voltage conversion
2. Switched-mode DC-DC conversion

The first method (linear voltage conversion) is simple, which "makes it suitable for monolithic integration in non-critical applications", but it is less efficient than the second method (switched-mode conversion), which comprises two sub-methods:

1. Charge-pump DC-DC converters
2. Inductive type DC-DC converters

As their names suggest, these two sub-methods involve capacitors, inductors, and combinations of both.

## 2 Linear Voltage Converters
These converters are resistive voltage dividers. They reduce voltage "by dissipating the excess power into a resistor". Consequently, they can only reduce voltage, never increase it. Because they dissipate electrical power as heat, they are inefficient. The amount of power they can dissipate as heat is limited by their thermal properties, so heatsinking must also be considered.

There are two types of linear voltage converters: series converters and shunt converters.

### 2.1 Series Converters
Series converters are voltage dividers which use a feedback-controlled variable resistor as the upper resistor in the divider. Figure 2.1 of reference 1 gets the idea across clearly.

### 2.2 Shunt Converters
<some stuff about shunt converters>

While linear voltage converters perform poorly compared to switched-mode converters, they are often used for start-up.

## 3 Charge-Pump DC-DC Converters
Switched-mode DC-DC converters use energy-storing passive components (capacitors and/or inductors) and switches to switch between these passives. Charge-pump DC-DC converters use only capacitors as energy-storage components.

### 3.1 On Capacitors
"The charging of capacitors is a process that is intrinsically lossy, even when all the components in the charge-circuit are considered to be ideal and lossless."

### 3.2 Series-Parallel Step-Down Converter
Figure 2.8 (a) in reference 1 illustrates this circuit. It has two operational phases, characterized by what is happening to the "flying capacitor" (C1 in the aforementioned figure):
1. Flying capacitor charge phase: the flying capacitor (C1) and the output capacitor (C2) are charged in series by the voltage source. This happens when switches SW1 and SW4 close and SW2 and SW3 open. Some of the charge current through C1 also flows through the load (Rl).
2. Flying capacitor discharge phase: SW1 & SW4 open and SW2 & SW3 close. Now, C1 charges C2. Again, some of the charge current through C1 flows through the load.

The charge phase resumes again after the discharge phase completes. This happens at the _switching frequency_.

The output voltage is limited to _1/2 of the input voltage_.

### 3.3 Series-Parallel Step-Up Converter
Figure 2.10 (a) in reference 1 illustrates this circuit. Like a step-down converter, it has two phases:
1. Flying capacitor charge phase: when switches SW1 & SW3 close and SW2 & SW4 open, the flying capacitor (C1) is charged by the voltage source as the output capacitor (C2) discharges through the load (Rl)
2. Flying capacitor discharge phase: SW1 & SW3 open and SW2 & SW4 close. Now, the input voltage _and_ C1 charge C2. Again, some of the charge current from C1 flows through the load.

As before, these two phases repeat at the _switching frequency_.

The output voltage is limited to _twice the input voltage_.

## 4 Inductive Type DC-DC Converters
This type of converter employs both inductors (or sometimes transformers) and capacitors. Unlike capacitor charging, inductor charging is not lossy.

### 4.1 On Inductors

### 4.2 Combining Inductors And Capacitors

### 4.3 Reflections on Steady-State Calculation Methods

#### Continuous Conduction Mode

#### Discontinuous Conduction Mode

#### Continuous-Discontinuous Boundary

## 5 INTERMEZZO: The Efficiency Enhancement Factor

"The Efficiency Enhancement Factor (EEF) allows comparison in terms of power conversion efficiency that is independent of the voltage conversion ratio."

### 5.1 The Concept

### 5.2 Interpretations

## 6 Conclusions
