class GitSystemCall
  def git_branch
    %x(git branch 2> /dev/null)
  end
end