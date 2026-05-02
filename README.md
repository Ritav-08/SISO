# SISO Shift Register (4-bit) in Verilog

## Overview

This project implements a **4-bit Serial-In Serial-Out (SISO) shift register** in Verilog.

A SISO shift register accepts data serially (one bit at a time) and shifts it through a chain of flip-flops. The output is also produced serially after a fixed number of clock cycles.

---

## Module Description

### `SISO`

A 4-stage shift register using D flip-flops:

* Serial data input
* Serial data output
* Clock-driven shifting operation

---

## Inputs and Outputs

### Inputs

| Signal  | Description       |
| ------- | ----------------- |
| `din_i` | Serial data input |
| `clk_i` | Clock input       |

### Output

| Signal   | Description        |
| -------- | ------------------ |
| `dout_o` | Serial data output |

---

## Functional Behavior

* On every rising edge of the clock, input data is shifted into the first flip-flop.
* Each flip-flop passes its stored value to the next stage.
* After **4 clock cycles**, the input bit appears at the output.

---

## Data Flow

```id="siso_flow_01"
din_i → [DFF0] → [DFF1] → [DFF2] → [DFF3] → dout_o
```

---

## Timing Behavior

If a bit is applied at the input:

```id="siso_timing_01"
Clock Cycle:   1   2   3   4
Input Bit:     1
Output:        -   -   -   1
```

* The output is delayed by **4 clock cycles**.

---

## Code Snippet

```verilog id="siso_code_01"
always@(posedge clk_i)
   dout_o <= D_i;
```

(Used internally in each D flip-flop stage)

---

## Design Characteristics

* **Synchronous design**: All flip-flops triggered by the same clock
* **Fixed delay**: Output appears after N cycles (N = number of stages)
* **Simple structure**: Cascaded D flip-flops
* **Deterministic behavior**

---

## Simulation

The testbench verifies:

* Continuous serial input stream
* Correct propagation through all stages
* Output delay behavior

Waveforms are generated in `.vcd` format for visualization.

---

## File Structure

```id="siso_files_01"
.
├── SISO.v            # Design module
├── Dff.v             # D flip-flop module
├── tb_SISO.v         # Testbench
├── SISO.vcd          # Waveform output
```

---

## Notes

* The number of flip-flops determines the delay length.
* Can be extended to wider registers by adding more stages.
* Useful for serial communication and data buffering.

---

## Conclusion

This implementation demonstrates a basic **Serial-In Serial-Out shift register**, a fundamental building block in digital systems for sequential data transfer and delay operations.
