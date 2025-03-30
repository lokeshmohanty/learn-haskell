-- file: LearnHaskell/solveGame1.hs

data Element = Element [(String, Int)] Int
  deriving Show

main :: IO ()
main = do
    putStrLn "Enter the starting position. Example: +++---+++."
    s <- getLine
    print $ loop [createElement (take 9 s, 0) []] []

loop :: [Element] -> [String] -> [(String, Int)]
loop ((Element x@(("+++++++++", _):ss) _):_) _ = x
loop ((x@(Element ss h)):xs) ys = loop (sortQueue $ concat [nextList ss ys, xs]) (fst (head ss):ys)
loop [] _ = []

nextList :: [(String, Int)] -> [String] -> [Element]
nextList [] _ = []
nextList xs@(s:ss) ys = map (`createElement` xs) (filter (f ys)  [(nextMove i (fst s), i)| i<-[1..9]])
  where f xs (s, y) = not (elem s xs)

createElement :: (String, Int) -> [(String, Int)] -> Element
createElement x xs = Element (x:xs) (heuristic x + (length xs))
  where  heuristic = length . (filter (=='-').fst)

sortQueue :: [Element] -> [Element]
sortQueue [] = []
sortQueue (e@(Element s x):xs) = concat [sortQueue lessThanList, [e], sortQueue greaterThanList]
  where lessThanList    = filter (f x) xs where f x (Element xs y) = x >= y
        greaterThanList = filter (f x) xs where f x (Element xs y) = x < y


-- From game1.hs
-- Used to find the next possible moves

nextMove :: Int -> String -> String
nextMove a xs = compute xs (positions (a-1) 4)

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
