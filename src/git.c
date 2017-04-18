#include "git.h"


int git_clone_result_code_idr(git_clone_result *res)
{
  return res->code;
}
git_repository *git_clone_result_repo_idr(git_clone_result *res)
{
  return res->repo;
}

void git_clone_result_free_idr(git_clone_result *res)
{
  free(res);
}

git_clone_result *git_clone_idr(char *remote, char *local)
{
  git_clone_result* res = malloc(sizeof(git_clone_result));

  res->code = git_clone(&res->repo, remote, local, NULL);

  return res;
}
