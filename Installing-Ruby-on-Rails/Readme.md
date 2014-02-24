## Installing Ruby on Rails

[Source](http://www.vensign.com/como-instalar-ruby-on-rails-en-ubuntu-12-04-lts.html)

#### Update
```
sudo apt-get update
sudo apt-get install git curl
```

#### Install RVM & Ruby 
```
curl -L get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
```

#### The rest
```
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
```

#### NodeJS
```
sudo apt-get install nodejs
```

#### Install Ruby
```
rvm install 1.9.3
ruby -v
```
#### Install Rails
```
gem install rails
```

#### Test

```
rails new nombre_aplicacion
cd nombre_aplicacion
rails server
```