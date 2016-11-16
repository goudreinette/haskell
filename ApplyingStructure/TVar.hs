module TVar where

import           Control.Concurrent.STM.TVar
import           Control.Monad
import           Control.Monad.STM

main = do
  tvar <- newTVarIO 0
  before <- readTVarIO tvar
  print $ "before " ++ show before

  atomically $ transaction tvar

  after <- readTVarIO tvar
  print $ "after " ++ show after

transaction :: TVar Integer -> STM ()
transaction tvar = do
  modifyTVar' tvar (+2)
  modifyTVar' tvar (*3)
