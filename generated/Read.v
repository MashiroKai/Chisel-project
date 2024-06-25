module Read(
  input        clock,
  input        reset,
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
`endif // RANDOMIZE_REG_INIT
  reg  OE; // @[Read.scala 16:20]
  reg  RD; // @[Read.scala 17:20]
  wire  RXF = ~io_ReadIO_RXF_N; // @[Read.scala 18:12]
  wire  _T_2 = RXF & io_ReadHS_ready; // @[Read.scala 23:21]
  wire  _T_5 = OE & RXF; // @[Read.scala 28:21]
  assign io_ReadHS_valid = RD; // @[Read.scala 22:24]
  assign io_ReadHS_bits = io_ReadIO_Data; // @[Read.scala 21:24]
  assign io_ReadIO_RD_N = ~RD; // @[Read.scala 20:24]
  assign io_ReadIO_OE_N = ~OE; // @[Read.scala 19:24]
  always @(posedge clock) begin
    if (reset) begin // @[Read.scala 16:20]
      OE <= 1'h0; // @[Read.scala 16:20]
    end else begin
      OE <= _T_2;
    end
    if (reset) begin // @[Read.scala 17:20]
      RD <= 1'h0; // @[Read.scala 17:20]
    end else begin
      RD <= _T_5;
    end
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
  OE = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  RD = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
