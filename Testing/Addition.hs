module Addition where

import           Test.QuickCheck

plusAssociative :: Int -> Int -> Int -> Bool
plusAssociative x y z =
  x + (y + z) == (x + y) + z

plusCommutative :: Int -> Int -> Bool
plusCommutative x y =
  x + y == y + x

multiplicationAssociative :: Int -> Int -> Int -> Bool
multiplicationAssociative x y z =
  x * (y * z) == (x * y) * z

multiplicationCommutative :: Int -> Int -> Bool
multiplicationCommutative x y =
  x * y == y * x



main = quickCheck multiplicationAssociative
