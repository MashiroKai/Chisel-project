import chisel3._
import chisel3.util._
import javax.xml.crypto.Data
class USBIO_RD extends Bundle {
val RXF_N   = Input(Bool())
val RD_N    = Output(Bool())
val OE_N    = Output(Bool())
val Data    = Input(UInt(8.W))
}
class Read extends Module { 
val io = IO(new Bundle {
val Ctrl   = Input(Bool())  //High Write Low Read
val ReadHS = new DecoupledIO(UInt(8.W)) 
val ReadIO = new USBIO_RD
})

val RD  =   WireDefault(false.B)
io.ReadIO.OE_N := io.Ctrl
io.ReadIO.RD_N := RegNext(!RD)
io.ReadHS.valid := RegNext(RD)
io.ReadHS.bits := RegNext(io.ReadIO.Data)
when(io.Ctrl === false.B  &&  io.ReadIO.RXF_N === false.B && io.ReadHS.ready === true.B){
    RD  := true.B
}.otherwise{
    RD  := false.B
}
}

object Read extends App{
 (new chisel3.stage.ChiselStage).emitVerilog(new Read(), Array("--target-dir","generated"))
}