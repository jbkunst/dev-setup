### Index

1. [First](#first-the-first)
2. [Zsh](#zsh-and-oh-my-zsh)
3. [Git](#git)
4. [Python](#python)
	1. [PIP](#pip)
	2. [Virtualenv](#virtualenv)
5. [Sublime](#sublime)
6. [R](#r)
7. [Open terminal](#open-terminal)
8. [MySQL](#myslq)

***

### First, the first
```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install ubuntu-restricted-extras
```

### Zsh and oh-my-zsh
```
sudo apt-get install zsh
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
chsh -s /bin/zsh
ZSH=$HOME/.oh-my-zsh
```

Need reboot.


### Git
```
sudo apt-get install git
git config --global user.email "jbkunst@gmail.com"
git config --global user.name "Joshua"
```

#### Generate Key
```
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

### Python

```
apt-get install python-dev
```

#### PIP
```
sudo apt-get install python-pip
```

How to use pip
```
sudo pip-python install virtualenv
pip freeze > requieriments.txt
pip install -r requieriments.txt
```

#### Virtualenv

```
sudo apt-get install python-virtualenv
```


How to use virtualenv
```
virtualenv myenv
source myenv
deactivate myenv
```



### Sublime 3
```
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
```

### R
```
sudo nano /etc/apt/sources.list    
deb http://cran.rstudio.com/bin/linux/ubuntu )precise,saucy)/
```

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
```

```
sudo add-apt-repository ppa:marutter/rdev
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install r-base
```


### Open Terminal
```
sudo apt-get install nautilus-open-terminal
nautilus -q
```

### Mysql
```
sudo apt-get install mysql-server libmysqlclient-dev
```