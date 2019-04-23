# Install git
echo Installing git... 
sudo apt-get -y install git > /dev/null
echo Done

# Install fzf
# NOTE: This must be manually installed
echo Installing fzf... 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf > /dev/null
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
sudo apt-get -y install apt-transport-https > /dev/null
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
echo Installing ranger... 
git clone https://github.com/ranger/ranger.git /tmp/ranger > /dev/null
cd /tmp/ranger
sudo make install > /dev/null
echo Done

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

pip install git+git://github.com/Lokaltog/powerline > /dev/null
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf > /dev/null
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf > /dev/null
sudo mv PowerlineSymbols.otf /usr/share/fonts/ > /dev/null
fc-cache -vf /usr/share/fonts/ > /dev/null
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/ > /dev/null

# Clone my dotfile repo
echo Installing dotfiles...
git clone https://github.com/ddmin/Dotfiles.git /tmp/dot > /dev/null

# .bashrc and aliases
echo Moving bashrc and aliases... 
mv /tmp/dot/.bashrc ~/.bashrc
mv /tmp/dot/.bash_aliases ~/.bash_aliases
echo Done

# .vimrc
echo Moving vimrc...
mv /tmp/dot/.vimrc ~/.vimrc
echo Done

# .gitconfig
echo Moving gitconfig... 
mv /tmp/dot/.gitconfig ~/.gitconfig
echo Done

# ranger configs
mkdir ~/.config/ranger
ranger --copy-config=all > /dev/null

echo Moving ranger configs... 
mv /tmp/dot/commands.py ~/.config/ranger
mv /tmp/dot/rc.conf ~/.config/ranger
mv /tmp/dot/rifle.conf ~/.config/ranger
mv /tmp/dot/scope.sh ~/.config/ranger
echo Done

# rtv .mailcap
echo Moving rtv configs... 
mv /tmp/dot/.mailcap ~/.mailcap
echo Done

# powerline configs
echo Moving powerline configs... 
mkdir ~/.config/powerline
mv /tmp/dot/config.json ~/.config/powerline/config.json > /dev/null
echo Done

echo Finished Installing!
echo Machine has been configured
