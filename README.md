# 3-Bit Unsigned ALU in Verilog HDL

This project implements a 3-bit Unsigned Arithmetic Logic Unit (ALU) using Verilog HDL. The design supports simulation and implementation on Intel/Altera FPGA boards (e.g., DE0-CV). It performs four operations—addition, subtraction, XOR, and logical left shift—on two 3-bit unsigned inputs and produces a 4-bit result displayed on two 7-segment displays.

## Project Structure

| File        | Description                                       |
|-------------|---------------------------------------------------|
| ALU3bit.v   | Complete Verilog module (top and submodules)      |
| README.md   | This documentation                                |
| .vwf        | Optional simulation waveform                      |
| .qpf/.qsf   | Quartus project files (optional)                  |

## Objective

Design and implement a modular ALU that:
- Accepts two 3-bit unsigned inputs (`ain` and `bin`)
- Uses a 2-bit `fun_sel` to select the operation
- Outputs a 4-bit result (`out`)
- Displays the result in decimal format using two 7-segment displays

## Supported Operations

| fun_sel | Operation     | Expression     | Example        |
|---------|---------------|----------------|----------------|
| 00      | Addition       | ain + bin      | 6 + 5 = 11     |
| 01      | Subtraction    | ain - bin      | 6 - 2 = 4      |
| 10      | Bitwise XOR    | ain ^ bin      | 6 ^ 3 = 5      |
| 11      | Left Shift     | ain << 1       | 6 << 1 = 12    |

## Tools & Requirements

- Intel Quartus Prime (18.1 or newer)
- Compatible Intel FPGA board (e.g., DE0-CV)
- ModelSim (optional for simulation)

## Step-by-Step Usage

### 1. Create Quartus Project
- Launch Quartus Prime
- Create a new project named `ALU3bit`
- Add `ALU3bit.v` as the source file
- Select appropriate FPGA device (e.g., Cyclone V: 5CEBA4F23C7)

### 2. Assign Pins (Example for DE0-CV)

| Signal       | FPGA Switch/Button | Notes             |
|--------------|--------------------|-------------------|
| ain[2:0]     | SW[2:0]            | First operand     |
| bin[2:0]     | SW[5:3]            | Second operand    |
| fun_sel[1:0] | SW[7:6]            | Operation select  |
| HEX0[6:0]    | HEX0               | Units digit       |
| HEX1[6:0]    | HEX1               | Tens digit        |

Use the Pin Planner to assign physical pins according to your board documentation.

### 3. Compile Design
- Open Processing > Start Compilation
- Wait for synthesis, fitter, assembler
- Ensure no errors and minimal warnings

### 4. Simulate (Optional)
- Open University Waveform Editor
- Add input/output signals
- Define vector test cases
- Run simulation to verify logic

### 5. Program the FPGA
- Connect USB-Blaster cable
- Open Programmer tool
- Select correct .sof file and device
- Click "Start" to program the board

## Example Output

| ain (bin) | bin (bin) | fun_sel | Operation | Output | HEX1 | HEX0 |
|-----------|-----------|---------|-----------|--------|------|------|
| 110       | 101       | 00      | Add       | 11     | 1    | 1    |
| 110       | 010       | 01      | Subtract  | 4      | 0    | 4    |
| 101       | 011       | 10      | XOR       | 6      | 0    | 6    |
| 011       | ---       | 11      | Shift     | 6      | 0    | 6    |

## Design Summary

- Purely combinational (no clock)
- Modular (easily extendable to 4-bit or more)
- Result displayed in decimal (0–15 range)
- Wraps around on unsigned subtraction

## Potential Improvements

- Add signed mode toggle
- Add carry/overflow detection
- Extend support to more logic functions
- Include testbench with assertions

## License

This project is licensed under the MIT License.

## Contact

Author: *Muddasir Attar* 
