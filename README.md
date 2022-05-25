# ALU-calculator
Implement an ALU calculator on the FPGA supporting the boolean operations of AND, OR,
NOT, and XOR, and arithmetic operations of SHIFT (left), ADD, SUBTRACT and MULTIPLY
with overflow indicator as an additional output. The inputs should be:
- Two unsigned 4-bit numbers (switches)
- 1-bit operation type select switch (Boolean or arithmetic)
- 2-bit operation select switches
The output will be the unsigned 4-bit result shown on the SSD and the overflow indicator LED.
The inputs should be provided using the switches. If the operation requires only one operand
(e.g., shift), it is expected to perform the operation only on the first operand (A).
