module Main where
    quicksort :: (Ord a) => [a] -> [a]
    quicksort [] = []
    quicksort (x:xs) =
        let smallerSorted = quicksort [a | a <- xs, a <= x]
            biggerSorted = quicksort [a | a <- xs, a > x]
        in  smallerSorted ++ [x] ++ biggerSorted

    -- quicksortBy :: (a -> a -> Ordering) -> [a] -> [a]
    -- quicksortBy f [] = []
    -- quicksortBy f (x:xs) =
    --     let smallerSorted = quicksortBy f [a | a <- xs, f(a x)]
    --         biggerSorted = quicksortBy f [a | a <- xs, a > x]
    --     in  smallerSorted ++ [x] ++ biggerSorted
