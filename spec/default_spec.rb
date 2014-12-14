require 'spec_helper'

describe 'hostsfile::default' do
  #let(:chef_run) { ChefSpec::ChefRunner.new.converge 'hostsfile::default' }

  let(:entry) { double('entry') }
  
  it 'Populate /etc/hosts from node definition' do
    Entry.stub(:new).and_return(entry)
    chef_run = ChefSpec::ChefRunner.new
    chef_run.node.set[:hostsfile] = {
      "127.0.1.1" => {
        "hostname" => "dummy-host",
        "aliases" => [ "dummy-alias", "another-alias" ]
      }
    }
    chef_run.converge 'hostsfile::default'

    #runner = expect(chef_run)
  end
end
