module Main where
x::Int
x = 2
z::Int
z = x + 1 -- z = 3

res = let y = 2
          k = z -- k = 3
      in y * k -- 6

main::IO()
main = do
  print z
  print res
