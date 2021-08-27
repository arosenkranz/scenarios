# apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager libguestfs-tools

# systemctl enable --now libvirtd
# systemctl enable --now virtlogd

# echo 1 | tee /sys/module/kvm/parameters/ignore_msrs

# modprobe kvm