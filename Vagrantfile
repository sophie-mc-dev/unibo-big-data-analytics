# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Use Ubuntu 22.04 LTS (Jammy Jellyfish) as the base box
  config.vm.box = "ubuntu/jammy64"

  # Forward port 8888 for Jupyter Notebook
  config.vm.network "forwarded_port", guest: 8888, host: 8888

  # Configure a shared folder between host and guest
  config.vm.synced_folder "./notebooks", "/home/vagrant/notebooks"

  # Allocate more resources to the VM
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"  # Set memory to 4GB
    vb.cpus = 2         # Use 2 CPU cores
  end

  # Use the bootstrap script for provisioning
  config.vm.provision :shell, path: "bootstrap.sh"
end
