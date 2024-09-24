### update apt
```
sudo apt update
```
### install need packages
```
sudo apt install curl gnupg2 build-essential libssl-dev libreadline-dev zlib1g-dev libpq-dev libsqlite3-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common git nodejs yarn
sudo apt-get install libffi-dev libyaml-dev
```

### install rbenv and ruby
```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
```

### install ruby
```
rbenv install 3.2.2
rbenv global 3.2.2
```

### update RubyGems and install rails
```
gem update --system
gem install rails
```

### make project
```
rails new blog
```

### start server
```
rails server
```


### Mysql Install
sudo apt-get update
sudo apt-get install mysql-client libmysqlclient-dev


### Gem File Update
vim GemFile
gem 'mysql2', '>= 0.5.3'

### install Mysql
bundle install
