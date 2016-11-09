module Main where


main :: IO ()
main = putStrLn "Hello World"

type Stack = [Int]

pop :: Stack -> (Int, Stack)
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((), Stack)
push a xs = ((), a:xs)

stackManip stack = let
  ((), newStack1) = push 3 stack
  (a, newStack2)  = pop newStack1
  in pop newStack2
