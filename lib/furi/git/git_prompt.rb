require_relative 'prompt/version'
require_relative 'git'

module GitPrompt
  def self.version
    Furi::Git::Prompt::VERSION
  end

  def self.branch
    Git.new.branch
  end

  def self.added_files
    Git.new.added_files
  end
end
