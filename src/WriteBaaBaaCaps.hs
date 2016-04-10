import System.IO
import Data.Char

main = do
    contents <- readFile "src/files_for_stream/baabaa.txt"
    writeFile "src/files_for_stream/baabaacaps.txt" (map toUpper contents)
