require 'rspec'

require_relative '../../../lib/furi/git/git'

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

  context 'no git repository exist' do
    it 'shows nothing' do
      GitSystemCall.any_instance.stub(:git_branch).and_return('')
      Git.new.branch.should be_empty
    end
  end

  context 'one files was added, modfied and deleted' do
    before do
      @git_status =
'# On branch c-branch
# Changes not staged for commit:
#   (use "git add/rm <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   mod_file
#	deleted:    del_file
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	new_file
no changes added to commit (use "git add" and/or "git commit -a")'

    end

    it 'shows one file was added' do
      GitSystemCall.any_instance.stub(:git_status).and_return(@git_status)
      Git.new.added_files.should == '+1'
    end
  end
end