# 1 SET SSH ON LOCAL MACHINE TO EASILY CONNECT WITH YOUR RASPBERRY PI 
```
ssh-keygen -t rsa # ~/.ssh/pi_key

Host pi5
    HostName pi5.local
    User jkb91
    IdentityFile ~/.ssh/pi_key
    IdentitiesOnly yes

```

# 2 SET STATIC IP ON YOUR RASPBERRY PI TO SURVIVE RESTARTS  
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

# 2 SET SSH CONFIG ON RASPBERRY
```
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_key
    IdentitiesOnly yes
```

# 3 MISE  
```
curl https://mise.jdx.dev/install.sh | sh
echo 'eval "$(mise activate bash)"' >> ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
mise --version

mise use -g python@3.12
mise use -g uv@latest
```

# 4 APT INSTALLATIONS  
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
