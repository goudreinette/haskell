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
  Constant { getConstant :: a } deriving (Eq, Ord, Show)

instance Functor (Constant a) where
  fmap _ (Constant x) = Constant x

instance Foldable (Constant a) where
  foldr _ x (Constant _) = x

instance Traversable (Constant a) where
  traverse _ (Constant x) = pure $ Constant x

-- Maybe
data Option a = None | Some a
  deriving (Eq, Ord, Show)

instance Functor Option where
  fmap _ None     = None
  fmap f (Some a) = Some (f a)

instance Foldable Option where
  foldr f z (Some a) = f a z
  foldr _ z  None    = z

instance Traversable Option where
  traverse f (Some a) = Some <$> f a
  traverse _  None    = pure None

-- List
data List a
  = Nil
  | Cons a (List a)
  deriving (Eq, Show, Ord)

instance Functor List where
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)
  fmap _  Nil        = Nil

instance Foldable List where
  foldr f z (Cons x xs) = f x (foldr f z xs)
  foldr f z  Nil        = z
