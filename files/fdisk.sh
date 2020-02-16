cat << EOF | fdisk /dev/sda
n
p



w
EOF
partprobe /dev/sda
mkfs.ext4 /dev/sda2
mount /dev/sda2 /home/public
