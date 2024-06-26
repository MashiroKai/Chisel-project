import chisel3._
import chisel3.util._

object USBTOP extends App{
 (new chisel3.stage.ChiselStage).emitVerilog(new USBTOP(), Array("--target-dir","generated"))
}

class USBTOP extends Module{
val io = IO(new Bundle{
val Ctrl   = Input(Bool())  //High Write Low Read    
val ReadHS = new DecoupledIO(UInt(8.W)) 
val ReadIO = new USBIO_RD
val WriteHS =Flipped(new DecoupledIO(UInt(8.W))) 
val WriteIO =new USBIO_WR
})
val Read_instance = Module(new Read)
val Write_instance = Module(new Write)
io.Ctrl<>Read_instance.io.Ctrl
io.ReadHS<>Read_instance.io.ReadHS
io.ReadIO<>Read_instance.io.ReadIO
io.WriteHS<>Write_instance.io.WriteHS
io.WriteIO<>Write_instance.io.WriteIO
}