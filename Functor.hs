module Main where

import qualified Data.Map


main :: IO ()
main = print "..."

data Tree a = Leaf a | Branch (Tree a) (Tree a)

class Functor' f where
  fmap' :: (a -> b) -> f a -> f b

instance Functor' [] where
  fmap' = map

instance Functor' Maybe where
  fmap' f (Just x) = Just (f x)
  fmap' f Nothing  = Nothing

instance Functor' (Either a) where
  fmap' f (Right a) = Right (f a)
  fmap' f (Left b)  = Left b
