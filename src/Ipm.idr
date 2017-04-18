module Ipm

import Git as Git
import System

namespace Main
  main : IO ()
  main = do
    Git.init
    Git.clone "https://github.com/rmccue/test-repository.git" "./test-repository"
    putStrLn "Cloned!"
    Git.shutdown
    pure ()