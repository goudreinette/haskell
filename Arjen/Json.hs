module Json where

import           Data.List.Split
import           Flow


data Expression
  = Expression String Value
  deriving (Eq, Show)

data Value
  = Float
  | String
  | Bool
  | JsonObject
  | JsonArray
  deriving (Eq, Show)

data Token
  = ObjectStart
  | ObjectEnd
  | ArrayStart
  | ArrayEnd
  | Quote
  | Colon
  | Null
  | True'
  | False'
  | Any String
  deriving (Eq, Show)


tokenize string =
  tokens
  where
    tokens = split' string |> filter (/= "") |> map match

split' string = lines string
  >>= words
  >>= split (dropInnerBlanks (oneOf "\",{}:[]"))
  >>= splitOn "null"
  >>= splitOn "true"
  >>= splitOn "false"

match char =
  case char of
    "\""    -> Quote
    "{"     -> ObjectStart
    "}"     -> ObjectEnd
    "["     -> ArrayStart
    ":"     -> Colon
    "]"     -> ArrayEnd
    "true"  -> True'
    "false" -> False'
    _       -> Any char
