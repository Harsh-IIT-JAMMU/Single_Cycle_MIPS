# 🖥️ Single Cycle MIPS Processor (Verilog)

## 📌 Overview
This project implements a **Single-Cycle MIPS Processor** using Verilog HDL.  
The processor executes instructions in a single clock cycle and supports core MIPS functionalities including arithmetic operations, memory access, branching, and jump instructions.

---

## ⚙️ Features
- R-type Instructions: `add`, `sub`, `and`, `or`, `slt`
- I-type Instructions: `lw`, `sw`, `addi`, `beq`
- J-type Instruction: `jump`
- 32-bit datapath
- Register File with 32 registers
- Instruction and Data Memory support
- Control Unit with ALU control logic

---

## 🧠 Architecture
The processor consists of the following components:
- Program Counter (PC)
- Instruction Memory
- Register File
- ALU (Arithmetic Logic Unit)
- Data Memory
- Control Unit
- Sign Extension and Multiplexers

---

## 🧪 Simulation
- Simulated using **Xilinx Vivado**
- Testbench verifies:
  - Instruction execution
  - ALU operations
  - Memory read/write
  - Branch and jump behavior
# 📂 File Descriptions

## 🔷 Verilog Source Files

### 📄 Single_Cycle_MIPS.v
Top-level module implementing the complete single-cycle MIPS processor, integrating datapath and control logic.

### 📄 Program_Counter.v
Implements the program counter (PC) that updates the instruction address on each clock cycle.

### 📄 Instruction_mem.v
Read-only memory that stores instructions and provides them based on the current PC address.

### 📄 Register_File.v
Contains 32 registers supporting read and write operations for instruction execution.

### 📄 Data_Mem.v
Data memory module used for load (lw) and store (sw) operations during execution.

---

## 🔷 Testbench Files

### 📄 MIPS_tb.v
Testbench for simulating the full MIPS processor, including memory initialization and instruction execution.

---

## 🔷 Memory Files

### 📄 Instruction_Mem.mem
Contains machine code instructions executed by the MIPS processor during simulation.

### 📄 Register_File.mem
Initializes register values before simulation to ensure predictable execution.

### 📄 Data_Mem.mem
Initializes data memory values used in load and store operations.

### 📄 truth_table.mem
Default instruction memory initialization file (overridden during simulation by testbench).
---

## 📂 Project Structure
