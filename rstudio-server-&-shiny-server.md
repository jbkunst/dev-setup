# Never Forget Shiny

Mainly from http://deanattali.com/2015/05/09/setup-rstudio-shiny-server-digital-ocean/

## Install R
```
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

sudo apt-get update
sudo apt-get -y install r-base
```

## Add swap if needed
```
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1
sudo sh -c 'echo "/var/swap.1 swap swap defaults 0 0 " >> /etc/fstab'
```

## devtools Dependencies

```
sudo apt-get -y install libcurl4-gnutls-dev libxml2-dev libssl-dev nginx
```

## Installing main packages

```
sudo su - -c "R -e \"install.packages(c('devtools', 'tidyerse', 'shiny'), repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"devtools::install_github('jbkunst/highcharter')\""
```

## rstudio-server or shiny-server

```
sudo apt-get -y install libapparmor1 gdebi-core

wget https://download2.rstudio.org/rstudio-server-0.99.896-amd64.deb
sudo gdebi rstudio-server-0.99.896-amd64.deb

wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.4.2.786-amd64.deb
sudo gdebi shiny-server-1.4.2.786-amd64.deb
```

## git
```
sudo apt-get install git
git config --global user.email "jbkunst@gmail.com"
git config --global user.name "Joshua"
```
Generate Key
```
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

## Python
```
apt-get install python-dev
```

PIP
```
sudo apt-get install python-pip
```

How to use pip
```
sudo pip-python install virtualenv
pip freeze > requieriments.txt
pip install -r requieriments.txt
```

Virtualenv
```
sudo apt-get install python-virtualenv
```

How to use virtualenv
```
virtualenv myenv
source myenv
deactivate myenv
```

## R
```
sudo nano /etc/apt/sources.list    
deb http://cran.rstudio.com/bin/linux/ubuntu saucy/
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

Don't forget execute the next line in the terminal for install "curl" packages:

```
sudo apt-get install libcurl4-openssl-dev
```

Consider the next lines for use rmkarkdown

```
sudo apt-get install tex
sudo apt-get install texlive-latex-recommended
```
