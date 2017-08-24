# Pioneer Code Windows Development Environment With [Packer](https://www.packer.io), [Vagrant](https://www.vagrantup.com/), and [Chocolatey](https://chocolatey.org/)

## Overview

A general development environment for Windows.  It is also worth noting that [I](https://github.com/chad-ramos) use this on a daily basis, including on the job. 

### Who is this for?

* Tired of messing up your PC with outdated assets that degrade over time?
* Tired of the amount of time it takes for you to set up a new dev environment?
* Prefer some modern-day comforts such as configurable, reproducible and portable environments.

If you answered yes to any of these questions, then this workflow might be for you.

## Setup

On your local machine, run the following from an elevated command prompt.  Do not run these commands from a PowerShell prompt. 

Install Chocolatey
```cmd
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```

Install Vagrant
```bash
cinst vagrant -y
```

Install Git
```bash
cinst git.install -y
```
### Virtualization

#### VirtualBox
**Free** - You need to install this even if you plan on using [VMware Workstation](https://www.vmware.com/products/workstation)
```bash
cinst virtualbox -y
```

#### VMWare
**Not Free** - VirtualBox works great.  If you prefer [VMware Workstation](https://www.vmware.com/products/workstation), you also need to secure the [Vagrant + VMware](https://www.vagrantup.com/vmware/) plugin.

```bash 
cinst vmwareworkstation -y
```

Clone repo.

```bash
git clone https://github.com/PioneerCode/pioneer-windows-development-environment.git
```

## Vagrant Box

[Vagrant](https://www.vagrantup.com/) requires [Boxes](https://www.vagrantup.com/docs/boxes.html). If you don't already have a Windows Box, there are a few different ways you can get one.

* Make your own from scratch.
  * There are plenty of tutorials available [online](http://lmgtfy.com/?q=vagrant%2C+create+a+windows+box).
* Make your own using [Packer](https://www.packer.io/intro/getting-started/vagrant.html).
  * [Packer](https://www.packer.io/intro/getting-started/vagrant.html) is widely used and made by the same people who make Vagrant.
  * [Joe Fitzgerald's](https://twitter.com/joefitzgerald?lang=en) [repo](https://github.com/joefitzgerald/packer-windows) is highly recommended and takes a lot of guess-work out of the process.
    * It is highly recommended that you build your Windows boxes with **winrm** instead of **ssh**.  Long story short, this solves a lot of know issues with Vagrant and Windows communicating with each other.
    * That being said, if you are using packer to build your box and more specifically [Joe Fitzgerald's](https://twitter.com/joefitzgerald?lang=en) [repo](https://github.com/joefitzgerald/packer-windows), I recommend you use the branch that has the necessary adjustments to implement winrm.  
      * [jg/switch-to-winrm](https://github.com/joefitzgerald/packer-windows/tree/jf/switch-to-winrm) 
* Use one that is available from the [community](https://atlas.hashicorp.com/boxes/search).

Once you have secured your box, navigate to it.
```bash
cd {path-to-box}
```

Add your Box to Vagrant
```bash
vagrant box add {name-of-box} {path-to-box.box} 
```

Verify your Box is in Vagrant
```bash
vagrant box list
```

## Vagrantfile

In the pioneer-windows-development-environment repo, there is a file called [Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/). Open it up and ensure the following line matches the name you provided above.
```ruby
config.vm.box = {name-of-box}
```
## Provision
Depending on what you want to be installed coming out of the gates, you might want to take a quick look at the provision scripts located in the [scripts folder](https://github.com/PioneerCode/pioneer-windows-development-environment/tree/master/scripts). Most of what is needed for our entire stack is already configured inside these files.  That being said, you might have some personal preferences.  Open each up to take a quick look and make any adjustments you see fit.

Typically, you would want to at least open up **install-programs.ps1** and select the appropriate version of Visual Studio to be installed.  As a default, Visual Studio 2017 Enterprise edition is provisioned. 

### When to run scripts
Some people will want to run scripts as provisions of ```vagrant up```, others might want to move the script files to their new VM and run them at will.  By default, the [Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/) is set to run a few scripts that I know I will always need to be run.  If you prefer, you can comment those provision out and uncomment the "file" provision.  The "file" provision will instead move the scripts to the ```c:\users\vagrant\documents\script```.  This will allow you to run them whenever you see fit.

## Run
Depending on your environment, run one of the following.  Default == VirtualBox. 

```bash
vagrant up
```
```bash
vagrant up --provider vmware_workstation
```
```bash
vagrant up --provider vmware_fusion
```
```bash
vagrant up --provider hyperv
```

This will configure and create, if not already done, a guest machine for you.  Depending on what you are installing, this will take anywhere from a minute (empty guest) to about 30 mins (default provisions) to complete.

## Know Issues
* SQL Server Managemnt Studio might not install.
  * Sometimes need to re-run ```cinst -y  sql-server-management-studio``` after the initial provision.
