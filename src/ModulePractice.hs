import Data.List

-- 6.1 モジュールをインポートする
numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- 6.2 標準モジュールの関数で問題を解く
wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words
