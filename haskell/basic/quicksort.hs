quicksort :: Ord a => [a] -> [a]
quicksort [] = []
-- x is frist element of xs
quicksort (x: xs) = (quicksort lesser) ++ [x] ++ (quicksort greater)
  where
  -- filter a new list from xs, use lambda (< x), (>= x)
  -- at the end, combine quickSort lesser, x, quickSort greater
    lesser = filter (< x) xs
    greater = filter (>= x) xs

main :: IO()
main = do 
  print (quicksort [3, 2, 8, 1, 9, 5, 7, 5, 4, 6, 3, 1])
