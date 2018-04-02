myLast :: [a] -> a
myLast [] = error "No end in parameter list"
myLast [x] = x
myLast (_: xs) = last xs

main :: IO()
main = do
  -- expected 4
  print (myLast [1, 2, 3, 4])
