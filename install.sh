# Update apt
sudo apt -y update

# Install git
sudo apt -y install git

# Install fzf
# NOTE: This must be manually installed
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install pip3 and pip
sudo apt -y install python3-pip
sudo apt -y install python-pip

# Install gimp
sudo apt -y install gimp

# Install neofetch
sudo apt -y install neofetch

# Install virtualbox
sudo apt -y install virtualbox-qt

# Install vim
sudo apt -y install vim

# Install Sublime Text
sudo apt-y -get install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-y -key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-y -get update
sudo apt-y -get install sublime-text

# ranger
git clone https://github.com/ranger/ranger.git /tmp/ranger
pushd /tmp/ranger
sudo make install
popd

# ueberzug

# First install dependencies
sudo apt -y install libjpeg-dev
sudo apt -y install zlib1g-dev
sudo apt -y install libxtst-dev

# Then install ueberzug
sudo pip3 install ueberzug

# Clone my dotfile repo
git clone https://github.com/ddmin/Dotfiles.git /tmp/dot

# .bashrc and aliases
mv /tmp/dot/.bashrc ~/.bashrc
mv /tmp/dot/.bash_aliases ~/.bash_aliases

# .vimrc
mv .vimrc ~/.vimrc

# .gitconfig
mv .gitconfig ~/.gitconfig

# ranger configs
mv commands.py ~/.config/ranger
mv rc.conf ~/.config/ranger
mv rifle.conf ~/.config/ranger

# panel settings
mv panelsettings ~/panelsettings
