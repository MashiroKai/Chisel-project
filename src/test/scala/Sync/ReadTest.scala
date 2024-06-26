import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class ReadTest extends AnyFlatSpec with ChiselScalatestTester {
"USBReadTest" should "pass" in 
{ test(new Read)
.withAnnotations(Seq(WriteVcdAnnotation)) { 
dut => 
def Readtest(data :Int,round :Int,inc :Int) = {
    dut.io.ReadIO.RXF_N.poke(false.B)
    dut.io.ReadHS.ready.poke(true.B)
    //dut.clock.step()
    var temp :Int = data
    for(i <- 0 until round){
    dut.io.ReadIO.Data.poke(temp.U)
    //while(!dut.io.ReadHS.valid.peekBoolean){
        dut.clock.step()
    //}
    //dut.io.ReadHS.ready.poke(false.B)
    //dut.clock.step(2)
    //dut.io.ReadHS.ready.poke(true.B)
    temp = temp + inc
    println("temp is "+temp)
    }
    dut.io.ReadIO.RXF_N.poke(true.B) 
}
dut.io.Ctrl.poke(false.B)
Readtest(10,5,10)
/*
dut.io.ReadIO.Data.poke("heb".U) 
dut.io.ReadIO.RXF_N.poke(true.B)
dut.clock.step(2)
dut.io.ReadIO.RXF_N.poke(false.B)
dut.clock.step(20)
dut.io.ReadIO.RXF_N.poke(true.B)
*/
dut.clock.step(10)
} }
}
