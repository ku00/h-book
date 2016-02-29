-- 5.1 カリー化関数

multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

compareWithHundred :: Int -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- 5.2 高階実演

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y

-- 5.3 関数プログラマの道具箱

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x       = x : filter' p xs
    | otherwise = filter' p xs

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) =
    let smallerOrEqual = filter' (<= x) xs
        larger = filter' (> x) xs
    in quicksort' smallerOrEqual ++ [x] ++ quicksort' larger

largestDivisible :: Integer
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0
