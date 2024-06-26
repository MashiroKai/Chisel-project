import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class WriteTest extends AnyFlatSpec with ChiselScalatestTester {
"USBWriteTest" should "pass" in 
{ test(new Write)
.withAnnotations(Seq(WriteVcdAnnotation)) { 
dut => 
dut.io.WriteIO.TXE_N.poke(true.B)

def Writetest(data :Int,round :Int,inc :Int) = {
    //dut.clock.step()
    var temp :Int = data
    for(i <- 0 until round){
    while(!dut.io.WriteHS.ready.peekBoolean){
        dut.clock.step()
    }
    dut.io.WriteHS.bits.poke(temp.U)
    dut.io.WriteHS.valid.poke(true.B)
    dut.clock.step()
    temp = temp + inc
    }
}

val Signal = fork{
   dut.io.WriteIO.TXE_N.poke(true.B) 
   dut.clock.step(2)
   dut.io.WriteIO.TXE_N.poke(true.B)
   dut.clock.step(2) 
   dut.io.WriteIO.TXE_N.poke(false.B)
}

dut.clock.step()
dut.io.WriteIO.TXE_N.poke(false.B)
Writetest(10,5,20)
dut.clock.step(10)
Signal.join()
dut.io.WriteIO.TXE_N.poke(true.B)
dut.clock.step(10)
} }
}