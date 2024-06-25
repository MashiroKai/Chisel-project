module Write(
  input        clock,
  input        reset,
  output       io_Handshaking_ready,
  input        io_Handshaking_valid,
  input  [7:0] io_Handshaking_bits,
  input        io_TXE_N,
  output       io_WR_N,
  output [7:0] io_Data
);
  assign io_Handshaking_ready = ~io_TXE_N; // @[Write.scala 14:28]
  assign io_WR_N = io_Handshaking_valid; // @[Write.scala 12:13]
  assign io_Data = io_Handshaking_bits; // @[Write.scala 13:13]
endmodule
