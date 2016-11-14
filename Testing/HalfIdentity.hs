module HalfIdentity where

import           Test.QuickCheck

main = quickCheck halfIdentity

halfIdentity x = x == half x * 2

half :: Float -> Float
half = (/2)
