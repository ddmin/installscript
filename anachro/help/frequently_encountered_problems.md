# Frequently Encountered Problems

1. Ranger returns an error code

        I aliased ranger to 'ranger && wal'. Probably has something to do with wal

2. Can't access Cinnamon settings

        You have to downgrade the PIL to 5.4.1

3. Weather info not displaying in the homepage

        Set mixed content to false in about:config

4. What's the command for rofi?

        `rofi -disable-history  -columns 3 -modi drun -show drun -show-icons -icon-theme Papirus -sorting-method fzf`

5. Get rid of Gnome-Terminal titlebar?

        run `gsettings set org.gnome.Terminal.Legacy.Settings headerbar "@mb false"`

6. Gnome-Terminal doesn't recognized installed Nerd Font

        Use Gnome-Tweak-Tools and change the monospace font globally

7. Change wallpaper in XFCE using ranger?

        1. Run in Terminal: xfconf-query -c xfce4-desktop -m and change background.

        2. `map bg shell wal --vte -q -i %f && xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP1/workspace0/last-image -s %d/%f`

8. Set Google as default search engine in Linux Mint?

	https://www.linuxmint.com/searchengines.php

9. Red error indication in powerline every time I open terminal

    Probably because I didn't install fzf or node or something else

10. Change screenshot to show more options

    Set shortcut to `/usr/bin/gnome-screenshot --interactive`

11. Go Autocomplete in YouCompleteMe
    Run `./.vim/plugged/YouCompleteMe/install.py --go-completer`

12. Applications not showing up in rofi
    Add .desktop files to ~/.local/share/applications

13. Icons for rofi?
    `~/.icons`

14. Firefox backspace to go back a page
        1. about:config
        2. browser.backspace_action = 0

15. Connect to WiFi with redirect page.
    Try 192.168.1.1 (https://unix.stackexchange.com/questions/89630/how-to-sign-into-an-open-wireless-network)
