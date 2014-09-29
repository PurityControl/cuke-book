sudo apt-get update
sudo apt-get install -y git tree mc emacs24-nox 

# install rvm and install ruby if not provisioned before
which rvm
if [ $? -ne 0 ]
then
  #download and install rvm
  \curl -sSL https://get.rvm.io | bash -s stable

  # load rvm on login
  echo '' >> ~/.bash_profile
  echo '#source profile for rvm' >> ~/.bash_profile
  echo 'source ~/.profile' >> ~/.bash_profile

  #load rvm to run now
  . ~/.bash_profile

  # install all packages needed to let rvm do its job
  rvm requirements run

  # install ruby and bundler
  rvm install ruby
  gem install bundler
else
  echo 'rvm already installed skipping...'
fi

# install gems in atm folder
cd /vagrant/atm
bundle install

