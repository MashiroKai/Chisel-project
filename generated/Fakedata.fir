circuit Fakedata :
  module Fakedata :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip Start : UInt<1>, WriteHS : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}

    reg StateReg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[Fakedata.scala 24:23]
    node _CntValidEnable_T = eq(StateReg, UInt<1>("h1")) @[Fakedata.scala 25:35]
    node CntValidEnable = mux(_CntValidEnable_T, UInt<1>("h1"), UInt<1>("h0")) @[Fakedata.scala 25:25]
    node _CntTimeEnable_T = eq(StateReg, UInt<2>("h2")) @[Fakedata.scala 26:34]
    node CntTimeEnable = mux(_CntTimeEnable_T, UInt<1>("h1"), UInt<1>("h0")) @[Fakedata.scala 26:24]
    node _CntValid_T = eq(CntValidEnable, UInt<1>("h0")) @[Fakedata.scala 27:61]
    reg CntValid : UInt<17>, clock with :
      reset => (reset, UInt<17>("h0")) @[Fakedata.scala 18:26]
    node _CntValid_counter_T = eq(CntValid, UInt<17>("h10213")) @[Fakedata.scala 19:36]
    node _CntValid_counter_T_1 = or(_CntValid_T, _CntValid_counter_T) @[Fakedata.scala 19:25]
    node _CntValid_counter_T_2 = and(CntValidEnable, io.WriteHS.valid) @[Fakedata.scala 19:64]
    node _CntValid_counter_T_3 = add(CntValid, UInt<1>("h1")) @[Fakedata.scala 19:80]
    node _CntValid_counter_T_4 = tail(_CntValid_counter_T_3, 1) @[Fakedata.scala 19:80]
    node _CntValid_counter_T_5 = mux(_CntValid_counter_T_2, _CntValid_counter_T_4, CntValid) @[Fakedata.scala 19:57]
    node _CntValid_counter_T_6 = mux(_CntValid_counter_T_1, UInt<1>("h0"), _CntValid_counter_T_5) @[Fakedata.scala 19:19]
    CntValid <= _CntValid_counter_T_6 @[Fakedata.scala 19:13]
    node _CntTime_T = eq(CntTimeEnable, UInt<1>("h0")) @[Fakedata.scala 28:49]
    reg CntTime : UInt<26>, clock with :
      reset => (reset, UInt<26>("h0")) @[Fakedata.scala 18:26]
    node _CntTime_counter_T = eq(CntTime, UInt<26>("h3938700")) @[Fakedata.scala 19:36]
    node _CntTime_counter_T_1 = or(_CntTime_T, _CntTime_counter_T) @[Fakedata.scala 19:25]
    node _CntTime_counter_T_2 = and(CntTimeEnable, UInt<1>("h1")) @[Fakedata.scala 19:64]
    node _CntTime_counter_T_3 = add(CntTime, UInt<1>("h1")) @[Fakedata.scala 19:80]
    node _CntTime_counter_T_4 = tail(_CntTime_counter_T_3, 1) @[Fakedata.scala 19:80]
    node _CntTime_counter_T_5 = mux(_CntTime_counter_T_2, _CntTime_counter_T_4, CntTime) @[Fakedata.scala 19:57]
    node _CntTime_counter_T_6 = mux(_CntTime_counter_T_1, UInt<1>("h0"), _CntTime_counter_T_5) @[Fakedata.scala 19:19]
    CntTime <= _CntTime_counter_T_6 @[Fakedata.scala 19:13]
    io.WriteHS.valid <= UInt<1>("h0") @[Fakedata.scala 29:18]
    io.WriteHS.bits <= CntValid @[Fakedata.scala 30:17]
    node _T = asUInt(UInt<1>("h0")) @[Fakedata.scala 33:17]
    node _T_1 = asUInt(StateReg) @[Fakedata.scala 33:17]
    node _T_2 = eq(_T, _T_1) @[Fakedata.scala 33:17]
    when _T_2 : @[Fakedata.scala 33:17]
      when io.Start : @[Fakedata.scala 35:23]
        StateReg <= UInt<1>("h1") @[Fakedata.scala 35:33]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[Fakedata.scala 33:17]
      node _T_4 = asUInt(StateReg) @[Fakedata.scala 33:17]
      node _T_5 = eq(_T_3, _T_4) @[Fakedata.scala 33:17]
      when _T_5 : @[Fakedata.scala 33:17]
        when io.WriteHS.ready : @[Fakedata.scala 38:32]
          io.WriteHS.valid <= UInt<1>("h1") @[Fakedata.scala 39:30]
          io.WriteHS.bits <= CntValid @[Fakedata.scala 40:29]
        else :
          io.WriteHS.valid <= UInt<1>("h0") @[Fakedata.scala 42:30]
          io.WriteHS.bits <= CntValid @[Fakedata.scala 43:29]
        node _T_6 = eq(CntValid, UInt<17>("h10213")) @[Fakedata.scala 45:23]
        when _T_6 : @[Fakedata.scala 45:39]
          StateReg <= UInt<2>("h2") @[Fakedata.scala 46:22]
        else :
          node _T_7 = eq(io.Start, UInt<1>("h0")) @[Fakedata.scala 47:20]
          when _T_7 : @[Fakedata.scala 47:30]
            StateReg <= UInt<1>("h0") @[Fakedata.scala 48:22]
      else :
        node _T_8 = asUInt(UInt<2>("h2")) @[Fakedata.scala 33:17]
        node _T_9 = asUInt(StateReg) @[Fakedata.scala 33:17]
        node _T_10 = eq(_T_8, _T_9) @[Fakedata.scala 33:17]
        when _T_10 : @[Fakedata.scala 33:17]
          node _T_11 = eq(CntTime, UInt<26>("h3938700")) @[Fakedata.scala 52:22]
          when _T_11 : @[Fakedata.scala 52:37]
            StateReg <= UInt<1>("h1") @[Fakedata.scala 53:22]
          else :
            node _T_12 = eq(io.Start, UInt<1>("h0")) @[Fakedata.scala 54:20]
            when _T_12 : @[Fakedata.scala 54:30]
              StateReg <= UInt<1>("h0") @[Fakedata.scala 55:22]

