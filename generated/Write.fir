circuit Write :
  module Write :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip Handshaking : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, flip TXE_N : UInt<1>, WR_N : UInt<1>, Data : UInt<8>}

    io.WR_N <= io.Handshaking.valid @[Write.scala 12:13]
    io.Data <= io.Handshaking.bits @[Write.scala 13:13]
    node _io_Handshaking_ready_T = not(io.TXE_N) @[Write.scala 14:28]
    io.Handshaking.ready <= _io_Handshaking_ready_T @[Write.scala 14:25]

