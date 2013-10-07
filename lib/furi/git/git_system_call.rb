require 'open3'

class GitSystemCall
  def git_branch
    stdout_str, stdout_err, status = Open3.capture3('git branch')
    if status.exitstatus == 0
      stdout_str
    else
      stdout_err
    end
  end
end