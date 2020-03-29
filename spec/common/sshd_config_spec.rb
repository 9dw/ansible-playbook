require 'spec_helper'

# check content /etc/ssh/sshd_config
describe file('/etc/ssh/sshd_config') do
    its(:content) { should match /^PubkeyAuthentication yes$/ }
    its(:content) { should match /^#PasswordAuthentication no$/ }
    its(:content) { should match /^AuthorizedKeysFile/ }
end
