vagrant_cwd = File.dirname(__FILE__)

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "qemu" do |qe, override|
    qe.image_path = "#{vagrant_cwd}/boxes/ubuntu-20.04-arm64.qcow2"
  end

end
