{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid             (mconcat)
import qualified Data.Text.Internal.Lazy as T
import           Web.Scotty

main = scotty 3000 $ do
    get "/:word" $ do
        html $ ("<h1>Scotty</h1>")
