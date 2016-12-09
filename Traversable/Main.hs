module Main where

import Data.Coerce
import Flow

--     map print ['a'..'z'] |> sequence
main = traverse print ['a'..'z']

--     fmap . fmap
--     maps the function over two levels of structure
newtype UserName = UserName String deriving (Eq, Show)
newtype Dollars = Dollars Int deriving (Eq, Show)

addDollars (Dollars account) (Dollars amount) =
  Dollars (account + amount)
