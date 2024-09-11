load CPU.hdl,
output-file CPU.out,
compare-to CPU.cmp,
output-list time%S0.4.0 fromM%D0.16.0 Instruction%B10.6.10 Reset%B2.1.2 toM%D1.16.0 writeM%B3.1.3 addressM%D0.16.0 PCout%D0.16.0;

set Instruction %B0000, // read r0, r0
set fromM 10,
tick, output, tock, output;
//R0 now contains 10

set Instruction %B100100, // add r1 r0
tick, output, tock, output;
//R1 now contains 10

set Instruction %B100100, // add r1 r0
tick, output, tock, output;
//R1 now contains 20

set Instruction %B010101, // write r1 r1
tick, output, tock, output;
//R1 now contains 20

set Instruction %B010001, // write r0 r1
tick, output, tock, output;
//mem[10] now has 20

set Instruction %B111100, // jump r3 r0
tick, output, tock, output;
// should not jump 

set Instruction %B100001, // add r0 r1
tick, output, tock, output;
//R0 now contains 30

set fromM -20,
set Instruction %B001100, // read r3 r0
tick, output, tock, output;
// mem[30] has -20 