circuit Read :
  module Read :
    input clock : Clock
    input reset : UInt<1>
    output io : { ReadHS : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, ReadIO : { flip RXF_N : UInt<1>, RD_N : UInt<1>, OE_N : UInt<1>, flip Data : UInt<8>}}

    wire RXF : UInt<1> @[Read.scala 15:17]
    reg OE : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Read.scala 16:20]
    reg RD : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Read.scala 17:20]
    node _RXF_T = not(io.ReadIO.RXF_N) @[Read.scala 18:12]
    RXF <= _RXF_T @[Read.scala 18:9]
    node _io_ReadIO_OE_N_T = not(OE) @[Read.scala 19:24]
    io.ReadIO.OE_N <= _io_ReadIO_OE_N_T @[Read.scala 19:21]
    node _io_ReadIO_RD_N_T = not(RD) @[Read.scala 20:24]
    io.ReadIO.RD_N <= _io_ReadIO_RD_N_T @[Read.scala 20:21]
    io.ReadHS.bits <= io.ReadIO.Data @[Read.scala 21:24]
    io.ReadHS.valid <= RD @[Read.scala 22:24]
    node _T = eq(RXF, UInt<1>("h1")) @[Read.scala 23:10]
    node _T_1 = eq(io.ReadHS.ready, UInt<1>("h1")) @[Read.scala 23:40]
    node _T_2 = and(_T, _T_1) @[Read.scala 23:21]
    when _T_2 : @[Read.scala 23:51]
      OE <= UInt<1>("h1") @[Read.scala 24:9]
    else :
      OE <= UInt<1>("h0") @[Read.scala 26:9]
    node _T_3 = eq(OE, UInt<1>("h1")) @[Read.scala 28:9]
    node _T_4 = eq(RXF, UInt<1>("h1")) @[Read.scala 28:29]
    node _T_5 = and(_T_3, _T_4) @[Read.scala 28:21]
    when _T_5 : @[Read.scala 28:40]
      RD <= UInt<1>("h1") @[Read.scala 29:9]
    else :
      RD <= UInt<1>("h0") @[Read.scala 31:9]

