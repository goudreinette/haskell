module Pause where

import Control.Monad

-- So, minimal is (Run (IO (Done a))
data PauseIO a
  = Run (IO (PauseIO a))
  | Done a

lift :: IO a -> PauseIO a
lift io = Run $ fmap Done io

pause = Done ()

instance Monad PauseIO where
    return = Done
    (Run m) >>= f = Run $ fmap (>>= f) m
    (Done m) >>= f = f m

instance Functor PauseIO where
  fmap = liftM

instance Applicative PauseIO where
  pure  = return
  (<*>) = ap


main = do
  lift $ putStrLn "Step 1"
  pause
  lift $ putStrLn "Step 2"
  pause
  lift $ do
    putStrLn "Step 3"
    putStrLn "Done!"

runN :: Int -> PauseIO a -> IO (PauseIO a)
runN 0 p        = return p
runN _ (Done r) = return $ Done r
runN n (Run m)  = m >>= runN (n - 1)

fullRun :: PauseIO a -> IO a
fullRun (Done r) = return r
fullRun (Run m)  = m >>= fullRun
