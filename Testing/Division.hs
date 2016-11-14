module Division where

import           Test.QuickCheck

quotRem' :: Int -> Int -> Bool
quotRem' x y =
  (x `quot` y) * y + (x `rem` y) == x

main = quickCheck quotRem'
