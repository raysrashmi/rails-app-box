function install {
    echo installing $1
    shift
    echo "$@"
   apt-get -y install "$@"
}
echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Git git

apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

apt-get -y install libssl-dev

install Rubybuild ruby-build
git clone https://github.com/sstephenson/ruby-build.git
cd ruby-build
./install.sh && cd ../

install Rbenv rbenv
echo "eval '$(rbenv init -)'" >> ~/.bashrc

echo $pwd
rbenv install 2.2.0-preview2
rbenv global 2.2.0-preview2

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

#postgress
install PostgreSQL postgresql postgresql-contrib libpq-dev

sudo -u postgres createuser --superuser vagrant

install curl
curl -sL https://deb.nodesource.com/setup | sudo bash -

install Npm npm
install 'ExecJS runtime' nodejs
npm install -g bower

echo 'all set, rock on!'

