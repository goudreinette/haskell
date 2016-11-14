module Main where

main = print "..."

data Frank a b   = Frank {frankField :: b a} deriving (Show)
data Barry t k p = Barry {yabba      :: p, dabba :: t k}

-- (* -> * -> *) -> (* -> *) -> * -> *

class Tofu t where
  tofu :: j a -> t a j

instance Tofu Frank where
  tofu x = Frank x
