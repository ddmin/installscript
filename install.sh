# Install git
echo Installing git... 
sudo apt-get -y install git > /dev/null
echo Done

# Install fzf
# NOTE: This must be manually installed
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install pip3 and pip
echo Installing pip3... 
sudo apt-get -y install python3-pip > /dev/null
echo Done

echo Installing pip... 
sudo apt-get -y install python-pip > /dev/null
echo Done

# pywal
echo Installing pywal...
pip3 install pywal

# Install gimp
echo Installing gimp... 
sudo apt-get -y install gimp > /dev/null
echo Done

# Install neofetch
echo Installing neofetch...
sudo apt-get -y install neofetch > /dev/null
echo Done

# Install virtualbox
echo Installing virtualbox... 
sudo apt-get -y install virtualbox-qt > /dev/null
echo Done

# Install vim
echo Installing vim... 
sudo apt-get -y install vim > /dev/null
echo Done

# Install Sublime Text
sudo apt-get -y install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list 
sudo apt-get -y update > /dev/null

echo Installing sublime-text... 
sudo apt-get -y install sublime-text > /dev/null
echo Done

echo Installing zathura...
sudo apt-get -y install zathura > /dev/null
echo Done

# ranger
git clone https://github.com/ranger/ranger.git /tmp/ranger
cd /tmp/ranger
sudo make install

# ueberzug

# First install dependencies
echo Installing dependencies for Ueberzug...
sudo apt-get -y install libjpeg-dev > /dev/null
sudo apt-get -y install zlib1g-dev > /dev/null
sudo apt-get -y install libxtst-dev > /dev/null
echo Done

# Then install ueberzug
echo Installing Ueberzug... 
sudo pip3 install ueberzug > /dev/null
echo Done

# rtv (reddit terminal viewer)
echo Installing rtv... 
sudo apt-get -y install rtv > /dev/null
echo Done

# Media for rtv
echo Installing feh... 
sudo apt-get -y install feh > /dev/null
echo Done

echo Installing mpv... 
sudo apt-get -y install mpv > /dev/null
echo Done

echo Installing vlc...
sudo apt-get -y install vlc > /dev/null
echo Done

# powerline-shell
echo Installing powerline-shell 
sudo apt-get -y install powerline > /dev/null
echo Done

pip install git+git://github.com/Lokaltog/powerline
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

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
mkdir ~/.config/ranger
ranger --copy-config=all

mv /tmp/dot/commands.py ~/.config/ranger
mv /tmp/dot/rc.conf ~/.config/ranger
mv /tmp/dot/rifle.conf ~/.config/ranger
mv /tmp/dot/scope.sh ~/.config/ranger

# rtv .mailcap
mv /tmp/dot/.mailcap ~/.mailcap

# powerline configs
mkdir ~/.config/powerline
mv /tmp/dot/config.json ~/.config/powerline/config.json
