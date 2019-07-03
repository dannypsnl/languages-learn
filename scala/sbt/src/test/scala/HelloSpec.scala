import hello.Hello

import org.scalatest._

class HelloSpec extends FlatSpec {
  val greeter = new Hello
  "greeter" should "be polite" in {
    assert(greeter.greeting("Danny") == "hello, Danny")
  }
}
