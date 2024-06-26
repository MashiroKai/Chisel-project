circuit USBTOP :
  module Read :
    input clock : Clock
    input reset : Reset
    output io : { flip Ctrl : UInt<1>, ReadHS : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, ReadIO : { flip RXF_N : UInt<1>, RD_N : UInt<1>, OE_N : UInt<1>, flip Data : UInt<8>}}

    wire RD : UInt<1>
    RD <= UInt<1>("h0")
    io.ReadIO.OE_N <= io.Ctrl @[Read.scala 18:16]
    node _io_ReadIO_RD_N_T = eq(RD, UInt<1>("h0")) @[Read.scala 19:27]
    reg io_ReadIO_RD_N_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ReadIO_RD_N_REG) @[Read.scala 19:26]
    io_ReadIO_RD_N_REG <= _io_ReadIO_RD_N_T @[Read.scala 19:26]
    io.ReadIO.RD_N <= io_ReadIO_RD_N_REG @[Read.scala 19:16]
    reg io_ReadHS_valid_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ReadHS_valid_REG) @[Read.scala 20:27]
    io_ReadHS_valid_REG <= RD @[Read.scala 20:27]
    io.ReadHS.valid <= io_ReadHS_valid_REG @[Read.scala 20:17]
    reg io_ReadHS_bits_REG : UInt, clock with :
      reset => (UInt<1>("h0"), io_ReadHS_bits_REG) @[Read.scala 21:26]
    io_ReadHS_bits_REG <= io.ReadIO.Data @[Read.scala 21:26]
    io.ReadHS.bits <= io_ReadHS_bits_REG @[Read.scala 21:16]
    node _T = eq(io.Ctrl, UInt<1>("h0")) @[Read.scala 22:14]
    node _T_1 = eq(io.ReadIO.RXF_N, UInt<1>("h0")) @[Read.scala 22:47]
    node _T_2 = and(_T, _T_1) @[Read.scala 22:27]
    node _T_3 = eq(io.ReadHS.ready, UInt<1>("h1")) @[Read.scala 22:78]
    node _T_4 = and(_T_2, _T_3) @[Read.scala 22:59]
    when _T_4 : @[Read.scala 22:89]
      RD <= UInt<1>("h1") @[Read.scala 23:9]
    else :
      RD <= UInt<1>("h0") @[Read.scala 25:9]

  module Write :
    input clock : Clock
    input reset : Reset
    output io : { flip WriteHS : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, WriteIO : { flip TXE_N : UInt<1>, WR_N : UInt<1>, Data : UInt<8>}}

    node _io_WriteIO_WR_N_T = not(io.WriteIO.TXE_N) @[Write.scala 14:48]
    node _io_WriteIO_WR_N_T_1 = and(io.WriteHS.valid, _io_WriteIO_WR_N_T) @[Write.scala 14:45]
    node _io_WriteIO_WR_N_T_2 = not(_io_WriteIO_WR_N_T_1) @[Write.scala 14:26]
    io.WriteIO.WR_N <= _io_WriteIO_WR_N_T_2 @[Write.scala 14:21]
    io.WriteIO.Data <= io.WriteHS.bits @[Write.scala 15:21]
    node _io_WriteHS_ready_T = not(io.WriteIO.TXE_N) @[Write.scala 16:32]
    reg io_WriteHS_ready_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_WriteHS_ready_REG) @[Write.scala 16:31]
    io_WriteHS_ready_REG <= _io_WriteHS_ready_T @[Write.scala 16:31]
    io.WriteHS.ready <= io_WriteHS_ready_REG @[Write.scala 16:21]

  module USBTOP :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip Ctrl : UInt<1>, ReadHS : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, ReadIO : { flip RXF_N : UInt<1>, RD_N : UInt<1>, OE_N : UInt<1>, flip Data : UInt<8>}, flip WriteHS : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, WriteIO : { flip TXE_N : UInt<1>, WR_N : UInt<1>, Data : UInt<8>}}

    inst Read_instance of Read @[USBTOP.scala 16:27]
    Read_instance.clock <= clock
    Read_instance.reset <= reset
    inst Write_instance of Write @[USBTOP.scala 17:28]
    Write_instance.clock <= clock
    Write_instance.reset <= reset
    Read_instance.io.Ctrl <= io.Ctrl @[USBTOP.scala 18:8]
    io.ReadHS.bits <= Read_instance.io.ReadHS.bits @[USBTOP.scala 19:10]
    io.ReadHS.valid <= Read_instance.io.ReadHS.valid @[USBTOP.scala 19:10]
    Read_instance.io.ReadHS.ready <= io.ReadHS.ready @[USBTOP.scala 19:10]
    Read_instance.io.ReadIO.Data <= io.ReadIO.Data @[USBTOP.scala 20:10]
    io.ReadIO.OE_N <= Read_instance.io.ReadIO.OE_N @[USBTOP.scala 20:10]
    io.ReadIO.RD_N <= Read_instance.io.ReadIO.RD_N @[USBTOP.scala 20:10]
    Read_instance.io.ReadIO.RXF_N <= io.ReadIO.RXF_N @[USBTOP.scala 20:10]
    Write_instance.io.WriteHS <= io.WriteHS @[USBTOP.scala 21:11]
    io.WriteIO.Data <= Write_instance.io.WriteIO.Data @[USBTOP.scala 22:11]
    io.WriteIO.WR_N <= Write_instance.io.WriteIO.WR_N @[USBTOP.scala 22:11]
    Write_instance.io.WriteIO.TXE_N <= io.WriteIO.TXE_N @[USBTOP.scala 22:11]

