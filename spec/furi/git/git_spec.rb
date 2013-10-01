require 'rspec'

require 'furi/git/git'

describe Git do

  it 'show current branch name of a git repository' do
    GitSystemCall.any_instance.stub(:git_branch).and_return('master')
    Git.new.branch.should == 'master'
  end
end