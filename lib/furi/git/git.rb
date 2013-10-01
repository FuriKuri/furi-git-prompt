require_relative 'git_system_call'

class Git
  def initialize
    @git_system = GitSystemCall.new
  end

  def branch
    @git_system.git_branch
  end
end