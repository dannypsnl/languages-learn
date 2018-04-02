quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (p: xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
  where
    lesser = filter (< p) xs
    greater = filter (>= p) xs

main :: IO()
main = do 
  print (quicksort [3, 2, 8, 1, 9, 5, 7, 5, 4, 6, 3, 1])
