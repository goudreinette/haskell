{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
module Documents where

import Control.Monad.Trans
import Data.Aeson              hiding (json)
import Data.IORef
import Data.Map
import Data.String.Conversions
import Data.Text.Conversions
import GHC.Generics
import Web.Scotty


data Person = Person
  { firstName :: String
  , lastName  :: String
  , age       :: Int
  } deriving (Generic, FromJSON, ToJSON)

main = do
  store <- newIORef (empty :: Map Int Person)
  scotty 3000 $ do
    resource "people" Person store



resource name schema store = do
  get name $ do
    items <- liftIO $ readIORef store
    json items

  post name $ do
    body <- body
    items <- liftIO $ readIORef store
    let id'     = size items
        result = eitherDecode body :: Either String schema

    case result of
      Left error   -> do
        text $ convertText error
      Right item -> do
        liftIO $ modifyIORef' store (insert id' item)
        json item
