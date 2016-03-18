-- 7.2 形づくる

import Shapes

createCircle :: IO ()
createCircle = print $ nudge (baseCircle 30) 10 20

-- 7.3 レコード構文

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String } deriving (Show)

data Car = Car { company :: String
               , model :: String
               , year :: Int
               } deriving (Show)

-- 7.4 型引数

tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y}) =
    "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

dotProd :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `dotProd` (Vector l m n) = i*l + j*m + k*n

vmult :: (Num a) => Vector a -> a -> Vector a
(Vector i j k) `vmult` m = Vector (i*m) (j*m) (k*m)

-- 7.5 インスタンスの自動導出

data Person' = Person' { firstName' :: String, lastName' :: String, age' :: Int}
                deriving (Eq, Show, Read)

mikeD = Person' { firstName' = "Michael", lastName' = "Diamond", age' = 43}
adRock = Person' { firstName' = "Adam", lastName' = "Horovitz", age' = 41}
mca = Person' { firstName' = "Adam", lastName' = "Yauch", age' = 44}

mysteryDude = "Person' { firstName' = \"Michael\"" ++ ", lastName' = \"Diamond\"" ++ ", age' = 43}"

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
            deriving (Eq, Ord, Show, Read, Bounded, Enum)
