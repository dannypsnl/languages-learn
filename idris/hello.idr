module Main

import Effects
import Effect.StdIO
sayHello : Eff () [STDIO]
sayHello =putStrLn "Hello World" 

main : IO()
main = run sayHello
