#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <git2.h>

typedef struct git_clone_result {
  int code;
  git_repository *repo;
} git_clone_result;

int git_clone_result_code_idr(git_clone_result *res);

git_repository *git_clone_result_repo_idr(git_clone_result *res);

void git_clone_result_free_idr(git_clone_result *res);

git_clone_result *git_clone_idr(char *remote, char *local);