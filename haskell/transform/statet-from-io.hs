import Control.Monad.Trans.State.Strict
import Control.Monad.Trans.Class
import Control.Monad

calculator :: StateT Double IO ()
calculator = do
    result <- get
    lift $ print result
    (op:input) <- lift getLine
    let opFn = case op of
                  '+' -> sAdd
                  '-' -> sMinus
                  '*' -> sTime
                  '/' -> sDivide
                  _ -> const $ return ()
    opFn $ read input
  where
    sAdd x = modify (+ x)
    sMinus x = modify (\y -> y - x)
    sTime x = modify (* x)
    sDivide x = modify (/ x)

main :: IO (a, Double)
main = runStateT (forever calculator) 0
