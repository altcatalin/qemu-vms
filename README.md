# QEMU Virtual Machines

Control and provision virtual machines using [Vagrant](https://developer.hashicorp.com/vagrant/docs) & [QEMU](https://www.qemu.org/docs/master/).  

## Usage on macOS

Tested on macOS Ventura 13.0.1 (x64, arm64).

### Requirements
* [QEMU](https://www.qemu.org/docs/master/): `brew install vagrant`
* [Vagrant](https://developer.hashicorp.com/vagrant/docs): `brew install vagrant`
* [Vagrant QEMU Provider](https://github.com/ppggff/vagrant-qemu): `vagrant plugin install vagrant-qemu`
* (optional) [Vagrant CLI automcompletion](https://developer.hashicorp.com/vagrant/docs/cli#autocompletion): `vagrant autocomplete install --bash --zsh`

### Usage
* prepare local **qcow2** image: `./bin/build.sh`
* create the virtual machine: `vagrant up --provider qemu`
