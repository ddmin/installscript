# Frequently Encountered Problems

1. Ranger returns an error code

        I aliased ranger to 'ranger && wal'. Probably has something to do with wal

2. Can't access Cinnamon settings

        You have to downgrade the PIL to 5.4.1

3. Weather info not displaying in the homepage

        Set mixed content to false in about:config

4. What's the command for rofi?

        `rofi -modi drun -show drun -show-icons -icon-theme Papirus`

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

    Probably because I didn't install fzf

10. Change screenshot to show more options

    Set shortcut to `/usr/bin/gnome-screenshot --interactive`