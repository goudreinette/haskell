module Shortener where

import           Control.Monad
import           Flow
import qualified System.Random as Random

alphaNum :: String
alphaNum = ['a'..'z'] ++ ['0'..'9']

randomElement :: String -> IO Char
randomElement xs = do
  let maxIndex = length xs - 1
  randomDigit <- Random.randomRIO (0, maxIndex)
  return (xs !! randomDigit)

shortyGen :: IO String
shortyGen = replicateM 7 (randomElement alphaNum)
