# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "bento/ubuntu-20.04"
PUBLIC_KEY = File.read(File.expand_path("~/.ssh/id_rsa.pub")).strip

Vagrant.configure("2") do |config|
    config.vm.box = BOX_IMAGE
    
    config.vm.provider "virtualbox" do |v|
        v.memory = "512"
        v.cpus = 1
    end
    
    config.vm.provision "shell", inline: <<-SHELL
        echo "#{PUBLIC_KEY}" >> /home/vagrant/.ssh/authorized_keys
        apt-get update
        apt-get -y upgrade
        apt-get -y autoremove
        apt-get install -y vim
    SHELL

    config.vm.define "server" do |subconfig|
        subconfig.vm.hostname = "server"
    
        subconfig.vm.network "private_network", ip: "10.0.0.101"
    
        subconfig.vm.provider "virtualbox" do |v|
            v.name = "server"
        end
    end
    
    config.vm.define "bd" do |subconfig|
        subconfig.vm.hostname = "bd"

    	subconfig.vm.network "private_network", ip: "10.0.0.102"

        subconfig.vm.provider "virtualbox" do |v|
            v.name = "bd"
        end
    end
end