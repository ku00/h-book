import System.IO
import System.Directory
import Data.List
import Control.Exception

main = do
    contents <- readFile "src/files_for_stream/todo.txt"
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStrLn "These are your TO-DO items:"
    mapM_ putStrLn numberedTasks
    putStrLn "Which one do you want to delete?"
    numberString <- getLine
    let number = read numberString
        newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
    -- (tempName, tempHandle) <- openTempFile "src/files_for_stream" "temp"
    -- hPutStr tempHandle newTodoItems
    -- hClose tempHandle
    -- removeFile "src/files_for_stream/todo.txt"
    -- renameFile tempName "src/files_for_stream/todo.txt"
    bracketOnError (openTempFile "src/files_for_stream" "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)

        (\(tempName, tempHandle) -> do
            hPutStr tempHandle newTodoItems
            hClose tempHandle
            removeFile "src/files_for_stream/todo.txt"
            renameFile tempName "src/files_for_stream/todo.txt")
