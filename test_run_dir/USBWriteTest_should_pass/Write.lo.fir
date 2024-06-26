circuit Write :
  module Write :
    input clock : Clock
    input reset : UInt<1>
    output io_WriteHS_ready : UInt<1>
    input io_WriteHS_valid : UInt<1>
    input io_WriteHS_bits : UInt<8>
    input io_WriteIO_TXE_N : UInt<1>
    output io_WriteIO_WR_N : UInt<1>
    output io_WriteIO_Data : UInt<8>

    node _io_WriteIO_WR_N_T = not(io_WriteIO_TXE_N) @[Write.scala 14:48]
    node _io_WriteIO_WR_N_T_1 = and(io_WriteHS_valid, _io_WriteIO_WR_N_T) @[Write.scala 14:45]
    node _io_WriteIO_WR_N_T_2 = not(_io_WriteIO_WR_N_T_1) @[Write.scala 14:26]
    node _io_WriteHS_ready_T = not(io_WriteIO_TXE_N) @[Write.scala 16:32]
    reg io_WriteHS_ready_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_WriteHS_ready_REG) @[Write.scala 16:31]
    io_WriteHS_ready <= io_WriteHS_ready_REG @[Write.scala 16:21]
    io_WriteIO_WR_N <= _io_WriteIO_WR_N_T_2 @[Write.scala 14:21]
    io_WriteIO_Data <= io_WriteHS_bits @[Write.scala 15:21]
    io_WriteHS_ready_REG <= _io_WriteHS_ready_T @[Write.scala 16:31]
