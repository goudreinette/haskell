module Lisp.Repl where

import Flow
import Lisp.Eval


main = do
  putStr "user> "
  input <- getLine
  putStrLn (eval input)
  main
