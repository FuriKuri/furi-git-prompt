class GitSystemCall
  def git_branch
    %x(git branch)
  end
end