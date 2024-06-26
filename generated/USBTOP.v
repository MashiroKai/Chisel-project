module Read(
  input        clock,
  input        io_Ctrl,
  input        io_ReadHS_ready,
  output       io_ReadHS_valid,
  output [7:0] io_ReadHS_bits,
  input        io_ReadIO_RXF_N,
  output       io_ReadIO_RD_N,
  output       io_ReadIO_OE_N,
  input  [7:0] io_ReadIO_Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  RD = ~io_Ctrl & ~io_ReadIO_RXF_N & io_ReadHS_ready; // @[Read.scala 22:59]
  reg  io_ReadIO_RD_N_REG; // @[Read.scala 19:26]
  reg  io_ReadHS_valid_REG; // @[Read.scala 20:27]
  reg [7:0] io_ReadHS_bits_REG; // @[Read.scala 21:26]
  assign io_ReadHS_valid = io_ReadHS_valid_REG; // @[Read.scala 20:17]
  assign io_ReadHS_bits = io_ReadHS_bits_REG; // @[Read.scala 21:16]
  assign io_ReadIO_RD_N = io_ReadIO_RD_N_REG; // @[Read.scala 19:16]
  assign io_ReadIO_OE_N = io_Ctrl; // @[Read.scala 18:16]
  always @(posedge clock) begin
    io_ReadIO_RD_N_REG <= ~RD; // @[Read.scala 19:27]
    io_ReadHS_valid_REG <= ~io_Ctrl & ~io_ReadIO_RXF_N & io_ReadHS_ready; // @[Read.scala 22:59]
    io_ReadHS_bits_REG <= io_ReadIO_Data; // @[Read.scala 21:26]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_ReadIO_RD_N_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_ReadHS_valid_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_ReadHS_bits_REG = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Write(
  input        clock,
  output       io_WriteHS_ready,
  input        io_WriteHS_valid,
  input  [7:0] io_WriteHS_bits,
  input        io_WriteIO_TXE_N,
  output       io_WriteIO_WR_N,
  output [7:0] io_WriteIO_Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  io_WriteHS_ready_REG; // @[Write.scala 16:31]
  assign io_WriteHS_ready = io_WriteHS_ready_REG; // @[Write.scala 16:21]
  assign io_WriteIO_WR_N = ~(io_WriteHS_valid & ~io_WriteIO_TXE_N); // @[Write.scala 14:26]
  assign io_WriteIO_Data = io_WriteHS_bits; // @[Write.scala 15:21]
  always @(posedge clock) begin
    io_WriteHS_ready_REG <= ~io_WriteIO_TXE_N; // @[Write.scala 16:32]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_WriteHS_ready_REG = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module USBTOP(
  input        clock,
  input        reset,
  input        io_Ctrl,
  input        io_ReadHS_ready,
  output       io_ReadHS_valid,
  output [7:0] io_ReadHS_bits,
  input        io_ReadIO_RXF_N,
  output       io_ReadIO_RD_N,
  output       io_ReadIO_OE_N,
  input  [7:0] io_ReadIO_Data,
  output       io_WriteHS_ready,
  input        io_WriteHS_valid,
  input  [7:0] io_WriteHS_bits,
  input        io_WriteIO_TXE_N,
  output       io_WriteIO_WR_N,
  output [7:0] io_WriteIO_Data
);
  wire  Read_instance_clock; // @[USBTOP.scala 16:27]
  wire  Read_instance_io_Ctrl; // @[USBTOP.scala 16:27]
  wire  Read_instance_io_ReadHS_ready; // @[USBTOP.scala 16:27]
  wire  Read_instance_io_ReadHS_valid; // @[USBTOP.scala 16:27]
  wire [7:0] Read_instance_io_ReadHS_bits; // @[USBTOP.scala 16:27]
  wire  Read_instance_io_ReadIO_RXF_N; // @[USBTOP.scala 16:27]
  wire  Read_instance_io_ReadIO_RD_N; // @[USBTOP.scala 16:27]
  wire  Read_instance_io_ReadIO_OE_N; // @[USBTOP.scala 16:27]
  wire [7:0] Read_instance_io_ReadIO_Data; // @[USBTOP.scala 16:27]
  wire  Write_instance_clock; // @[USBTOP.scala 17:28]
  wire  Write_instance_io_WriteHS_ready; // @[USBTOP.scala 17:28]
  wire  Write_instance_io_WriteHS_valid; // @[USBTOP.scala 17:28]
  wire [7:0] Write_instance_io_WriteHS_bits; // @[USBTOP.scala 17:28]
  wire  Write_instance_io_WriteIO_TXE_N; // @[USBTOP.scala 17:28]
  wire  Write_instance_io_WriteIO_WR_N; // @[USBTOP.scala 17:28]
  wire [7:0] Write_instance_io_WriteIO_Data; // @[USBTOP.scala 17:28]
  Read Read_instance ( // @[USBTOP.scala 16:27]
    .clock(Read_instance_clock),
    .io_Ctrl(Read_instance_io_Ctrl),
    .io_ReadHS_ready(Read_instance_io_ReadHS_ready),
    .io_ReadHS_valid(Read_instance_io_ReadHS_valid),
    .io_ReadHS_bits(Read_instance_io_ReadHS_bits),
    .io_ReadIO_RXF_N(Read_instance_io_ReadIO_RXF_N),
    .io_ReadIO_RD_N(Read_instance_io_ReadIO_RD_N),
    .io_ReadIO_OE_N(Read_instance_io_ReadIO_OE_N),
    .io_ReadIO_Data(Read_instance_io_ReadIO_Data)
  );
  Write Write_instance ( // @[USBTOP.scala 17:28]
    .clock(Write_instance_clock),
    .io_WriteHS_ready(Write_instance_io_WriteHS_ready),
    .io_WriteHS_valid(Write_instance_io_WriteHS_valid),
    .io_WriteHS_bits(Write_instance_io_WriteHS_bits),
    .io_WriteIO_TXE_N(Write_instance_io_WriteIO_TXE_N),
    .io_WriteIO_WR_N(Write_instance_io_WriteIO_WR_N),
    .io_WriteIO_Data(Write_instance_io_WriteIO_Data)
  );
  assign io_ReadHS_valid = Read_instance_io_ReadHS_valid; // @[USBTOP.scala 19:10]
  assign io_ReadHS_bits = Read_instance_io_ReadHS_bits; // @[USBTOP.scala 19:10]
  assign io_ReadIO_RD_N = Read_instance_io_ReadIO_RD_N; // @[USBTOP.scala 20:10]
  assign io_ReadIO_OE_N = Read_instance_io_ReadIO_OE_N; // @[USBTOP.scala 20:10]
  assign io_WriteHS_ready = Write_instance_io_WriteHS_ready; // @[USBTOP.scala 21:11]
  assign io_WriteIO_WR_N = Write_instance_io_WriteIO_WR_N; // @[USBTOP.scala 22:11]
  assign io_WriteIO_Data = Write_instance_io_WriteIO_Data; // @[USBTOP.scala 22:11]
  assign Read_instance_clock = clock;
  assign Read_instance_io_Ctrl = io_Ctrl; // @[USBTOP.scala 18:8]
  assign Read_instance_io_ReadHS_ready = io_ReadHS_ready; // @[USBTOP.scala 19:10]
  assign Read_instance_io_ReadIO_RXF_N = io_ReadIO_RXF_N; // @[USBTOP.scala 20:10]
  assign Read_instance_io_ReadIO_Data = io_ReadIO_Data; // @[USBTOP.scala 20:10]
  assign Write_instance_clock = clock;
  assign Write_instance_io_WriteHS_valid = io_WriteHS_valid; // @[USBTOP.scala 21:11]
  assign Write_instance_io_WriteHS_bits = io_WriteHS_bits; // @[USBTOP.scala 21:11]
  assign Write_instance_io_WriteIO_TXE_N = io_WriteIO_TXE_N; // @[USBTOP.scala 22:11]
endmodule
