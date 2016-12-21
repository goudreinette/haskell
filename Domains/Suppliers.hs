module Suppliers where

newtype SNO = SNO Int deriving (Eq, Show)
newtype PNO = PNO Int deriving (Eq, Show)


data Supplier = Supplier
  { sno   :: SNO
  , sname :: String
  , scity :: String
  }

data Product = Product
  { pno   :: PNO
  , pname :: String
  }
