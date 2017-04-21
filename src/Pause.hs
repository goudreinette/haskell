module Pause where

data PausableIO
    = Run (IO PausableIO)
    | Done

example :: PausableIO
example = Run $ do
  putStrLn "Let's begin"
  putStrLn "Step 1"
  return $ Run $ do
    putStrLn "Step 2"
    return $ Run $ do
      putStrLn "Step 3"
      putStrLn "Yay, we're done!"
      return Done

runN :: Int -> PausableIO -> IO PausableIO
runN 0 _        = return Done
runN _ Done     = return Done
runN n (Run io) = io >>= runN (n - 1)

fullRun :: PausableIO -> IO ()
fullRun Done     = return ()
fullRun (Run io) = io >>= fullRun
