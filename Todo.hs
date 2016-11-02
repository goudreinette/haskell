module Main where

import           Data.List
import           System.Directory   (removeFile, renameFile)
import           System.Environment (getArgs)
import           System.IO


dispatch :: [(String, [String] -> IO ())]
dispatch =  [ ("add", view)
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
add [filename, todo] = do
  todos <- readTodos filename
  let added = (todo:todos)
  writeTodos filename added



-- remove
remove [filename, todo] = do
  todos <- readTodos filename
  let filtered = delete todo todos
  writeTodos filename filtered


-- read/write
readTodos filename = do
  contents <- readFile filename
  return (lines contents)

writeTodos filename todos = do
  let tempfile = ('_' : filename)
  writeFile tempfile  (unlines todos)
  removeFile filename
  renameFile tempfile filename
