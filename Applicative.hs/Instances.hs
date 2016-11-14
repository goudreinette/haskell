module Instances where

instance Applicative [] where
  pure a = [a]
