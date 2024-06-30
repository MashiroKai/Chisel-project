import chisel3._
import chisel3.util._
//import circt.stage.ChiselStage
import chisel3.experimental.ChiselEnum
import javax.xml.crypto.Data


class Fakedata extends Module {
val io = IO(new Bundle{
val Start = Input(Bool())
val WriteHS = new DecoupledIO(UInt(8.W))
})
object State extends ChiselEnum {
        val Idel,Send, Wait  = Value
}
import State._
def CNT (Enable : Bool , Maxium : Int ,Clock: Bool, Clear : Bool) = {
    val counter = RegInit(0.U(unsignedBitLength(Maxium).W))
    counter := Mux(Clear||(counter === Maxium.U),0.U,Mux(Enable&&Clock,counter +1.U,counter))
    counter
}
val BytesNum = 66067 // 66048 bytes
val WaitTime = 60000000
val StateReg = RegInit(Idel)
val CntValidEnable = Mux(StateReg === Send , true.B , false.B)
val CntTimeEnable = Mux(StateReg === Wait , true.B , false.B)
val CntValid = CNT(CntValidEnable,BytesNum,io.WriteHS.valid,!CntValidEnable)
val CntTime = CNT(CntTimeEnable,WaitTime,true.B,!CntTimeEnable)
io.WriteHS.valid := false.B
io.WriteHS.bits := CntValid


switch(StateReg){
    is(Idel){
        when(io.Start){StateReg := Send}
    }
    is(Send){
        when(io.WriteHS.ready) {
            io.WriteHS.valid := true.B
            io.WriteHS.bits := CntValid
        }.otherwise{
            io.WriteHS.valid := false.B
            io.WriteHS.bits := CntValid
        }
        when(CntValid === BytesNum.U) {
            StateReg := Wait
        }.elsewhen(!io.Start){
            StateReg := Idel
        }
    }
    is(Wait){
        when(CntTime === WaitTime.U){
            StateReg := Send
        }.elsewhen(!io.Start){
            StateReg := Idel
        }
    }
}
}
object Fakedata extends App{
 (new chisel3.stage.ChiselStage).emitVerilog(new Fakedata(), Array("--target-dir","generated"))
}