import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class FakedataTest extends AnyFlatSpec with ChiselScalatestTester {
"FakedataTest" should "pass" in 
{ test(new Fakedata) 
.withAnnotations(Seq(WriteVcdAnnotation)) { 
dut => 
dut.io.Start.poke(true.B)
dut.io.WriteHS.ready.poke(true.B)
dut.clock.step(30)
    }
  }
}