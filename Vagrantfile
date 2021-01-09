# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "ubuntu/focal64"

  config.vm.synced_folder ".", "/project"
  # config.vm.synced_folder "~/.ssh", "/home/vagrant/.ssh", mount_options: ["ro"]
  config.vm.synced_folder "~/.git", "/home/vagrant/.git", mount_options: ["ro"]
  config.vm.synced_folder "~/Downloads", "/mnt/Downloads", mount_options: ["ro"]

  config.vm.provision "file", source: "~/.gitconfig", destination: "/home/vagrant/.gitconfig"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "/home/vagrant/.ssh/"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/"

  config.vm.hostname = "skillbox.local"
  config.vm.network "private_network", ip: "192.168.100.13", hostname: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.name = "skillbox"
    vb.memory = "4096"
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y python3-pip
    (cd /project; make provision)
  SHELL
end
