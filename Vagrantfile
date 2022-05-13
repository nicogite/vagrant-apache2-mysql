Vagrant.configure("2") do |config|
 
  config.vm.define "db-server" do |db|
      db.vm.box = "ubuntu/xenial64"
      db.vm.network "forwarded_port", guest: 3306, host: 3306
      db.vm.network "forwarded_port", guest: 80, host: 8306
      db.vm.network :private_network, ip: '192.168.56.20'
      db.vm.provision "shell", path: "scripts/db-bootstrap.sh"
      db.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
      end
  end

  config.vm.define "apache-server" do |db|
      db.vm.box = "ubuntu/xenial64"
      db.vm.synced_folder "src/", "/var/www/html"
      db.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
      db.vm.provision "shell", path: "scripts/apache-bootstrap.sh"
      db.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
      end
  end

end