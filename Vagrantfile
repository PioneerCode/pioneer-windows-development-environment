# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "Pioneer Windows 10"

  # Name of box to install with
  # config.vm.box = "windows_10_virtualbox"
  config.vm.box = "windows_10_vmware"
  
  # Communicator type
  config.vm.communicator = "winrm"  

  # Guest OS
  config.vm.guest = :windows
  config.windows.halt_timeout = 15

  # Config networks on guest.
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true

  # Admin user name and password
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"

  # VirutalBox configuration
  config.vm.provider :virtualbox do |vb, override|
    vb.gui = true
    vb.cpus = 2
    vb.memory = 8192
    vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end
  
  # VMWare Workstation configuration
  config.vm.provider :vmware_workstation do |v, override|
    v.gui = true
    v.vmx["memsize"] = 10240
    v.vmx["numvcpus"] = 2
    v.vmx['displayname'] = "SDE Development Enviroment"
    v.vmx["ethernet0.virtualDev"] = "vmxnet3"
    v.vmx["RemoteDisplay.vnc.enabled"] = "false"
    v.vmx["RemoteDisplay.vnc.port"] = "5900"
    v.vmx["scsi0.virtualDev"] = "lsisas1068"
  end

  # Execute initial provision
  config.vm.provision "shell" do |s|
    s.path = "scripts/install-iis.ps1"
  end
  config.vm.provision "shell" do |s|
    s.path = "scripts/install-chocolatey.ps1"
  end
end 