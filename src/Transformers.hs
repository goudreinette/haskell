module Transformers where

import Control.Monad (ap, liftM)

newtype MaybeT m a =
    MaybeT  { runMaybeT :: m (Maybe a) }

instance Monad m => Functor (MaybeT m) where
  fmap = liftM

instance  Monad m => Applicative (MaybeT m) where
  pure  = return
  (<*>) = ap

instance Monad m => Monad (MaybeT m) where
    return x =  MaybeT $ return $ Just x
    x >>= f = MaybeT $ do
        maybe_value <- runMaybeT x
        case maybe_value of
            Nothing    -> return Nothing
            Just value -> runMaybeT $ f value
