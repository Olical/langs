module Main where
    combos :: [[Char]] -> [([Char], [Char])]
    combos [] = []
    combos xs = [(x, y) | x <- xs, y <- xs, x < y]

    colours = combos ["black", "white", "blue", "yellow", "red"]
