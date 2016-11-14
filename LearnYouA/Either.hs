module Main where

main :: IO ()
main = putStrLn "Hello World"

type Birds = Int
type Pole  = (Birds, Birds)

landLeft :: Birds -> Pole -> Either String Pole
landLeft birds (left, right)
  | left + birds < 0 = Left "Negative amount of birds!"
  | left + birds > 4 = Left "Too many birds!"
  | otherwise        = Right (left + birds, right)

landRight :: Birds -> Pole -> Either String Pole
landRight birds (left, right)
  | right + birds < 0 = Left "Negative amount of birds!"
  | right + birds > 4 = Left "Too many birds!"
  | otherwise         = Right (left, right + birds)

birdsStuff :: Pole -> Either String Pole
birdsStuff = do
  landRight 3
  landLeft 5
