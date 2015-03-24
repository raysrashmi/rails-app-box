function install {
    echo installing $1
    shift
    echo "$@"
   apt-get -y install "$@" > /dev/null 2>&1
}
echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
sudo apt-get -y update >/dev/null 2>&1

sudo apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

sudo apt-get -y install libssl-dev


echo "$(whoami)"
curl --help || sudo apt-get -y install curl
echo "$(curl)"

install 'development tools' build-essential

install Git git

echo Installing RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
echo "$(rvm --help)"

rvm install 2.2.1
rvm use 2.2.1

echo Installing Bundler
gem install bundler -N >/dev/null 2>&1

#postgress
install PostgreSQL postgresql postgresql-contrib libpq-dev

sudo -u postgres createuser --superuser vagrant
sudo su postgres createdb -O vagrant_development
sudo su postgres createdb -O vagrant_test

#clone repository
rm -rf vagrant-test
echo "$(pwd)"
cd /vagrant
git clone https://github.com/raysrashmi/vagrant-test.git
cd vagrant-test
echo "$(pwd) $(whoami)"
bundle
rails s -b 0.0.0.0
# install Npm npm
# install 'ExecJS runtime' nodejs
# npm install -g bower

echo 'all set, rock on!'

