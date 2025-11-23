# Workshop planning

Preliminary workshop date is 29 November 2025.

Language: Russian.

## Plan

Overall time of the event is 3-4 hours plus lunch break at the canteen in the middle.

1. Foreword. Couple of words about the University, about room setup, about plan.
2. Introduction.
   - Discussion about Chip Design School in general, supported by Yadro.
   - Historical reference about Yuri Panchul and MIET.
   - Demonstration of the School lecture topics, practical exercises on FPGA boards and homeworks.
   - Mention of the MIET's APS course for students interested specifically in RISC-V processors.
   - Discussion about the SoC Challenge by Yadro. Presentation of the tracks: RTL, Topology, System Programming. Team formation for '26. Maybe example of the previous year task for RTL Junior track and Sys Programming.
4. Presentation to the ALU Task. Explanation of the class planning.
5. Theoretical part.
6. Practical part.

### Theoretical part plan

1. Discuss about microelectronics and digital circuit design.
2. Basics on combinational and sequential logic.
3. Basics on HDL in general and SystemVerilog in particular. Three ways to execute Verilog: sim, fpga, asic.
4. Theory on binary numbers, two's bit complement, adder/subtractor.
5. Theory on equality.
6. Theory on binary multiplicator.

### Practical part plan

1. Introduction to the setup. Configuration of the TM1638 board connection.
2. Implementation of the 8-bit adder.
2. Checking of the implementation correctness with adder Testbench using terminal.
3. Implementation of the 8-bit adder/subtractor with mux for two's complement.
3. Checking of the implementation correctness with adder/subtractor Testbench using terminal.
4. Implementation of the equality with generate.
4. Checking correctness with testbench.
5. Implementation of the multiplicator.
5. Checking correctness with testbench.
6. Implementation of the ALU.
6. Final full check with final testbench.

### Wrapping up note

- Talk about Yosis and OpenROAD (LibreLane), show GDSII file with ALU using Tiny Tapeout with SKY130 cells.
- Talk about opportunities of the [MPW MIET](https://mpw.miet.ru/) shuttle service.
