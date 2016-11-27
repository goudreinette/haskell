;module LibraryFunctions where

import Data.Monoid

sum', product' :: (Foldable t, Num a) => t a -> a

sum' =
  foldr (+) 0

product' =
  foldr (*) 1

elem' x =
  foldr (x==) False
  where equal item _ = item == x
