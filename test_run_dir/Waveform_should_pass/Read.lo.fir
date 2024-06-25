circuit Read :
  module Read :
    input clock : Clock
    input reset : UInt<1>
    input io_ReadHS_ready : UInt<1>
    output io_ReadHS_valid : UInt<1>
    output io_ReadHS_bits : UInt<8>
    input io_RXF_N : UInt<1>
    output io_OE_N : UInt<1>
    output io_RD_N : UInt<1>
    input io_Data : UInt<8>

    reg OE : UInt<1>, clock with :
      reset => (UInt<1>("h0"), OE) @[Read.scala 14:20]
    reg RD : UInt<1>, clock with :
      reset => (UInt<1>("h0"), RD) @[Read.scala 15:20]
    node _RXF_T = not(io_RXF_N) @[Read.scala 16:12]
    node _io_OE_N_T = not(OE) @[Read.scala 17:17]
    node _io_RD_N_T = not(RD) @[Read.scala 18:17]
    node RXF = _RXF_T @[Read.scala 13:17 16:9]
    node _T = eq(RXF, UInt<1>("h1")) @[Read.scala 21:10]
    node _T_1 = eq(io_ReadHS_ready, UInt<1>("h1")) @[Read.scala 21:40]
    node _T_2 = and(_T, _T_1) @[Read.scala 21:21]
    node _GEN_0 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Read.scala 21:51 22:9 24:9]
    node _T_3 = eq(OE, UInt<1>("h1")) @[Read.scala 26:9]
    node _T_4 = eq(RXF, UInt<1>("h1")) @[Read.scala 26:29]
    node _T_5 = and(_T_3, _T_4) @[Read.scala 26:21]
    node _GEN_1 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Read.scala 26:40 27:9 29:9]
    io_ReadHS_valid <= RD @[Read.scala 20:24]
    io_ReadHS_bits <= io_Data @[Read.scala 19:24]
    io_OE_N <= _io_OE_N_T @[Read.scala 17:14]
    io_RD_N <= _io_RD_N_T @[Read.scala 18:14]
    OE <= mux(reset, UInt<1>("h0"), _GEN_0) @[Read.scala 14:{20,20}]
    RD <= mux(reset, UInt<1>("h0"), _GEN_1) @[Read.scala 15:{20,20}]
