# Frequently Encountered Problems

## 1. Ranger returns an error code

I aliased ranger to 'ranger && wal'. Probably has something to do with wal

## 2. Can't access Cinnamon settings

You have to downgrade the PIL to 5.4.1

## 3. Weather info not displaying in the homepage

Set mixed content to false in about:config

## 4. What's the command for rofi?

`rofi -show drun`

## 5. Get rid of Gnome-Terminal titlebar?

run `gsettings set org.gnome.Terminal.Legacy.Settings headerbar "@mb false"`

## 6. Gnome-Terminal doesn't recognized installed Nerd Font

Use Gnome-Tweak-Tools and change the monospace font globally

## 7. Change wallpaper in XFCE using ranger?

1. Run in Terminal: xfconf-query -c xfce4-desktop -m and change background.
2. `map bg shell wal --vte -q -i %f && xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP1/workspace0/last-image -s %d/%f`

## 8. [Set Google as default search engine in Linux Mint?](https://www.linuxmint.com/searchengines.php)

## 9. Red error indication in powerline every time I open terminal

Probably because I didn't install fzf or node or something else

## 10. Change screenshot to show more options

Set shortcut to `/usr/bin/gnome-screenshot --interactive`

## 11. Go Autocomplete in YouCompleteMe

Run `./.vim/plugged/YouCompleteMe/install.py --go-completer`

## 12. Applications not showing up in rofi

Add .desktop files to ~/.local/share/applications

## 13. Icons for rofi?

`~/.icons`

## 14. Firefox backspace to go back a page

1. about:config
2. browser.backspace_action = 0

## 15. Connect to WiFi with redirect page.

