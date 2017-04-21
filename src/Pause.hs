module Pause where

data Pause
    = Run (IO Pause)
    | Done

example :: Pause
example = Run $ do
  putStrLn "Let's begin"
  putStrLn "Step 1"
  pause $ do
    putStrLn "Step 2"
    pause $ do
      putStrLn "Step 3"
      putStrLn "Yay, we're done!"
      done

runN :: Int -> Pause -> IO Pause
runN 0 _        = return Done
runN _ Done     = return Done
runN n (Run io) = io >>= runN (n - 1)

fullRun :: Pause -> IO ()
fullRun Done     = return ()
fullRun (Run io) = io >>= fullRun

pause :: IO Pause -> IO Pause
pause = return . Run

done :: IO Pause
done = return Done
