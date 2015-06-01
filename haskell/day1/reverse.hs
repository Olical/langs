module Main where
    rev :: [a] -> [a]
    rev [] = []
    rev (x:xs) = rev xs ++ [x]
