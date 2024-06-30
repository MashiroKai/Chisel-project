module Fakedata(
  input        clock,
  input        reset,
  input        io_Start,
  input        io_WriteHS_ready,
  output       io_WriteHS_valid,
  output [7:0] io_WriteHS_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] StateReg; // @[Fakedata.scala 24:23]
  wire  CntValidEnable = StateReg == 2'h1; // @[Fakedata.scala 25:35]
  wire  CntTimeEnable = StateReg == 2'h2; // @[Fakedata.scala 26:34]
  wire  _CntValid_T = ~CntValidEnable; // @[Fakedata.scala 27:61]
  reg [16:0] CntValid; // @[Fakedata.scala 18:26]
  wire  _CntValid_counter_T = CntValid == 17'h10213; // @[Fakedata.scala 19:36]
  wire [16:0] _CntValid_counter_T_4 = CntValid + 17'h1; // @[Fakedata.scala 19:80]
  wire  _CntTime_T = ~CntTimeEnable; // @[Fakedata.scala 28:49]
  reg [25:0] CntTime; // @[Fakedata.scala 18:26]
  wire  _CntTime_counter_T = CntTime == 26'h3938700; // @[Fakedata.scala 19:36]
  wire [25:0] _CntTime_counter_T_4 = CntTime + 26'h1; // @[Fakedata.scala 19:80]
  wire [1:0] _GEN_3 = ~io_Start ? 2'h0 : StateReg; // @[Fakedata.scala 47:30 48:22 24:23]
  wire [1:0] _GEN_6 = _CntTime_counter_T ? 2'h1 : _GEN_3; // @[Fakedata.scala 52:37 53:22]
  assign io_WriteHS_valid = 2'h0 == StateReg ? 1'h0 : 2'h1 == StateReg & io_WriteHS_ready; // @[Fakedata.scala 33:17 29:18]
  assign io_WriteHS_bits = CntValid[7:0];
  always @(posedge clock) begin
    if (reset) begin // @[Fakedata.scala 24:23]
      StateReg <= 2'h0; // @[Fakedata.scala 24:23]
    end else if (2'h0 == StateReg) begin // @[Fakedata.scala 33:17]
      if (io_Start) begin // @[Fakedata.scala 35:23]
        StateReg <= 2'h1; // @[Fakedata.scala 35:33]
      end
    end else if (2'h1 == StateReg) begin // @[Fakedata.scala 33:17]
      if (_CntValid_counter_T) begin // @[Fakedata.scala 45:39]
        StateReg <= 2'h2; // @[Fakedata.scala 46:22]
      end else begin
        StateReg <= _GEN_3;
      end
    end else if (2'h2 == StateReg) begin // @[Fakedata.scala 33:17]
      StateReg <= _GEN_6;
    end
    if (reset) begin // @[Fakedata.scala 18:26]
      CntValid <= 17'h0; // @[Fakedata.scala 18:26]
    end else if (_CntValid_T | CntValid == 17'h10213) begin // @[Fakedata.scala 19:19]
      CntValid <= 17'h0;
    end else if (CntValidEnable & io_WriteHS_valid) begin // @[Fakedata.scala 19:57]
      CntValid <= _CntValid_counter_T_4;
    end
    if (reset) begin // @[Fakedata.scala 18:26]
      CntTime <= 26'h0; // @[Fakedata.scala 18:26]
    end else if (_CntTime_T | CntTime == 26'h3938700) begin // @[Fakedata.scala 19:19]
      CntTime <= 26'h0;
    end else if (CntTimeEnable) begin // @[Fakedata.scala 19:57]
      CntTime <= _CntTime_counter_T_4;
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
  StateReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  CntValid = _RAND_1[16:0];
  _RAND_2 = {1{`RANDOM}};
  CntTime = _RAND_2[25:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
