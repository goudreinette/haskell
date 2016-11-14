{-# LANGUAGE FlexibleInstances #-}
module Fractional where

type Numerator = Integer
type Denominator = Integer
type Fraction = (Numerator, Denominator)

instance Num Fraction where
  negate (num, denom) = (-num, denom)
  (+)                 = manipulate (+)
  (*)                 = manipulate (*)
  fromInteger num     = (num, 1)
  abs (num, denom)    = (abs num, denom)

manipulate f (num, denom) (num', denom') =
  simplify (numerator, denominator) where
    numerator = (num * denom') `f` (num' * denom)
    denominator = denom * denom'

simplify :: Fraction -> Fraction
simplify (numerator, denominator) =
  (numerator `quot` gcd', denominator `quot` gcd') where
    gcd' = gcd numerator denominator
