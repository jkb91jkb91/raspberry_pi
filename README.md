# 1 SET SSH ON LOCAL MACHINE   
```
ssh-keygen -t rsa # ~/.ssh/pi_key

Host pi5
    HostName pi5.local
    User jkb91
    IdentityFile ~/.ssh/pi_key
    IdentitiesOnly yes

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
