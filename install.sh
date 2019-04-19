# Install Sublime Text
sudo apt-get install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# install vim
sudo apt install vim

# .bashrc
cd /tmp
git clone https://github.com/ddmin/Dotfiles.git
mv .bashrc ~/.bashrc
mv .bash_aliases ~/.bash_aliases

# .vimrc
mv .vimrc ~/.vimrc

# Install neofetch
sudo apt install neofetch

# ranger

# ueberzug

# mpsyt

# Install virtualbox
sudo apt install virtualbox-qt

# Move playlists

# Install pip3 and pip
sudo apt install python3-pip
sudo apt install python-pip

# panel settings

# install gimp
sudo apt install gimp

# fzf

