require 'open3'

class GitSystemCall
  def git_branch
    call 'git branch'
  end

  def git_status
    call 'git status'
  end

  private
  def call(command)
    stdout_str, stdout_err, status = Open3.capture3(command)
    if status.exitstatus == 0
      stdout_str
    else
      ''
    end
  end
end