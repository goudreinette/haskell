{-# LANGUAGE FlexibleInstances #-}
module Fractional where

type Numerator   = Integer
type Denominator = Integer
type Fraction    = (Numerator, Denominator)

instance Num Fraction where
  negate (num, denom) = (-num, denom)
  (-)                 = manipulate (-)
  (+)                 = manipulate (+)
  (*)                 = manipulate (*)
  fromInteger num     = (num, 1)
  abs (num, denom)    = (abs num, denom)
  signum (num, denom)
    | num < 0  = -1
    | num == 0 = 0
    | num > 0  = 1


manipulate f (num, denom) (num', denom') =
  simplify (numerator, denominator) where
    numerator = (num * denom') `f` (num' * denom)
    denominator = denom * denom'

simplify :: Fraction -> Fraction
simplify (numerator, denominator) =
  (numerator `quot` gcd', denominator `quot` gcd') where
    gcd' = gcd numerator denominator
