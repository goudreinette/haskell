module Pause where

import Control.Monad.Free

type Pause = Free

main :: Pause IO String
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


pause :: Pause m ()
pause = Pure ()

runN :: Monad m => Int -> Pause m a -> m (Pause m a)
runN 0 p        = return p
runN _ (Pure r) = return $ Pure r
runN n (Free m) = m >>= runN (n - 1)

fullRun :: Monad m => Pause m a -> m a
fullRun (Pure r) = return r
fullRun (Free m) = m >>= fullRun
