module Main where

import           Data.List
import           System.Directory   (removeFile, renameFile)
import           System.Environment (getArgs)
import           System.IO.Strict   as S


dispatch :: [(String, [String] -> IO ())]
dispatch =  [ ("add", add)
            , ("view", view)
            , ("remove", remove)
            ]

main = do
  (command:args) <- getArgs
  let (Just action) = lookup command dispatch
  action args

-- view
view [filename] = do
  todos <- readTodos filename
  let numberedTasks = zipWith viewTodo [1..] todos
  putStr $ unlines numberedTasks

viewTodo n todo =
  show n ++ " - " ++ todo


-- add
add (filename:todo) = do
  todos <- readTodos filename
  let added = ((unwords todo):todos)
  writeTodos filename added



-- remove
remove (filename:todo) = do
  todos <- readTodos filename
  let filtered = delete (unwords todo) todos
  writeTodos filename filtered


-- read/write`
readTodos filename = do
  contents <- S.readFile filename
  return (lines contents)

writeTodos filename todos = do
  writeFile filename  (unlines todos)
