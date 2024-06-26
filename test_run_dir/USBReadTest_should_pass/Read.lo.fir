circuit Read :
  module Read :
    input clock : Clock
    input reset : UInt<1>
    input io_Ctrl : UInt<1>
    input io_ReadHS_ready : UInt<1>
    output io_ReadHS_valid : UInt<1>
    output io_ReadHS_bits : UInt<8>
    input io_ReadIO_RXF_N : UInt<1>
    output io_ReadIO_RD_N : UInt<1>
    output io_ReadIO_OE_N : UInt<1>
    input io_ReadIO_Data : UInt<8>

    node _T = eq(io_Ctrl, UInt<1>("h0")) @[Read.scala 22:14]
    node _T_1 = eq(io_ReadIO_RXF_N, UInt<1>("h0")) @[Read.scala 22:47]
    node _T_2 = and(_T, _T_1) @[Read.scala 22:27]
    node _T_3 = eq(io_ReadHS_ready, UInt<1>("h1")) @[Read.scala 22:78]
    node _T_4 = and(_T_2, _T_3) @[Read.scala 22:59]
    node _GEN_0 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Read.scala 22:89 23:9 25:9]
    node RD = _GEN_0
    node _io_ReadIO_RD_N_T = eq(RD, UInt<1>("h0")) @[Read.scala 19:27]
    reg io_ReadIO_RD_N_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ReadIO_RD_N_REG) @[Read.scala 19:26]
    reg io_ReadHS_valid_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ReadHS_valid_REG) @[Read.scala 20:27]
    reg io_ReadHS_bits_REG : UInt<8>, clock with :
      reset => (UInt<1>("h0"), io_ReadHS_bits_REG) @[Read.scala 21:26]
    io_ReadHS_valid <= io_ReadHS_valid_REG @[Read.scala 20:17]
    io_ReadHS_bits <= io_ReadHS_bits_REG @[Read.scala 21:16]
    io_ReadIO_RD_N <= io_ReadIO_RD_N_REG @[Read.scala 19:16]
    io_ReadIO_OE_N <= io_Ctrl @[Read.scala 18:16]
    io_ReadIO_RD_N_REG <= _io_ReadIO_RD_N_T @[Read.scala 19:26]
    io_ReadHS_valid_REG <= RD @[Read.scala 20:27]
    io_ReadHS_bits_REG <= io_ReadIO_Data @[Read.scala 21:26]
