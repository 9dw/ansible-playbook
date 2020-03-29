require 'spec_helper'

# check docker installed
describe command('dpkg -l | grep docker') do
  its(:exit_status) { should eq 0 }
end

# check docker run and enable
describe service('docker') do
  it { should be_running }
  it { should be_enabled }
end

# check docker-compose installed
describe command('dpkg -l | grep docker-compose') do
  its(:exit_status) { should eq 0 }
end

# check node-exporter container run
describe command('sudo docker ps | grep node-exporter') do
  its(:exit_status) { should eq 0 }
end
