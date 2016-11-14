module WordNumber where

import           Data.List.Split
import           Flow

digitToWord digit =
  case digit of
    0 -> "zero"
    1 -> "one"
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "nine"


digits :: Int -> [Int]
digits =
  show .> map (read . return)
