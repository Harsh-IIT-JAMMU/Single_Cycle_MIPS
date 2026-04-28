# 🧠 Memory System & Instruction Decoding

This explains how memory is organized in the MIPS processor and how hexadecimal instructions are decoded into meaningful operations.

---

## 📦 Memory Units in MIPS

### 📄 Instruction Memory
**Definition:**  
Stores program instructions in hexadecimal (machine code) format.

**Role:**  
- Provides instruction using Program Counter (PC)  
- Read-only during execution  
- Controls program flow  

---

### 📄 Data Memory
**Definition:**  
Stores data values used during execution.

**Role:**  
- Used by `lw` and `sw` instructions  
- Supports read and write  
- Address computed by ALU  

---

### 📄 Register File
**Definition:**  
A set of 32 fast registers inside CPU.

**Role:**  
- Stores operands and results  
- Provides input to ALU  
- Receives final output  

---

## 🔢 Hex to Binary Conversion (VERY IMPORTANT)

Each hexadecimal digit = **4 binary bits**

| Hex | Binary |
|-----|--------|
| 0 | 0000 |
| 1 | 0001 |
| 2 | 0010 |
| 3 | 0011 |
| 4 | 0100 |
| 5 | 0101 |
| 6 | 0110 |
| 7 | 0111 |
| 8 | 1000 |
| 9 | 1001 |
| A | 1010 |
| B | 1011 |
| C | 1100 |
| D | 1101 |
| E | 1110 |
| F | 1111 |

---

## 🔍 Instruction Format (32-bit)

| Field | Bits |
|------|------|
| opcode | [31:26] |
| rs | [25:21] |
| rt | [20:16] |
| rd | [15:11] |
| funct | [5:0] |
| immediate | [15:0] |

---

## 🔷 Example: Full Decoding

### 🔹 Instruction: `02328020`

### Step 1: Convert Hex → Binary

0 2 3 2 8 0 2 0
0000 0010 0011 0010 1000 0000 0010 0000


### Step 2: Split into fields

000000 | 10001 | 10010 | 10000 | 00000 | 100000
opcode rs rt rd shamt funct


### Step 3: Decode
- opcode = `000000` → R-type  
- rs = 17  
- rt = 18  
- rd = 16  
- funct = `100000` → ADD  

### ✅ Final Instruction
add r16, r17, r18


---

## 🔷 Quick Decoding of Given Instructions

### `016d4022`
- funct = `100010` → SUB  
→ `sub r8, r11, r13`

---

### `012a4024`
- funct = `100100` → AND  
→ `and r8, r9, r10`

---

### `012a4025`
- funct = `100101` → OR  
→ `or r8, r9, r10`

---

### `012a402a`
- funct = `101010` → SLT  
→ `slt r8, r9, r10`

---

### `8d280004`
- opcode = `100011` → LW  
→ `lw r8, 4(r9)`

---

### `ad280008`
- opcode = `101011` → SW  
→ `sw r8, 8(r9)`

---

### `11090004`
- opcode = `000100` → BEQ  
→ branch if `r8 == r9`

---

### `21280005`
- opcode = `001000` → ADDI  
→ `r8 = r9 + 5`

---

### `11080004`
→ `beq r8, r8` → always true  

---

### `0000000B`
- invalid instruction (default behavior)

---

## 🎯 Summary

- Hex values are converted into binary using **4-bit mapping**
- Instructions are decoded by splitting into fields
- Opcode decides type, funct decides operation

---
