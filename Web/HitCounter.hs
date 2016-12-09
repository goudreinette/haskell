{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Concurrent.STM
import Control.Concurrent.STM.TVar
import Control.Monad
import Control.Monad.Trans
import Data.Text.Conversions
import Flow
import Web.Scotty



main = do
  hits <- newTVarIO 0
  scotty 3000 $ do
    get "/" $ do
      liftIO $ atomically $ modifyTVar' hits succ
      hits <- liftIO $ readTVarIO hits
      "<h1>Hits: " ++  show hits ++ " me up!</h1>" |> convertText  |> html
