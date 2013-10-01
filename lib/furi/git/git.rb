require 'furi/git/git_system_call'

class Git
  def initialize
    @git_system = GitSystemCall.new
  end

  def branch
    git_branch_match = @git_system.git_branch.match(/\* ([^\s.]*)/i)
    if git_branch_match
      git_branch_match.captures[0]
    else
      ''
    end
  end
end