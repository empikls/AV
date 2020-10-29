

Vagrant.configure("2") do |config|
  config.vm.define "web", primary: true do |web|
    web.vm.box = "generic/ubuntu1804"
    web.vm.hostname = 'web'
    web.vm.network :private_network, ip: "192.168.56.101"
    web.vm.network :forwarded_port, guest: 22, host: 10102, id: "ssh"
      web.vm.provision "ansible" do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.playbook = "provisioning/playbook.yaml"
        ansible.inventory_path = "provisioning/inventory"
        ansible.become = true
      end
    web.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "web"]
    end
    end

  config.vm.define "doc" do |doc|
    doc.vm.box = "generic/ubuntu1804"
    doc.vm.hostname = 'doc'
    doc.vm.network :forwarded_port, guest: 22, host: 10222, id: "ssh"
    doc.vm.network :private_network, ip: "192.168.56.102"
    # doc.vm.provision "shell",
    #   run: "always",
    #   inline: "route add default gw 192.168.56.101"
      doc.vm.provision "ansible" do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.playbook = "provisioning/playbook.yaml"
        ansible.inventory_path = "provisioning/inventory"
        ansible.become = true
      end
    doc.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "doc"]
    end
  end

end


