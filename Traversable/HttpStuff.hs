{-# LANGUAGE DeriveGeneric #-}
module HttpStuff where

import Control.Lens
import Data.Aeson
import Data.Aeson.Lens
import Data.ByteString
import Network.Wreq

urls = [ "http://httpbin.org/ip"
       , "http://httpbin.org/bytes/5"
       ]

traversedUrls = traverse get urls
