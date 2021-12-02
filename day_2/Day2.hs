data Instruction = 
    Forward Int
    | Down Int
    | Up Int

parse :: String -> Instruction
parse ('f':'o':'r':'w':'a':'r':'d':' ':n) = Forward (read n)
parse ('d':'o':'w':'n':' ':n) = Down (read n)
parse ('u':'p':' ': n) = Up (read n)
parse s = error $ "Unknown Instruction " ++ s


type Pos = (Int, Int) -- (Horiz, Depth)

interpret :: [Instruction] -> Pos
interpret = foldl interpret' (0, 0) where
    interpret' (x, y) (Forward n) = (x + n, y)
    interpret' (x, y) (Down n) = (x, y + n)
    interpret' (x, y) (Up n) = (x, y - n)

main :: IO ()
main = do
    input <- lines <$> readFile "input.txt"
    let instructions = parse <$> input

    let (horiz, depth) = interpret instructions
    print $ horiz * depth

    let (horiz2, depth2, aim) = interpret2 instructions
    print $ horiz2 * depth2
    
-- Part 2

type Pos2 = (Int, Int, Int) -- (Horiz, Depth, Aim)

interpret2 :: [Instruction] -> Pos2
interpret2 = foldl interpret' (0, 0, 0) where
    interpret' (x, y, a) (Forward n) = (x + n, y + a * n, a)
    interpret' (x, y, a) (Down n) = (x, y, a + n)
    interpret' (x, y, a) (Up n) = (x, y, a - n)