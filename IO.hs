module Main where

import           Data.Char


main :: IO ()
main = do
  print "What's your first name?"
  firstName <- getLine
  print "What's your last name?"
  lastName  <- getLine
  let mapToUpper   = map toUpper
      bigFirstName = mapToUpper firstName
      bigLastName  = mapToUpper lastName

  print $ "Hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"
