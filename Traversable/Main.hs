module Main where

import Data.Coerce
import Flow

--     map print ['a'..'z'] |> sequence
main = traverse print ['a'..'z']

--     fmap . fmap
--     maps the function over two levels of structure

data Query   = Query
data SomeObj = SomeObj
data Err     = Err

decodeFn :: String -> Either Err SomeObj
decodeFn = undefined
