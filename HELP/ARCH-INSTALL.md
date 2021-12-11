# Arch Linux Installation

1. Setup time

```shell
$ timedatectl set-ntp true
```

2. Create partitions

```shell
$ fdisk /dev/sda
```

### DOS Partition Scheme
| Partition  |        Size        |
| ---------- | ------------------ |
|    BOOT    |        300M        |
|    SWAP    |       > 512M       |
|    ROOT    | Remainder of disk  |

3. Format partitions

```shell
$ mkswap /dev/SWAP_PARTITION
$ mkfs.ext4 /dev/BOOT
$ mkfs.ext4 /dev/ROOT
```

4. Mount partitions

```shell
$ swapon /dev/SWAP
$ mount /dev/ROOT /mnt
$ mkdir -p /mnt/boot
$ mount /dev/BOOT /mnt/boot
```

5. Pacstrap

```shell
$ pacstrap /mnt base base-devel linux linux-firmware vi vim
```

6. Configure fstab

```shell
$ genfstab -U /mnt >> /mnt/etc/fstab
```

7. arch-chroot

```shell
$ arch-chroot /mnt /bin/bash
```

8. Configure GRUB

```shell
$ pacman -S grub
$ grub-install /dev/sda
$ grub-mkconfig -o /boot/grub/grub.cfg
```

9. Set root password

```shell
$ passwd
```

10. Set locale

```shell
$ vim /etc/locale.gen

# /etc/locale.gen
en_US.UTF-8 UTF-8
en_US ISO-8859-1

$ locale-gen
$ vim /etc/locale.conf

# /etc/locale.conf
LANG=en_US.UTF-8
```

11. Set hostname

```shell
$ vim /etc/hostname
```

12. Set timezone

```shell
$ ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
```

13. Enable NetworkManager

```shell
$ pacman -S networkmanager
$ systemctl enable NetworkManager
```

14. Add user

```shell
$ useradd -m USER
$ usermod -aG wheel USER
$ passwd USER

$ visudo

# uncomment
%wheel ALL=(ALL) ALL
```

15. Unmount partitions

Exit from chroot environment and unmount partitions
```shell
$ exit
$ umount -R /mnt
```
