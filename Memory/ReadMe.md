## 🧠 Memory Units in MIPS

### 📄 Instruction Memory
**Definition:**  
Stores the program instructions (machine code) to be executed by the processor.

**Role:**  
- Provides instruction based on Program Counter (PC)  
- Read-only during execution  
- Controls overall flow of execution  

---

### 📄 Data Memory
**Definition:**  
Stores data values that are accessed during program execution.

**Role:**  
- Used by `lw` (load) and `sw` (store) instructions  
- Supports both read and write operations  
- Address is computed by ALU  

---

### 📄 Register File
**Definition:**  
A small, fast memory inside the CPU containing 32 registers.

**Role:**  
- Stores operands and computation results  
- Provides inputs to ALU  
- Receives final output (write-back stage)  

---

## 🔍 Instruction Decoding

Each instruction is 32-bit and decoded using fields:

| Field | Bits |
|------|------|
| opcode | [31:26] |
| rs | [25:21] |
| rt | [20:16] |
| rd | [15:11] |
| funct | [5:0] |
| immediate | [15:0] |

---

### 🔷 R-Type Instructions (opcode = 000000)

#### `02328020` → `add r16, r17, r18`
- opcode = 000000 → R-type  
- rs = 17, rt = 18, rd = 16  
- funct = 100000 → ADD  

---

#### `016d4022` → `sub r8, r11, r13`
- funct = 100010 → SUB  

---

#### `012a4024` → `and r8, r9, r10`
- funct = 100100 → AND  

---

#### `012a4025` → `or r8, r9, r10`
- funct = 100101 → OR  

---

#### `012a402a` → `slt r8, r9, r10`
- funct = 101010 → SLT  

---

### 🔷 I-Type Instructions

#### `8d280004` → `lw r8, 4(r9)`
- opcode = 100011 → LOAD  
- rs = 9 (base), rt = 8 (destination)  
- immediate = 4  

---

#### `ad280008` → `sw r8, 8(r9)`
- opcode = 101011 → STORE  
- rs = 9, rt = 8  
- immediate = 8  

---

#### `11090004` → `beq r8, r9, 4`
- opcode = 000100 → BRANCH  
- if (r8 == r9) → branch  

---

#### `21280005` → `addi r8, r9, 5`
- opcode = 001000 → ADDI  
- r8 = r9 + 5  

---

#### `11080004` → `beq r8, r8, 4`
- always true → branch taken  

---

### 🔷 Invalid / Dummy Instruction

#### `0000000B`
- opcode = 000000 (R-type)  
- funct = invalid  
- executes default ALU behavior  

---

## 🎯 Summary

- **Instruction Memory** → provides instructions  
- **Register File** → provides operands and stores results  
- **Data Memory** → stores data for load/store operations  

- Instructions are decoded using **opcode and funct fields** to determine operation.
