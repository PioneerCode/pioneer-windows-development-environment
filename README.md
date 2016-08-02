# Pioneer Code Development Environment With [Packer](https://www.packer.io), [Vagrant](https://www.vagrantup.com/) and [Chocolatey](https://chocolatey.org/)

## Overview

A general development environment for Windows.  It is also worth noting that [I](https://github.com/chad-ramos) use this on daily bases, including on the job. 

### Who is this for?

* Tired of messing up your PC with outdated assets that degrade over time?
* Tired of the amount of time it takes for you to setup a new dev environment?
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

#### VirtualBox
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
  * Joe Fitzgerald's [repo](https://github.com/joefitzgerald/packer-windows) is highly recommended and takes a lot of guess-work out of the process.
* Use one that is available from the [community](https://atlas.hashicorp.com/boxes/search).
* Ask another member of your team for one. 

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
Depending on what you want to be installed coming out of the gates, you might want to take a quick look at the following provision scripts.
* install-iis.ps1
* install-programs.ps1

Most of what is needed for our entire stack is already configured inside these files.  That being said, you might have some personal preferences.  Open each up to take a quick look and make any adjustments you see fit.

Typically, you would want to at least open up **install-programs.ps1** and select the appropriate version of Visual Studio to be installed.  As a default, Visual Studio 2015 Enterprise edition is provisioned. 

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

This will configure and create, if not already done, a guest machine for you.  Depending on what you are installing, this will take anywhere from a minute (empty guest) to about 30 mins (default provisions) to complete.
## TODO
* Parametrize ```config.vm.box```
* Include automated update script in "setup"
* Add SQL Server 2016 once it passes moderation by Chocolatey mods.
* Add provisions post **install-programs.ps1**
  * Blocked - [https://github.com/mitchellh/vagrant/issues/7526](https://github.com/mitchellh/vagrant/issues/7526)

## Know Issues
* Chocolatey and WinRM Bug not allowing provisions after the script that installs Chocolatey.
* SQL Server Management Studio might not install.
  * Sometimes need to re-run ```cinst -y  sql-server-management-studio``` after the initial provision.
