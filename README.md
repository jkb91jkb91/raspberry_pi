# SET SSH ON LOCAL MACHINE TO EASILY CONNECT WITH YOUR RASPBERRY PI 
```
ssh-keygen -t rsa # ~/.ssh/pi_key

Host pi5
    HostName pi5.local
    User jkb91
    IdentityFile ~/.ssh/pi_key
    IdentitiesOnly yes

```

# MOUNT MICRO SD CARD UNDER /mnt/lfs

Check parition name  >>> mmcblk0p2  
```
jkb91@pi5:~ $ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0         7:0    0     2G  0 loop 
sda           8:0    0 465.8G  0 disk 
├─sda1        8:1    0   512M  0 part /boot/firmware
└─sda2        8:2    0 465.3G  0 part /
mmcblk0     179:0    0  29.2G  0 disk 
├─mmcblk0p1 179:1    0   512M  0 part 
└─mmcblk0p2 179:2    0  28.6G  0 part 
zram0       254:0    0     2G  0 disk [SWAP]

```
Get UUID  
```
sudo blkid /dev/mmcblk0p2
/dev/mmcblk0p2: LABEL="rootfs" UUID="ac84b5c1-45ac-45c5-b776-ab9fef102c50" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="463150a0-02"

```
Append such entry with UUID included into /etc/fstab  
```
jkb91@pi5:~ $ cat /etc/fstab 
UUID=ac84b5c1-45ac-45c5-b776-ab9fef102c50  /mnt/lfs  ext4  defaults,nofail  0  2
```
Restart and check  
```
sudo reboot
```


# SET STATIC IP ON YOUR RASPBERRY PI TO SURVIVE RESTARTS  
```
sudo grep -l wlan0 /etc/netplan/*.yaml
vim /etc/netplan/wlan_config.yaml
```
```
network:
  version: 2
  wifis:
    wlan0:
      renderer: NetworkManager
      match: {}
      dhcp4: false
      addresses:
        - 192.168.100.41/24
      routes:
        - to: default
          via: 192.168.100.1
      nameservers:
        addresses: [1.1.1.1, 9.9.9.9]
      access-points:
        "<ACCESS_POINT>":
          auth:
            key-management: "psk"
            password: "<PASTE HERE PASSWORD>"
          networkmanager:
            uuid: "<UUID>"
            name: "<NETWORK_NAME>"
            passthrough:
              proxy._: ""
      networkmanager:
        uuid: "<UUID>"
        name: "<NETWORK_NAME>"
```

# SET SSH CONFIG ON RASPBERRY
```
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_key
    IdentitiesOnly yes
```

# MISE  
```
curl https://mise.jdx.dev/install.sh | sh
echo 'eval "$(mise activate bash)"' >> ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
mise --version

mise use -g python@3.12
mise use -g uv@latest
```

# TAILSCALE: VPN
```
curl -fsSL https://tailscale.com/install.sh | sh
sudo systemctl status tailscaled
```

# APT INSTALLATIONS  
```
sudo apt update && sudo apt install -y vim git

git config --global user.name "Kuba"
git config --global user.email "jakub.g26101991@gmail.com"
git config --global init.defaultBranch main
git config --global core.editor vim
```


# PROGRAMS  
## 1  
https://github.com/jkb91jkb91/AI_PROJECTS/blob/master/function_tooling/BOOTSTRAP.md  
