require_relative 'git_system_call'

class Git
  def initialize
    @git_system = GitSystemCall.new
  end

  def added_files
    status = @git_system.git_status
    block_type = :none
    added_files_counter = 0
    if status.empty?
      ''
    else
      status.each_line do |line|
        if block_type == :none
          if line.include? '# Untracked files:'
            block_type = :untracked_files
          end
        elsif block_type == :untracked_files
          added_files_counter += 1 if line.match(/#\s[\d\w]+/i)
        end
      end
      '+' + added_files_counter.to_s
    end
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