module Type where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah

-- Num: Integral{Int, Integer}, Fractional{Float, Double, Rational, Scientific}

-- Bounded: minBound, maxBound

findBound :: String -> Int
findBound "min" = minBound :: Int
findBound "max" = maxBound :: Int

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = 
  if x == reverse x
    then True
  else
    False

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

x = (+1)
fs xs = x w
      where w = length xs

returnHead :: [a] -> a
returnHead (x:xs) = x

type Name = String
-- creates a new type alias Name of the
-- type String *not* a data declaration,
-- just a type alias declaration

-- Currying
addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5
addTen = addStuff 5
fifteen = addTen 5

nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

typicalCurriedFunction :: Integer -> Bool -> Integer
typicalCurriedFunction i b = i + (nonsense b)

uncurriedFunction :: (Integer, Bool) -> Integer
uncurriedFunction (i, b) = i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonsense b)

anonymousAndManuallyNested :: Integer -> Bool -> Integer
anonymousAndManuallyNested = \i -> \b -> i + (nonsense b)

-- uncurry f (a, b) = f a b
-- curry f a b = f (a, b)
-- curry f x = f $ fst x $ snd x -- wrong

triple x = tripleItYo x 
  where tripleItYo :: Integer -> Integer
        tripleItYo y = y * 3

main :: IO ()
main = do
  print $ findBound "min"
  print $ 6 / fromIntegral (2::Integer)
          
-- class SumRes r where 
--     sumOf :: Integer -> r

-- instance SumRes Integer where
--     sumOf = id

-- instance (Integral a, SumRes r) => SumRes (a -> r) where
--     sumOf x = sumOf . (x +) . toInteger
