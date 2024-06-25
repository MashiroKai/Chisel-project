import chisel3._
import chisel3.util._

class Write extends Module{
val io=IO(new Bundle{
val WriteHS =Flipped(new DecoupledIO(UInt(8.W))) 
val TXE_N   = Input(Bool())
val WR_N    = Output(Bool())
val Data    = Output(UInt(8.W))
})
io.WR_N     :=   io.WriteHS.valid
io.Data     :=   io.WriteHS.bits
io.WriteHS.ready    := ~io.TXE_N
}
object Write extends App{
 (new chisel3.stage.ChiselStage).emitVerilog(new Write(), Array("--target-dir","generated"))
}