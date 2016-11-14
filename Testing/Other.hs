module Other where

import           Test.QuickCheck

-- False
powerAssociative =
  2 ^ (3 ^ 2) == (2 ^ 3) ^ 2

-- False
powerCommutative =
  3 ^ 2 == 2 ^ 3

-- True
reverseIdentity :: [Int] -> Bool
reverseIdentity x =
  (reverse . reverse) x == id x

application :: (Int -> Int) -> Int -> Bool
application f a =
  (f $ a) == f a

main = verboseCheck (application succ)
