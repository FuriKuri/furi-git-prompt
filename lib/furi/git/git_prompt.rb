require_relative 'prompt/version'
require_relative 'git'

module GitPrompt
  def self.branch
    Git.new.branch
  end

  def self.version
    Furi::Git::Prompt::VERSION
  end
end
