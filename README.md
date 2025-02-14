### 4-Stage Pipelined CPU in Verilog

## Overview

This project is a 4-stage pipelined CPU designed in Verilog. The CPU consists of fundamental components including an ALU, Control Unit, Register File, Program Counter, and Instruction Memory. It supports 10+ instructions and achieves 100% functional accuracy in simulation using ModelSim and GTKWave.

## Features

 - 4-Stage Pipeline: Fetch, Decode, Execute, Write-back

 - ALU: Performs arithmetic and logic operations

 - Control Unit: Determines instruction execution behavior

 - Register File: Stores and retrieves CPU register values

 - Program Counter: Manages instruction execution order

 - Instruction Memory: Holds pre-loaded machine code

 - Functional Simulation: Debugged with ModelSim & GTKWave

## Project Structure
```bash
├── cpu.v                  # Top-Level CPU Module
├── alu.v                  # Arithmetic Logic Unit
├── control_unit.v         # Control Unit
├── register_file.v        # Register File
├── pc.v                   # Program Counter
├── instruction_memory.v   # Instruction Memory
└── README.md              # Project Documentation
```

### CPU Pipeline Stages
```bash
Instruction Fetch (IF) - Retrieves the instruction from memory.

Instruction Decode (ID) - Decodes the instruction and reads registers.

Execute (EX) - Performs ALU operations.

Write-back (WB) - Stores results back into registers.

Supported Instructions

The CPU supports a subset of MIPS-like instructions:

Arithmetic & Logical: ADD, SUB, AND, OR, SLT

Memory Access: LW (Load Word), SW (Store Word)

Control Flow: BEQ (Branch if Equal)

Running the Simulation

Step 1: Compile in ModelSim

vlog cpu.v alu.v control_unit.v register_file.v pc.v instruction_memory.v

Step 2: Simulate the CPU

vsim work.cpu

Step 3: View the Waveforms

add wave -position insertpoint sim:/cpu/*
run -all
```

### Next Steps

Optimize performance by reducing pipeline stalls.

Add forwarding to handle data hazards.

Implement more complex instructions (multiplication, division).

Extend memory access capabilities (stack operations).

Contact & Contributions

This project was created by Makari. Contributions and feedback are welcome! If you’d like to collaborate, feel free to open an issue or submit a pull request.
