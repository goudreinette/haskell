module Newtype where

newtype Dollars = Dollars Int deriving (Eq, Show)

addDollars (Dollars account) (Dollars amount) =
  Dollars (account + amount)
