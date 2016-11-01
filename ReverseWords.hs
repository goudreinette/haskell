module Main where

infixr 0 |>

(|>) :: a -> (a -> b) -> b
(|>) = flip ($)

main :: IO ()
main = do
  line <- getLine
  if null line
    then return ()
    else do
      print reverseWords line
      main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
