require 'furi/git/prompt/version'
require 'furi/git/git'

module GitPrompt
  def self.branch
    Git.new.branch
  end

  def self.version
    Furi::Git::Prompt::VERSION
  end
end
