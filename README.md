# installscript
Bash script to automatically install programs and make changes to bashrc and vimrc. Uses apt as the package manager, so this only works in Ubuntu and its derivatives.

[Screenshot](https://github.com/ddmin/installscript/blob/master/setup.png)

# Installations:

# Python
* python3-pip and python-pip

# Image Editor
* gimp (not automatically installed on older versions of xubuntu)

# Text Editor(s)
* vim
* [Sublime Text](https://www.sublimetext.com/)

# Files
* fzf (fuzzy finder)
* ueberzug (image viewer)
* zathura (pdf viewer)
* ranger (w/ ueberzug image previews, fzf, and pdf previews)

# Reddit
* rtv

# Pizazz
* neofetch
* powerline-shell
* panel configuration (probably only works in xubuntu)

In addition, this script copies my .bashrc, .bash_aliases, and .vimrc from [my dotfiles](https://github.com/ddmin/Dotfiles)

The script also allows the user to specify extra downloads in the installconf.sh file.
