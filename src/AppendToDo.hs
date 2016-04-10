import System.IO

main = do
    todoItem <- getLine
    appendFile "src/files_for_stream/todo.txt" (todoItem ++ "\n")
