# Nexus 👾

## WiFi 📶

[](https://www.linuxbabe.com/command-line/ubuntu-server-16-04-wifi-wpa-supplicant)

```console
$ apt install wpasupplicant

$ wpa_passphrase <SSID> <PASSWORD> | sudo tee /etc/wpa_supplicant.conf
$ cp /lib/systemd/system/wpa_supplicant.service /etc/systemd/system/wpa_supplicant.service

# /etc/systemd/system/wpa_supplicant.service
ExecStart=/sbin/wpa_supplicant -u -s -c /etc/wpa_supplicant.conf -i <INTERFACE>
Restart=always

# Comment out
#Alias=dbus-fi.w1.wpa_supplicant1.service

$ systemctl enable wpa_supplicant.service

# /etc/systemd/system/dhclient.service
[Unit]
s Description= DHCP Client
Before=network.target

[Service]
Type=forking
ExecStart=/sbin/dhclient <INTERFACE> -v
ExecStop=/sbin/dhclient <INTERFACE> -r
Restart=always

[Install]
WantedBy=multi-user.target

$ systemctl enable dhclient.service

# /etc/dhcp/dhclient.conf
interface "wlo1" {
     send dhcp-requested-address 192.168.1.XXX;
}

$ systemctl restart dhclient
```

```console
$ apt install network-manager
$ nmtui
```

## Set up automatic updates 🔄

```console
$ apt install unattended-upgrades
$ dpkg-reconfigure --priority=low unattended-upgrades
```

## Turn off display 🖥️

```console
# /etc/default/grub
GRUB_CMDLINE_LINUX="consoleblank=300"

$ update-grub
```

## Set up SSH 🔐

```console
$ apt install openssh-server
$ systemctl enable ssh
$ systemctl start ssh

# /etc/ssh/sshd_config
PermitRootLogin yes
PasswordAuthentication yes

$ systemctl restart sshd
```

# Dynamic DNS ⏩

[FreeDNS - Free DNS - Dynamic DNS - Static DNS subdomain and domain hosting](https://freedns.afraid.org/)

```console
$ apt install ddclient
```

## Wireguard 🐲

[Set up your own VPN at home with Raspberry Pi](https://notthebe.ee/raspi.html)

[WireGuard Tools - Configuration Generator](https://www.wireguardconfig.com/)

```console
$ apt install wireguard
$ apt install wireguard-dkms
$ apt install iptables

# /etc/wireguard/wg0.conf
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820
PrivateKey = <PRIVATE KEY>
PostUp = iptables -A FORWARD -i wlo1 -o wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o wlo1 -j MASQUERADE;
PostDown = iptables -D FORWARD -i wlo1 -o wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o wlo1 -j MASQUERADE;

[Peer]
PublicKey = <PUBLIC KEY>
AllowedIPs = 10.0.0.2/32

# /etc/sysctl.conf
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1

$ sysctl -p
$ echo 1 > /proc/sys/net/ipv4/ip_forward

$ wg-quick up wg0
$ systemctl enable wg-quick@wg0.service
```

## LAMP 🪔

```console
# Linux
$ uname -a
Linux nexus 4.19.0-17-amd64 #1 SMP Debian 4.19.194-3 (2021-07-18) x86_64 GNU/Linux

# Apache
$ apt install apache2
$ systemctl enable apache2

# MySQL
$ apt install mariadb-server

# PHP
$ apt install php libapache2-mod-php php-mysql
```

## Guacamole 🥑

[Apache Guacamole™](https://guacamole.apache.org/)

[Install Apache Guacamole on Debian 10 - kifarunix.com](https://kifarunix.com/install-apache-guacamole-on-debian-10/)

## Hypervisor 🕶

[](https://www.cyberciti.biz/faq/install-kvm-server-debian-linux-9-headless-server/)

[](https://www.cyberciti.biz/faq/how-to-create-create-snapshot-in-linux-kvm-vmdomain/)

[libvirt Networking Handbook - Jamie Nguyen](https://jamielinux.com/docs/libvirt-networking-handbook/)

```console
# VNC
$ sudo apt install tigervnc-standalone-server tigervnc-common

# KVM
$ sudo apt install qemu-kvm libvirt0 libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin
os-variant=generic

# SSH Tunneling
$ ssh root@192.168.1.77 -L 5901:127.0.0.1:5901 -fN
```

### Windows 🪟

[Create Windows KVM VM from Command Line](https://kyle.pericak.com/windows-kvm-command-line.html)

[GitHub - virtio-win/virtio-win-pkg-scripts: Scripts for packaging virtio-win drivers](https://github.com/virtio-win/virtio-win-pkg-scripts)

## Nextcloud ☁️

[Example installation on Ubuntu 20.04 LTS - Nextcloud latest Administration Manual latest documentation](https://docs.nextcloud.com/server/latest/admin_manual/installation/example_ubuntu.html)

[Index of /server/releases](https://download.nextcloud.com/server/releases/)

```console
# manually add file
chown -R www-data:www-data <path/to/new/files>
sudo -u www-data php occ files:scan --all
```

## Jellyfin 🐡

[Downloads](https://jellyfin.org/downloads/)
