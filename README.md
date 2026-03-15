## 3bit counter programmable up/down BCD counter in Verilog HDL

This repository demonstrates how to run a **3-bit counter** synthesized using Xilinx Vivado, inside an Aldec Active‑HDL environment on Windows. It contains the main Verilog module, as well as testbench used for verification.
In verilog we are able to work on three layers of abstraction: Gate level, Data flow level, Behavioral level. Those three different ways of describing hardware were used while designing the project. It is a digital design project written in Verilog HDL and targeted for Artix-7 FPGA devices. The design implements a 3-bit programmable up/down BCD counter with additional control features such as data loading, clock enable, tri-state output, and a selectable input register.

### Table of Contents
1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [Prerequisites](#prerequisites)
4. [Installation & Setup](#installation--setup)
5. [Scripts Explanation](#scripts-explanation)

---

### Overview

- **Goal**: Design and simulate a 3-bit programmable BCD up/down counter using Verilog HDL targeted for an Artix-7 FPGA.
- **Simulation**: Functional verification is performed using Aldec Active-HDL.
- **Synthesis**: The design can be synthesized and implemented on FPGA devices using Xilinx Vivado.

After running the simulation, the waveform results verify correct behavior of the counter under different control signals and operating conditions.

---

### Project Structure

- **src/** 
Main folder containing the Verilog design files.

- **TutorVerilog.v/**
The main Verilog module implementing the counter logic, latch register, multiplexer, and tri-state output buffer.

- **TestBench//**
Folder containing files used for simulation and verification.

- **TutorVerilog_TB.v/**
Testbench generating input stimuli such as clock, reset, enable, load, and direction signals.

- **simulation_script.do/**
Script used in Active-HDL to compile the design, start simulation, display waveforms, and run the testbench.

---

### Prerequisites

1. **FPGA Design Software**:
    - Xilinx Vivado for synthesis and hardware implementation.
    - Aldec Active-HDL for simulation.

2. **Basic Knowledge**:
   
    - Verilog HDL
    - Digital logic design (flip-flops, counters, multiplexers)

3. **Optional Hardware**:
    - FPGA board based on Artix-7 architecture for hardware testing.
---

### Installation & Setup

1. **Clone the Repository**
      - git clone
      - cd TutorVerilog
   
2. **Open the Project in Active-HDL**
      - Create a new workspace.
      - Add the design file TutorVerilog.v.
      - Add the testbench TutorVerilog_TB.v.
   
3. **Compile the Design**
      - Compile both the main module and the testbench inside the simulator.
   
4. **Run Simulation**
      - Execute the simulation script or run the testbench manually to observe waveform outputs and verify the counter behavior.

---

### Scripts Explanation

- **TutorVerilog.v** 

**Purpose:**  
Implements the main digital logic of the project.

**Main components:**
- 3-bit BCD counter  
- Up/down counting logic  
- Asynchronous clear  
- Parallel load register  
- Latch for input data  
- Multiplexer for selecting output source  
- Tri-state output buffer  

---

- **TutorVerilog_TB.v** 

**Purpose:**  
Testbench used to verify the functionality of the counter.

**Features:**
- Generates a **10 MHz clock signal**
- Tests **reset**, **enable**, and **load** operations
- Changes **counting direction**
- Tests **multiplexer** and **tri-state output** behavior
- Provides different **input data values** for verification

---

- **simulation_script.do** 

**Purpose:**  
Automates simulation in Active-HDL.

**Functions:**
- Compiles the design and testbench files
- Starts the simulation
- Displays waveform signals in the viewer
- Runs the simulation for **6000 ns**