[Try 192.168.1.1](https://unix.stackexchange.com/questions/89630/how-to-sign-into-an-open-wireless-network)

## 16. Prettier not working / npm not found

Turn on node, `nvm use node`

## 17. Wifi not detected on fresh install

[Copy b43 onto a flashdrive](https://askubuntu.com/questions/730799/installing-firmware-b43-installer-offline)

## 18. Slow WiFi on iMac

[Install drivers](https://archived.forum.manjaro.org/t/solved-bcm4331-inconsistent-and-slow-wifi-on-mac/95386/2)

## 19. SSH not working in rofi?

[Add ~/.ssh/config file](https://linuxize.com/post/using-the-ssh-config-file/)

## 20. [No sound from iMac headphone jack](https://linux-tips.com/t/how-to-fix-apple-imac-headphone-sound-problem/285)

Add `options snd-hda-intel model=imac27_122` to `/etc/modprobe.d/sound.conf`

## 21. Connect to wifi automatically (wpa_supplicant)

```
https://www.linuxbabe.com/command-line/ubuntu-server-16-04-wifi-wpa-supplicant
```

## 22. Automatic updates on Ubuntu

```console
1. apt install unattended-upgrades
2. dpkg-reconfigure --priority=low unattended-upgrades
```

## 23. Ctrl-G for fzf?

### Bash

```bash
bind '"\C-t": transpose-chars'
bind -x '"\C-g": fzf-file-widget'
```

### ZSH

```zsh
bindkey '^G' fzf-file-widget
bindkey '^T' transpose-chars
```

## 24. No emojis on Arch?

Install `extra/noto-fonts-emoji`

## 25. SSH permission denied?

Probably an issue on my end.
```console
# /etc/ssh/ssh_config
PasswordAuthentication yes
```

## 26. rsync into mobile?

```console
rsync -e 'ssh -p 8022' <FILES> u0_a500@192.168.1.XXX:/data/data/com.termux/files/home/storage/
```

## 27. Set folding in files

Add this to the bottom of the file

```vim
# vim: foldmethod=marker:foldlevel=0
```

## 28. Trouble converting images to PDF with ImageMagick

[Cache exhausted](https://stackoverflow.com/questions/31407010/cache-resources-exhausted-imagemagick)

```console
# /etc/ImageMagick-6/policy.xml
<policy domain="resource" name="disk" value="8GiB"/>
<policy domain="resource" name="area" value="1GiB"/>
```

[PDF blocked security policy](https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion)

```console
# /etc/ImageMagick-6/policy.xml
...
<policy domain="coder" rights="read | write" pattern="PDF" />
...
</policymap>
```

## 29. Bluetooth `org.bluez.Error.Failed`

[Possibly missing packages](https://unix.stackexchange.com/questions/258074/error-when-trying-to-connect-to-bluetooth-speaker-org-bluez-error-failed)

```console
sudo apt install pulseaudio-module-bluetooth
pulseaudio -k
pulseaudio --start
```

## 30. Bluetooth `Failed to pair: org.bluez.Error.AlreadyExists`

Try restarting bluetooth

```console
sudo service bluetooth restart
```

Or maybe [rfkill is blocking bluetooth](https://stackoverflow.com/questions/54387985/bluetooth-blocked-through-rfkill)

```console
# check status
sudo service bluetooth status
sudo rfkill unblock bluetooth
```

## 31. Bluetooth [a2dp-sink profile connect failed. Protocol not available](https://askubuntu.com/questions/1172000/a2dp-sink-profile-connect-failed)

```console
sudo apt-get install pulseaudio-module-bluetooth
sudo killall pulseaudio
pulseaudio --start
sudo service bluetooth restart
```

## 32. [Multiple Github Accounts Using SSH](https://gist.github.com/oanhnn/80a89405ab9023894df7)

```console
# Account 1
Host github-1
   HostName github.com
   IdentityFile ~/.ssh/key_1
   IdentitiesOnly yes

# Account 2
Host github-2
   HostName github.com
   IdentityFile ~/.ssh/key_2
   IdentitiesOnly yes
```

## 33. [ProtonVPN killswitch disables internet](https://askubuntu.com/questions/1319033/internet-stops-working-after-installing-protonvpn)

```console
nmcli device
sudo nmcli connection delete pvpn-killswitch
sudo nmcli connection delete pvpn-ipv6leak-protection
```

## 34. [Firefox Touch Scrolling](https://superuser.com/questions/1151161/enable-touch-scrolling-in-firefox)

/etc/security/pam_env.conf

```console
 MOZ_USE_XINPUT2 DEFAULT=1
```

## 35. [Render Japanese UTF8 in Vim](https://stackoverflow.com/questions/5166652/how-to-view-utf-8-characters-in-vim-or-gvim)

.vimrc
```console
    set encoding=utf-8
    set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
    set fileformats=unix,dos,mac
```

## 36. [Open CBZ containing WEBP with evince](https://gitlab.gnome.org/GNOME/evince/-/issues/925)
[Install webp-pixbuf-loader](https://github.com/aruiz/webp-pixbuf-loader/)

## 37. [Install Anki on Ubuntu](https://askubuntu.com/questions/1404353/how-to-install-qt6-on-ubuntu-21-10)

```console
sudo apt install qt6-base-dev
sudo apt install libxcb-cursor0
```

## 38. Run emacs as a daemon

Start daemon
```console
/usr/bin/emacs --daemon
```

Open emacsclient
```console
emacsclient -c -a 'emacs'
```

## 39. Sound not working on Galaxy Book

[necessary-verbs.sh](https://github.com/joshuagrisham/galaxy-book2-pro-linux)

## 40. Website stuck on debugger while using Inspect Element

[Set ```debugger``` ```Conditional breakpoint``` to ```false```](https://devtoolstips.org/tips/en/disable-abusive-debugger-statement/)

## 41. rofi application not changing after editing .desktop file

For snaps check ```/var/lib/snapd/desktop/applications```

## 42. Don't count underscores (_) as part of a word in Vim

```:set iskeyword-=_```

## 43. Source virtualenv from bash script

[Source the script](https://askubuntu.com/questions/813929/how-to-activate-a-virtualenv-within-bash-script-resulting-in-activated-prompt)
```source activate.sh```
