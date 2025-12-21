module top (
    input clk, reset,
    output MemWrite,
    output [31:0] WriteData, DataAdr
);
  wire [31:0] Instr,PC, ReadData;
riscv_cpu rvcpu    (clk, reset, PC, Instr,MemWrite, DataAdr,WriteData, ReadData);
instr_mem instrmem (PC, Instr);
data_mem  datamem  (clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule

