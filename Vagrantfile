require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.host_name = "modules-berkshelf"

  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box"

  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "minitest-handler"
    chef.add_recipe "modules::default"
    chef.add_recipe "modules::source"
  end
end
