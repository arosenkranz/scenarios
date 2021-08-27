apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager libguestfs-tools

systemctl enable --now libvirtd
systemctl enable --now virtlogd

echo 1 | tee /sys/module/kvm/parameters/ignore_msrs

modprobe kvm

docker run -it \
  --device /dev/kvm \
  -p 50922:10022 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e "DISPLAY=${DISPLAY:-:0.0}" \
  sickcodes/docker-osx:latest