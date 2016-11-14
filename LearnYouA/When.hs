module Main where

import           Control.Monad

main :: IO ()
main = do
  c <- getChar
  when (c /= ' ') $ do
    putChar c
    main
