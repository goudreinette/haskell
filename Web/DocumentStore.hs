{-# LANGUAGE OverloadedStrings #-}
module DocumentStore where

import Control.Concurrent.STM
import Control.Monad.Trans
import Data.Map
import Data.String.Conversions
import Network.HTTP.Types      (status201)
import Web.Scotty



main = do
  store <- newTVarIO (empty :: Map Strig String)
  scotty 3000 $ do
    get "/" $ do
      current <- liftIO $ readTVarIO store
      json current

    post "/:key" $ do
      key   <- param "key"
      value <- body
      liftIO $ atomically $ modifyTVar' store $ insert key $ convertString value
      status status201
