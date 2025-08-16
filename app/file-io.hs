import System.IO
import Data.Char

main = do
  handle <- openFile "brillig.txt" ReadMode
  contents <- hGetContents handle
  putStr contents
  hClose handle

  withFile "brillig.txt" ReadMode
      (\handle -> do
          contents <- hGetContents handle
          putStr contents)
  -- hGetLine, hPutStr, hPutStrLn, hGetChar are analogous to the version
  -- without h, except they use a file handle instead of stdin and stdout

  contents <- readFile "brillig.txt"
  putStr contents

  contents <- readFile "brillig.txt"
  writeFile "brilligCAPS.txt" (map toUpper contents)

  putStrLn "Enter a todo item: "
  todoItem <- getLine
  appendFile "todo.txt" (todoItem ++ "\n")
  withFile "todo.txt" ReadMode
      (\handle -> do
          contents <- hGetContents handle
          putStr contents)
  
