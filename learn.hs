module Learn where

addHundered :: Int -> Int
addHundered c = x + 100 where x = c

mult1 :: Int
mult1     = x * y
  where x = 5
        y = 6

printInc10 n = let plusTen = n + 10 
              in print plusTen
printInc20 n = print plus20 
              where plus20 = n + 20
printInc30 n = (\plus30 -> print plus30) (n + 30)

hello :: String
hello = "hello"

world :: String
world = "world"

area d = pi * (r * r)
  where r = d / 2

main :: IO ()
main = do 
  putStrLn $ hello ++ concat [" ", world]

-- String functions: head, tail, take, drop
--            infix: :, !!
