{-# LANGUAGE OverloadedStrings #-}
module Documents where

import Data.Aeson hiding (json)
import Data.IORef
import Data.Map
import Web.Scotty


resource :: (ToJSON a, FromJSON a) => String -> a -> IORef (Map a a) -> ActionM
resource name schema ref = do
  get ("/:" ++ name) $ do
    all <- liftIO $ readIORef ref
    json all
