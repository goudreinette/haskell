{-# LANGUAGE OverloadedStrings #-}
module Shortener where

import           Control.Monad
import           Control.Monad.IO.Class
import           Data.Monoid
import           Data.Text.Internal.Lazy
import           Flow
import qualified System.Random           as Random
import           Web.Scotty

alphaNum :: String
alphaNum = ['a'..'z'] ++ ['0'..'9']

randomElement :: String -> IO Char
randomElement xs = do
  let maxIndex = length xs - 1
  randomDigit <- Random.randomRIO (0, maxIndex)
  return (xs !! randomDigit)

shortyGen :: IO String
shortyGen = replicateM 7 (randomElement alphaNum)


main = do
  get "/:uri" $ do
    uri <- param "uri"
    shorty <- liftIO $ pack . shortyGen
    html $ "<h1>" <>  uri <> "</h1>"
