require 'rspec'

require 'furi/git/git'

describe Git do
  it 'shows the current branch name of a git repository' do
    GitSystemCall.any_instance.stub(:git_branch).and_return('* master')
    Git.new.branch.should == 'master'
  end

  context 'more than one git repository exist' do
    it 'shows the current branch name of a git repository if branch is first item in list' do
      GitSystemCall.any_instance.stub(:git_branch).and_return("* master\n  sec branch\n  third branch")
      Git.new.branch.should == 'master'
    end

    it 'shows the current branch name of a git repository if branch is second item in list' do
      GitSystemCall.any_instance.stub(:git_branch).and_return("  sec branch\n * master\n  third branch")
      Git.new.branch.should == 'master'
    end

    it 'shows the current branch name of a git repository if branch is last item in list' do
      GitSystemCall.any_instance.stub(:git_branch).and_return("  sec branch\n  third branch\n * master")
      Git.new.branch.should == 'master'
    end
  end

end