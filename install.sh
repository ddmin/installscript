# Install git
sudo apt-get -y install git

# panel settings
mv panelsettings ~/panelsettings

# Install fzf
# NOTE: This must be manually installed
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install pip3 and pip
sudo apt-get -y install python3-pip
sudo apt-get -y install python-pip

# Install gimp
sudo apt-get -y install gimp

# Install neofetch
sudo apt-get -y install neofetch

# Install virtualbox
sudo apt-get -y install virtualbox-qt

# Install vim
sudo apt-get -y install vim

# Install Sublime Text
sudo apt-get -y install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get -y update
sudo apt-get -y install sublime-text

# ranger
git clone https://github.com/ranger/ranger.git /tmp/ranger
cd /tmp/ranger
sudo make install
cd ~

# ueberzug

# First install dependencies
sudo apt-get -y install libjpeg-dev
sudo apt-get -y install zlib1g-dev
sudo apt-get -y install libxtst-dev

# Then install ueberzug
sudo pip3 install ueberzug

# powerline-shell
pip install git+git://github.com/Lokaltog/powerline
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf /usr/share/fonts/
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

# Clone my dotfile repo
git clone https://github.com/ddmin/Dotfiles.git /tmp/dot

# .bashrc and aliases
mv /tmp/dot/.bashrc ~/.bashrc
mv /tmp/dot/.bash_aliases ~/.bash_aliases

# .vimrc
mv /tmp/dot/.vimrc ~/.vimrc

# .gitconfig
mv /tmp/dot/.gitconfig ~/.gitconfig

# ranger configs
<<<<<<< HEAD
mv /tmp/dot/commands.py ~/.config/ranger
mv /tmp/dot/rc.conf ~/.config/ranger
mv /tmp/dot/rifle.conf ~/.config/ranger
mv /tmp/dot/scope.sh ~/.config/ranger
=======
mv commands.py ~/.config/ranger/commands.py
mv rc.conf ~/.config/ranger/rc.conf
mv rifle.conf ~/.config/ranger/rifle.conf
mv scope.sh ~/.config/ranger/scope.sh

# powerline configs
mkdir ~/.config/powerline
mv config.json ~/.config/powerline/config.json

# panel settings
mv panelsettings ~/panelsettings
>>>>>>> 857f15a0884cf1110205a98d67223d3093ab35ad
