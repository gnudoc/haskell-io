import Data.Char

main :: IO ()
main = do
  contents <- getContents
  putStr (shortOnly contents)

shortOnly :: String -> String
shortOnly = unlines . filter (\l -> length l < 10) . lines
