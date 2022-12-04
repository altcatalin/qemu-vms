# QEMU Virtual Machines

Control and provision virtual machines using [Vagrant](https://developer.hashicorp.com/vagrant/docs) & [QEMU](https://www.qemu.org/docs/master/).  

## Usage on macOS

Tested on macOS Ventura 13.0.1 (x64, arm64).

### Requirements
* [QEMU](https://www.qemu.org/docs/master/): `brew install vagrant`
* [Vagrant](https://developer.hashicorp.com/vagrant/docs): `brew install vagrant`
* [Vagrant QEMU Provider](https://github.com/ppggff/vagrant-qemu): `vagrant plugin install vagrant-qemu`
* (optional) [Vagrant CLI automcompletion](https://developer.hashicorp.com/vagrant/docs/cli#autocompletion): `vagrant autocomplete install --bash --zsh`

### arm64

Download Parallels box [bento/ubuntu-20.04-arm64](https://app.vagrantup.com/bento/boxes/ubuntu-20.04-arm64) and convert the disk image to `qcow2` format ([more info](https://github.com/ppggff/vagrant-qemu/wiki/Use-Parallels-Box)):
* `vagrant box add bento/ubuntu-20.04-arm64`
* `find ~/.vagrant.d -name '*.hds'`
* `qemu-img convert -c -f parallels -O qcow2 HDS_ABSOLUTE_PATH boxes/ubuntu-20.04-arm64.qcow2`

Create and configure the virtual machine:
* `vagrant up --provider qemu`
