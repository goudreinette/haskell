module Main where

main = do
  int <- getInc
  print int

getInc :: IO Int
getInc = (+1) <$> read <$> getLine
