import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ReadTest extends AnyFlatSpec with ChiselScalatestTester {
"USBReadTest" should "pass" in 
{ test(new ReadTestTop)
.withAnnotations(Seq(WriteVcdAnnotation)) { 
dut => 
def Check(data : Int) = {
dut.io.ReadIO.OE_N.expect(false.B)
dut.clock.step()
dut.io.ReadIO.RD_N.expect(false.B)
dut.io.ReadHS.bits(data.U)
dut.io.ReadHS.valid(true.B)
}

dut.io.ReadIO.RXF_N.poke(true.B)
dut.clock.step(2)
dut.io.ReadIO.RXF_N.poke(false.B)
Check(0)
dut.clock.step(20)
dut.io.ReadIO.RXF_N.poke(true.B)
dut.clock.step(10)
} }
}
