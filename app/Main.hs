module Main where
import Data.Char
import Control.Monad

main :: IO ()
main = do
  {-
  putStrLn "Hello, what's your first name?"
  firstName <- getLine
  putStrLn "And what's your surname?"
  lastName <- getLine
  let bigFirst = map toUpper firstName
      bigLast = map toUpper lastName
  putStrLn ("Hello " ++ bigFirst ++ " " ++ bigLast ++ ". Nice to meet you.")
  putStrLn "Watch me reverse some words!"
  -}
  {-
  line <- getLine
  if null line
    then return ()
    else do
      putStrLn $ reverseWords line
      main
  
reverseWords :: String -> String
reverseWords = unwords . map reverse .words -}
  {-
  print True
  print 2
  print "haha!"
  print 3.2
  print [3,4,33]
  {- notice that print "haha!" returns the string with the ""
  because it's actually just putStrLn . show - so most people
  use it for everything bar strings -}
  -}
  {-
  c <- getChar
  if c /= ' '
    then do
      putChar c
      main
    else return ()
  {- that is the same as:
  c <- getChar
  when c /= ' ' do
    putChar c
    main -}
  -}
  
  {-a <- getLine
  b <- getLine
  c <- getLine
  print [a,b,c]
  -- is the same as:
  rs <- sequence [getLine, getLine, getLine]
  print rs -}

  {- sequence (map print [1,2,3]) grabs a list of IO actions and turns them into one
     it does the IO action and returns a list of whatever the return would be - which
     is fine on ghci but not fine to be compiled.
     mapM print [1,2,3] is the same thing. but mapM_ drops the list of `return ()`
     so can be used in compiled progs. -}
  -- mapM_ print [1,2,3]
  
  {- forever is useful for an infinite loop eg game loop etc
  -- main = forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l -}

  {-contents <- getContents
  putStr (shortLinesOnly contents)-}
  interact shortLinesOnly -- bind an input, do a String->String, then put the output

shortLinesOnly :: String -> String
shortLinesOnly input =
  let allLines = lines input
      shortLines = filter (\l -> length l < 10) allLines
      result = unlines shortLines
  in  result
