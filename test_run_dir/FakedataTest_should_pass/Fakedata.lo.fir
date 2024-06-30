circuit Fakedata :
  module Fakedata :
    input clock : Clock
    input reset : UInt<1>
    input io_Start : UInt<1>
    input io_WriteHS_ready : UInt<1>
    output io_WriteHS_valid : UInt<1>
    output io_WriteHS_bits : UInt<8>

    reg StateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), StateReg) @[Fakedata.scala 24:23]
    node _CntValidEnable_T = eq(StateReg, UInt<1>("h1")) @[Fakedata.scala 25:35]
    node CntValidEnable = mux(_CntValidEnable_T, UInt<1>("h1"), UInt<1>("h0")) @[Fakedata.scala 25:25]
    node _CntTimeEnable_T = eq(StateReg, UInt<2>("h2")) @[Fakedata.scala 26:34]
    node CntTimeEnable = mux(_CntTimeEnable_T, UInt<1>("h1"), UInt<1>("h0")) @[Fakedata.scala 26:24]
    node _CntValid_T = eq(CntValidEnable, UInt<1>("h0")) @[Fakedata.scala 27:61]
    reg CntValid : UInt<3>, clock with :
      reset => (UInt<1>("h0"), CntValid) @[Fakedata.scala 18:26]
    node _CntValid_counter_T = eq(CntValid, UInt<3>("h5")) @[Fakedata.scala 19:36]
    node _CntValid_counter_T_1 = or(_CntValid_T, _CntValid_counter_T) @[Fakedata.scala 19:25]
    node _CntValid_counter_T_2 = and(CntValidEnable, io_WriteHS_valid) @[Fakedata.scala 19:64]
    node _CntValid_counter_T_3 = add(CntValid, UInt<1>("h1")) @[Fakedata.scala 19:80]
    node _CntValid_counter_T_4 = tail(_CntValid_counter_T_3, 1) @[Fakedata.scala 19:80]
    node _CntValid_counter_T_5 = mux(_CntValid_counter_T_2, _CntValid_counter_T_4, CntValid) @[Fakedata.scala 19:57]
    node _CntValid_counter_T_6 = mux(_CntValid_counter_T_1, UInt<1>("h0"), _CntValid_counter_T_5) @[Fakedata.scala 19:19]
    node _CntTime_T = eq(CntTimeEnable, UInt<1>("h0")) @[Fakedata.scala 28:49]
    reg CntTime : UInt<4>, clock with :
      reset => (UInt<1>("h0"), CntTime) @[Fakedata.scala 18:26]
    node _CntTime_counter_T = eq(CntTime, UInt<4>("ha")) @[Fakedata.scala 19:36]
    node _CntTime_counter_T_1 = or(_CntTime_T, _CntTime_counter_T) @[Fakedata.scala 19:25]
    node _CntTime_counter_T_2 = and(CntTimeEnable, UInt<1>("h1")) @[Fakedata.scala 19:64]
    node _CntTime_counter_T_3 = add(CntTime, UInt<1>("h1")) @[Fakedata.scala 19:80]
    node _CntTime_counter_T_4 = tail(_CntTime_counter_T_3, 1) @[Fakedata.scala 19:80]
    node _CntTime_counter_T_5 = mux(_CntTime_counter_T_2, _CntTime_counter_T_4, CntTime) @[Fakedata.scala 19:57]
    node _CntTime_counter_T_6 = mux(_CntTime_counter_T_1, UInt<1>("h0"), _CntTime_counter_T_5) @[Fakedata.scala 19:19]
    node _T = asUInt(UInt<1>("h0")) @[Fakedata.scala 33:17]
    node _T_1 = asUInt(StateReg) @[Fakedata.scala 33:17]
    node _T_2 = eq(_T, _T_1) @[Fakedata.scala 33:17]
    node _GEN_0 = mux(io_Start, UInt<1>("h1"), StateReg) @[Fakedata.scala 24:23 35:{23,33}]
    node _T_3 = asUInt(UInt<1>("h1")) @[Fakedata.scala 33:17]
    node _T_4 = asUInt(StateReg) @[Fakedata.scala 33:17]
    node _T_5 = eq(_T_3, _T_4) @[Fakedata.scala 33:17]
    node _GEN_1 = mux(io_WriteHS_ready, UInt<1>("h1"), UInt<1>("h0")) @[Fakedata.scala 38:32 39:30 42:30]
    node _GEN_2 = mux(io_WriteHS_ready, CntValid, CntValid) @[Fakedata.scala 38:32 40:29 43:29]
    node _T_6 = eq(CntValid, UInt<3>("h5")) @[Fakedata.scala 45:23]
    node _T_7 = eq(io_Start, UInt<1>("h0")) @[Fakedata.scala 47:20]
    node _GEN_3 = mux(_T_7, UInt<1>("h0"), StateReg) @[Fakedata.scala 47:30 48:22 24:23]
    node _GEN_4 = mux(_T_6, UInt<2>("h2"), _GEN_3) @[Fakedata.scala 45:39 46:22]
    node _T_8 = asUInt(UInt<2>("h2")) @[Fakedata.scala 33:17]
    node _T_9 = asUInt(StateReg) @[Fakedata.scala 33:17]
    node _T_10 = eq(_T_8, _T_9) @[Fakedata.scala 33:17]
    node _T_11 = eq(CntTime, UInt<4>("ha")) @[Fakedata.scala 52:22]
    node _T_12 = eq(io_Start, UInt<1>("h0")) @[Fakedata.scala 54:20]
    node _GEN_5 = mux(_T_12, UInt<1>("h0"), StateReg) @[Fakedata.scala 54:30 55:22 24:23]
    node _GEN_6 = mux(_T_11, UInt<1>("h1"), _GEN_5) @[Fakedata.scala 52:37 53:22]
    node _GEN_7 = mux(_T_10, _GEN_6, StateReg) @[Fakedata.scala 33:17 24:23]
    node _GEN_8 = mux(_T_5, _GEN_1, UInt<1>("h0")) @[Fakedata.scala 33:17 29:18]
    node _GEN_9 = mux(_T_5, _GEN_2, CntValid) @[Fakedata.scala 30:17 33:17]
    node _GEN_10 = mux(_T_5, _GEN_4, _GEN_7) @[Fakedata.scala 33:17]
    node _GEN_11 = mux(_T_2, _GEN_0, _GEN_10) @[Fakedata.scala 33:17]
    node _GEN_12 = mux(_T_2, UInt<1>("h0"), _GEN_8) @[Fakedata.scala 33:17 29:18]
    node _GEN_13 = mux(_T_2, CntValid, _GEN_9) @[Fakedata.scala 30:17 33:17]
    io_WriteHS_valid <= _GEN_12
    io_WriteHS_bits <= pad(_GEN_13, 8)
    StateReg <= mux(reset, UInt<1>("h0"), _GEN_11) @[Fakedata.scala 24:{23,23}]
    CntValid <= mux(reset, UInt<3>("h0"), _CntValid_counter_T_6) @[Fakedata.scala 18:{26,26} 19:13]
    CntTime <= mux(reset, UInt<4>("h0"), _CntTime_counter_T_6) @[Fakedata.scala 18:{26,26} 19:13]
