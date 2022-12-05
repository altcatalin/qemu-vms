vagrant_cwd = File.dirname(__FILE__)

def is_arm64()
  `uname -m` == "arm64" || `/usr/bin/arch -64 sh -c "sysctl -in sysctl.proc_translated"`.strip() == "0"
end

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define :lfs207 do |foo|
  end

  config.vm.provider "qemu" do |qe, override|
    if is_arm64()
      qe.image_path = "#{vagrant_cwd}/boxes/bento-ubuntu-20.04-arm64.qcow2"
    else
      qe.image_path = "#{vagrant_cwd}/boxes/bento-ubuntu-20.04-amd64.qcow2"
      qe.arch = "x86_64"
      qe.machine = "q35"
      qe.cpu = "max"
      qe.net_device = "virtio-net-pci"
      qe.qemu_dir = "/usr/local/share/qemu"
    end
  end

  config.vm.provision "packages", type: "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y build-essential
  SHELL

  config.vm.provision "file", source: "scripts", destination: "scripts"

  config.vm.provision "scripts", type: "shell", privileged: false, inline: <<-SHELL
    cd ~/scripts/labs/17.2 && gcc -o wastemem wastemem.c && chmod +x wastemem
  SHELL

end
