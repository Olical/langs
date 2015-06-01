module Main where
    table :: [Integer] -> [(Integer, Integer, Integer)]
    table xs = [(x, y, x * y) | x <- xs, y <- xs]
