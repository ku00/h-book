import System.IO

-- main = do
--     handle <- openFile "src/files_for_stream/baabaa.txt" ReadMode
--     contents <- hGetContents handle
--     putStr contents
--     hClose handle

-- main = do
--     withFile "src/files_for_stream/baabaa.txt" ReadMode $ \handle -> do
--         contents <- hGetContents handle
--         putStr contents

main = do
    contents <- readFile "src/files_for_stream/baabaa.txt"
    putStr contents
