require 'spec_helper'

user = ENV['USER_NAME']

# check user exist
describe command("cat /etc/passwd | grep #{user}") do
  its(:exit_status) { should eq 0 }
end

# check exist home directory
describe file("/home/#{user}") do
  it { should be_directory }
end

# check exist sudoers.d file 
describe file("/etc/sudoers.d/#{user}") do
  it { should exist }
end

# check containts sudoers.d file
describe file("/etc/sudoers.d/#{user}") do
  its(:content) { should match /^#{user} ALL=NOPASSWD: ALL$/ }
end

# check authorized_key file
describe file("/home/#{user}/.ssh/authorized_keys") do
  it { should exist }
  it { should be_mode 600 }
  it { should be_owned_by user }
  it { should be_grouped_into user }
end
