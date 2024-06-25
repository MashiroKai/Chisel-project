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
val ReadHS = new DecoupledIO(UInt(8.W)) 
val ReadIO = new USBIO_RD
})
val RXF =   Wire(Bool())
val OE  =   RegInit(false.B)
val RD  =   RegInit(false.B)
    RXF := ~io.ReadIO.RXF_N
    io.ReadIO.OE_N  := ~OE
    io.ReadIO.RD_N  := ~RD 
    io.ReadHS.bits     :=  io.ReadIO.Data
    io.ReadHS.valid    :=  RD
when(RXF === true.B &&io.ReadHS.ready  === true.B){
    OE  :=  true.B
}.otherwise{
    OE  :=  false.B
}
when(OE === true.B  &&  RXF === true.B){
    RD  := true.B
}.otherwise{
    RD  := false.B
}
}

class ReadTestTop extends Module{
val io=IO(new Bundle{
val ReadHS =Flipped(new DecoupledIO(UInt(8.W)))
val ReadIO = Flipped(new USBIO_RD)
})
val Read_dut = Module (new Read)
io.ReadHS <> Read_dut.io.ReadHS
io.ReadIO <> Read_dut.io.ReadIO
when(io.ReadIO.RD_N === false.B){
    io.ReadIO.Data := io.ReadIO.Data + 1.U
}
when(io.ReadHS.valid){
    io.ReadHS.ready := false.B
    io.ReadHS.ready := RegNext(RegNext(RegNext(true.B)))
}
}
object ReadTestTop extends App{
 (new chisel3.stage.ChiselStage).emitVerilog(new ReadTestTop(), Array("--target-dir","generated"))
}