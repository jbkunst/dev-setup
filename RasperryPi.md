# R v4.0.3

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

# R packages

```
# install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")
# core
install.packages(c("tidyverse", "shiny"))
tidyverse::tidyverse_update()

# ggplot2
install.packages(c("ggforce", "patchwork"))


```
