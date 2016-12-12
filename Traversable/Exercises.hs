module Exercises where

import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

-- Identity
newtype Identity a = Identity a
  deriving (Eq, Ord, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity (f x)

instance Foldable Identity where
  foldMap f (Identity x) = f x

instance Traversable Identity where
  traverse f (Identity x) =  Identity <$> f x

-- Constant
newtype Constant a b =
  Constant { getConstant :: a }

instance Functor (Constant a) where
  fmap f x = x
