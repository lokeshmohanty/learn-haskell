-- file: gameOfLife.hs

main :: IO ()
main = loopDisplay (replicate 9 '-') []

readInt :: IO Int
readInt = readLn

loopDisplay xs ys = do
  createLayout xs ys
  a <- readInt
  if (a == 0)
    then do
      putStrLn "Please enter your desired start."
      putStrLn "Example: ++--++--+"
      b <- getLine
      loopDisplay b []
    else if (a <= 9 && a >= 0)
      then loopDisplay (compute xs (positions (a-1) 4)) (ys ++ [a])
      else putStrLn "Exiting..."

positions :: Int -> Int -> [Int]
positions x i =  case i of
                      1 -> if (x - 3 >= 0) then [x-3] else []
                      2 -> if (x - 1 >= 0 && (div (x-1) 3) == (div x 3)) 
                            then concat [positions x 1, [x-1]] 
                            else positions x 1
                      3 -> if (x + 1 <= 8 && (div (x+1) 3) == (div x 3)) 
                            then concat [positions x 2, [x, x+1]] 
                            else concat [positions x 2, [x]]
                      4 -> if (x + 3 <= 8) then concat [positions x 3, [x+3]] else positions x 3

toggle :: Char -> Char
toggle x = if (x == '-') then '+' else '-'

compute :: [Char] -> [Int] -> [Char]
compute xs [] = xs
compute xs (y:ys) = compute (concat [take y xs, [toggle $ xs !! y], drop (y+1) xs]) ys

-- listToString :: (Eq a, Num a) => [a] -> [Char]
-- listToString xs = map (\x -> if (x == 0) then '-' else '+') xs

createLayout :: [Char] -> [Int] -> IO ()
createLayout (a:b:c:d:e:f:g:h:i:_) xs = do
  putStrLn "##################################################"
  putStrLn "              #######################             "
  putStrLn "              ##     ##     ##     ##             "
  putStr   "              ##  "
  putStr   [a]
  putStr   "  ##  "
  putStr   [b]
  putStr   "  ##  "
  putStr   [c]
  putStrLn "  ##             "
  putStrLn "              ##     ##     ##     ##             "
  putStrLn "              #######################             "
  putStrLn "              ##     ##     ##     ##             "
  putStr   "              ##  "
  putStr   [d]
  putStr   "  ##  "
  putStr   [e]
  putStr   "  ##  "
  putStr   [f]
  putStrLn "  ##             "
  putStrLn "              ##     ##     ##     ##             "
  putStrLn "              #######################             "
  putStrLn "              ##     ##     ##     ##             "
  putStr   "              ##  "
  putStr   [g]
  putStr   "  ##  "
  putStr   [h]
  putStr   "  ##  "
  putStr   [i]
  putStrLn "  ##             "
  putStrLn "              ##     ##     ##     ##             "
  putStrLn "              #######################             "
  putStrLn "##################################################"
  putStrLn "History"
  putStrLn $ show xs
  putStrLn "##################################################"
  putStrLn "Enter a number from 1 to 9 to toggle that position.."
  putStrLn "Enter 0 to have a customized start."
  putStrLn "Enter any other number to exit."
  putStrLn "Input: "
               
