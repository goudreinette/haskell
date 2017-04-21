module Pause where

data Pause
    = Run (IO Pause)
    | Done

example :: Pause
example = Run $ do
  putStrLn "Let's begin"
  putStrLn "Step 1"
  return $ Run $ do
    putStrLn "Step 2"
    return $ Run $ do
      putStrLn "Step 3"
      putStrLn "Yay, we're done!"
      return Done

runN :: Int -> Pause -> IO Pause
runN 0 pause    = return Done
runN n Done     = return Done
runN n (Run io) = io >>= runN (n - 1)
