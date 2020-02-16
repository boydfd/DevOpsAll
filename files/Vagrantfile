Vagrant.configure("2") do |config|
  config.vm.provision "file", source: "vagrant", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: "fdisk.sh", destination: "/home/vagrant/fdisk.sh"
  public_key = File.read("vagrant.pub")
  config.vm.provision :shell, :inline =>"
    echo 'Copying ansible-vm public SSH Keys to the VM'
    mkdir -p /home/vagrant/.ssh
    chmod 700 /home/vagrant/.ssh
    echo '#{public_key}' >> /home/vagrant/.ssh/authorized_keys
    chmod -R 600 /home/vagrant/.ssh/authorized_keys
    echo 'Host 192.168.*.*' >> /home/vagrant/.ssh/config
    echo 'StrictHostKeyChecking no' >> /home/vagrant/.ssh/config
    echo 'UserKnownHostsFile /dev/null' >> /home/vagrant/.ssh/config
    chmod -R 600 /home/vagrant/.ssh/config
    chmod +x /home/vagrant/fdisk.sh
    mkdir -p /home/public
    /home/vagrant/fdisk.sh
    ", privileged: true

  config.vm.define "master" do |master|
    master.vm.box = "centos/8"
    master.vm.box_version = "1905.1"
    master.vm.hostname = "master"
    master.vm.network "public_network",
      bridge: "en0: Wi-Fi (Wireless)",
      ip: "192.168.0.107"
    master.disksize.size = '20GB'
    master.vm.provider "virtualbox"
    master.vm.provider :virtualbox do |v|
      v.memory = 3096
      v.cpus = 2
    end
  end

  config.vm.define "slave1" do |slave1|
    slave1.vm.box = "centos/8"
    slave1.vm.box_version = "1905.1"
    slave1.vm.hostname = "slave1"
    slave1.vm.network "public_network",
      bridge: "en0: Wi-Fi (Wireless)",
      ip: "192.168.0.108"
     slave1.disksize.size = '20GB'
    slave1.vm.provider "virtualbox"
    slave1.vm.provider :virtualbox do |v|
      v.memory = 8192
      v.cpus = 3
    end
 end


  config.vm.define "slave2" do |slave2|
    slave2.vm.box = "centos/8"
    slave2.vm.box_version = "1905.1"
    slave2.vm.hostname = "slave2"
    slave2.vm.network "public_network",
      bridge: "en0: Wi-Fi (Wireless)",
      ip: "192.168.0.109"
    slave2.disksize.size = '50GB'
    slave2.vm.provider "virtualbox"
    slave2.vm.provider :virtualbox do |v|
      v.memory = 8192
      v.cpus = 3
    end
  end

end
