require 'rspec'

require_relative '../../../lib/furi/git/prompt'

describe Prompt do

  it 'show current branch name of a git repository' do
    GitSystemCall.any_instance.stub(:git_branch).and_return('master')
    Prompt.new.branch.should == 'master'
  end
end