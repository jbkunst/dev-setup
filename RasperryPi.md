# RasperryPi

## Change the hostname/computer name

https://www.hepeng.me/changing-username-and-hostname-on-ubuntu/

Host name `rasperrypi-mark-i-8gb`.

```
sudo nano /etc/hostname
sudo nano /etc/hosts
sudo reboot
```

## git

```
sudo apt-get install git
git config --global user.email "jbkunst@gmail.com"
git config --global user.name "Joshua"
```
Generate Key if you want to push from the server
```
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

## R

### Compile  v4.0.3
Compile R v4.0.3. Sources:

- https://www.arencambre.com/2020/11/29/installing-r-on-raspberry-pi-4-with-ubuntu-20-10-64-bit/
- https://stackoverflow.com/a/65093648/829971

```
sudo apt-get install -y gfortran libreadline6-dev libx11-dev libxt-dev libpng-dev libjpeg-dev libcairo2-dev xvfb libzstd-dev texinfo texlive texlive-fonts-extra screen wget zlib1g-dev libbz2-dev liblzma-dev libpcre2-dev libcurl4-openssl-dev openjdk-11-jdk

sudo apt-get install -y g++ gfortran libreadline6-dev libx11-dev libxt-dev libpng-dev libjpeg-dev libcairo2-dev xvfb libbz2-dev libzstd-dev liblzma-dev libcurl4-openssl-dev texinfo texlive texlive-fonts-extra screen wget libpcre2-dev zlib1g-dev libbz2-dev liblzma-dev libpcre2-dev libcurl4-openssl-dev openjdk-11-jdk make

cd /usr/local/src
sudo wget https://cran.rstudio.com/src/base/R-4/R-4.0.3.tar.gz
sudo su
tar zxvf R-4.0.3.tar.gz
cd R-4.0.3
./configure --enable-R-shlib
make
make install
cd ..
rm -rf R-4.0.3*
exit
cd
apt install r-base-core
```

### R packages

System requiriments according

https://packagemanager.rstudio.com/client/#/repos/1/packages/tidyverse

```
sudo apt-get install -y libicu-dev zlib1g-dev make libcurl4-openssl-dev libssl-dev pandoc libxml2-dev
```

From R:

```
install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")
# core
pak::pkg_system_requirements("tidyverse")

install.packages(c("tidyverse", "shiny"))
tidyverse::tidyverse_update()

# ggplot2
install.packages(c("ggforce", "patchwork"))
```

From terminal/console:

```
sudo su - -c "R -e \"install.packages(c('tidyverse', 'shiny'), repos='http://cran.rstudio.com/')\""
```

## FTP

Source https://www.wikihow.com/Set-up-an-FTP-Server-in-Ubuntu-Linux

```
sudo apt-get install vsftpd
sudo nano /etc/vsftpd.conf
```

Then uncomment or write:

```
local_enable=YES
write_enable=YES

ascii_upload_enable=YES
ascii_download_enable=YES

chroot_local_user=YES
chroot_list_enable=YES

chroot_list_file=/etc/vsftpd.chroot_list
ls_recurse_enable=YES
```

Add the users in the next list, for example _ubuntu_.
```
sudo nano /etc/vsftpd.chroot_list
sudo systemctl restart vsftpd
``` 

