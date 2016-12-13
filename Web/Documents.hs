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
    get "/people" $ do
      people <- getPeople store
      json people
    post "/person/" $ do
      body <- body
      people <- getPeople store
      let id'     = size people
          result = eitherDecode body :: Either String Person

      case result of
        Left error   -> do
          text $ convertText error
        Right person -> do
          liftIO $ modifyIORef' store (insert id' person)
          json person




getPeople store =
  liftIO $ readIORef store
