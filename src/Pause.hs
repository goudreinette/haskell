module Pause where

import Control.Monad.Free

type Pause = Free IO

main :: Pause String
main = do
  liftF $ putStrLn "Step 1"  -- Free (IO ())
  pause -- Pure ()
  liftF $ putStrLn "Step 2"
  pause
  liftF $ do -- Free (IO String)
    name <- getLine
    putStrLn $ "Step 3: hello, " ++ name
    putStrLn "Done!"
    return name -- Pure String


pause :: Pause ()
pause = Pure ()

runN :: Int -> Pause a -> IO (Pause a)
runN 0 p        = return p
runN _ (Pure r) = return $ Pure r
runN n (Free m) = m >>= runN (n - 1)

fullRun :: Pause a -> IO a
fullRun (Pure r) = return r
fullRun (Free m) = m >>= fullRun
