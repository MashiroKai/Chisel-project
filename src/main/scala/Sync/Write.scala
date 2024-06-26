import chisel3._
import chisel3.util._
class USBIO_WR extends Bundle{
val TXE_N   = Input(Bool())
val WR_N    = Output(Bool())
val Data    = Output(UInt(8.W))
}

class Write extends Module{
val io=IO(new Bundle{
val WriteHS =Flipped(new DecoupledIO(UInt(8.W))) 
val WriteIO =new(USBIO_WR)
})
io.WriteIO.WR_N     :=   ~(io.WriteHS.valid && ~io.WriteIO.TXE_N)
io.WriteIO.Data     :=   io.WriteHS.bits
io.WriteHS.ready    := RegNext(~io.WriteIO.TXE_N)
}
object Write extends App{
 (new chisel3.stage.ChiselStage).emitVerilog(new Write(), Array("--target-dir","generated"))
}