package main

import hello.Hello

object Main extends App {
  if (args.length <= 0) {
    println("need at least one parameter")
  }
  val greeter = new Hello
  println(greeter.greeting(args(0)))
}
