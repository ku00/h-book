import Data.Monoid
import qualified Data.Foldable as F

lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = x `compare` y
                    in if a == EQ then b else a

lengthCompare' :: String -> String -> Ordering
lengthCompare' x y = (length x `compare` length y) `mappend` (x `compare` y)

lengthCompare'' :: String -> String -> Ordering
lengthCompare'' x y = (length x `compare` length y) `mappend`
                      (vowels x `compare` vowels y) `mappend`
                      (x `compare` y)
    where vowels = length . filter (`elem` "aeiou")

data Tree a = EmptyTree | Node a (Tree a) (Tree a)
    deriving (Show)

instance F.Foldable Tree where
    foldMap f EmptyTree = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x           `mappend`
                             F.foldMap f r

testTree = Node 5
            (Node 3
              (Node 1 EmptyTree EmptyTree)
              (Node 6 EmptyTree EmptyTree)
            )
            (Node 9
              (Node 8 EmptyTree EmptyTree)
              (Node 10 EmptyTree EmptyTree)
            )
