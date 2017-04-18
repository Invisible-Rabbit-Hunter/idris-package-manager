module Git

%include C "git.h"
%link C "git.o"

%lib C "git2"

%access private

export
init : IO Int
init = foreign FFI_C "git_libgit2_init" (IO Int)

export
shutdown : IO Int
shutdown = foreign FFI_C "git_libgit2_shutdown" (IO Int) 

export
data Repository = Repo Ptr

gitCloneResultCode : Ptr -> IO Int
gitCloneResultCode x = foreign FFI_C "git_clone_result_code_idr" (Ptr -> IO Int) x

gitCloneResultRepo : Ptr -> IO Ptr
gitCloneResultRepo x = foreign FFI_C "git_clone_result_repo_idr" (Ptr -> IO Ptr) x

gitCloneResultFree : Ptr -> IO ()
gitCloneResultFree x = foreign FFI_C "git_clone_result_free_idr" (Ptr -> IO ()) x

export
clone : (repo : String) -> (path : String) -> IO (Int, Repository)
clone repo path = do
  res <- foreign FFI_C "git_clone_idr" (String -> String -> IO Ptr) repo path
  code <- gitCloneResultCode res
  repo <- gitCloneResultRepo res
  pure (code, (Repo repo))
