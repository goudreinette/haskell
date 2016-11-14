module Fractional where

type Numerator = Int
type Denominator = Int

type Fraction = (Numerator, Denominator)

add (num, denom) (num', denom') =
  let
    numerator = num * denom' + num' * denom
    denominator = denom * denom'
  in
    simplify (numerator, denominator)

simplify :: Fraction -> Fraction
simplify (numerator, denominator) =
  let
    gcd = gcd' numerator denominator
    in (numerator `quot` gcd, denominator `quot` gcd)

gcd' a 0 = a
gcd' a b = gcd' b (a `mod` b)
