# Combo Lock Verilog Implementation

This repository contains a Verilog implementation of a **Combination Lock** system using **Finite State Machines (FSMs)**. The design includes modules for user input handling, state management, lock verification, and 7-segment display output.

## Features

- Implements a **combination lock** system.
- Uses **FSM-based logic** for controlling lock states.
- **Seven-segment display** interface for lock status.
- Supports **reset and change functionality**.
- Includes separate modules for modular design.

## Modules Overview

### **1. combo\_lock.v**

- Top-level module integrating all submodules.
- Connects user inputs (`b1`, `b2`, `x`) with FSMs and displays.

### **2. moore.v**

- Implements a **Moore finite state machine (FSM)**.
- Handles input processing for `enter` and `change` states.

### **3. comparison.v**

- Compares user-entered combination with the stored code.
- Outputs `match` signal indicating success or failure.

### **4. lock.v**

- Manages the lock/unlock logic.
- Controls `open`, `alarm`, and `neww` states based on user input.

### **5. hex7seg.v**

- Drives a **7-segment display** based on the lock status.
- Indicates whether the lock is **open, incorrect, or ready for a new code**.

## State Diagrams

### 1. **State Diagram for Input Conditioning**

This diagram represents a rough sketch of the finite state machine for input conditioning. The input `w` determines the state transitions, and the output `z` reflects the current state behavior.

![Rough State Diagram for Input Conditioning](https://github.com/user-attachments/assets/b57d1c90-9082-43af-8785-9e3c160442ee)


- **State A**: Initial state, `z = 0`.
- **State B**: Transitioned when `w = 1`, `z = 1`.
- **State C**: Transitioned when `w = 0` again.

### 2. **State Diagram of the Combination Lock**

This diagram illustrates the detailed state transitions of the combination lock system. Inputs include `Enter`, `Change`, and `Match`, while outputs include `Open`, `New`, and `Alarm`.

![State Diagram of the Combination Lock](https://github.com/user-attachments/assets/cced558d-67dc-41b7-9b2d-d758fb56f123)


- **State A**: Default state where the lock is closed.
- **State B**: State for reset operations.
- **State C**: State where the lock is open.
- **State D**: Alarm state triggered by incorrect attempts.
- **State E**: New code entry state.

## Block Diagram

The following block diagram shows the high-level architecture of the combination lock system. Each module interacts to implement the required functionality:

![Block Diagram for Combination Lock](https://github.com/user-attachments/assets/8cd1c63c-cd68-43d6-8fae-37f53938c007)


- **Moore FSMs**: Handle input conditioning (`Enter` and `Change`).
- **Comparison Module**: Compares the entered code with the stored code.
- **Lock Module**: Manages lock states and outputs (`Open`, `Alarm`, `New`).
- **Hex7seg Module**: Drives the 7-segment display based on lock states.

## Author

Waleed Malik ([waleedmalik027@gmail.com](mailto:waleedmalik027@gmail.com)) 
Aadil Rehan ([aadilrehan02@gmail.com](mailto:aadilrehan02@gmail.com))

