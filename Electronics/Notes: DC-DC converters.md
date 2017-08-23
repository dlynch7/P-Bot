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
These converters are resistive voltage dividers. They reduce voltage "by dissipating the excess power into a resistor". Consequently, they can only reduce voltage, never increase it. Because they dissipate electrical power as heat, they are inefficient. Also, the amount of power they can dissipate as heat is limited by their thermal properties

There are two types of linear voltage converters: series converters and shunt converters.

### 2.1 Series Converters
Series converters are voltage dividers which use a feedback-controlled variable resistor as the upper resistor in the divider. Figure 2.1 of reference 1 gets the idea across clearly.

### 2.2 Shunt Converters
<some stuff about shunt converters>

While linear voltage converters perform poorly compared to switched-mode converters, they are often used for start-up.

## 3 Charge-Pump DC-DC Converters

### 3.1 On Capacitors

### 3.2 Series-Parallel Step-Down Converter

### 3.3 Series-Parallel Step-Up Converter

## 4 Inductive Type DC-DC Converters

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
