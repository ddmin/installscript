# Open addons in Firefox to download
import webbrowser

def open_webpages():
    SITES = []

    # Homepage extension
    SITES.append('https://addons.mozilla.org/en-US/firefox/addon/my-homepage/')

    # Adblock
    SITES.append('https://addons.mozilla.org/en-US/firefox/addon/adblock-plus/')

    # Video Speed Controller
    SITES.append('https://addons.mozilla.org/en-US/firefox/addon/videospeed/')

    # Control + Number
    SITES.append('https://addons.mozilla.org/en-US/firefox/addon/ctrl-number-to-switch-tabs/')

    # SauceCodePro NerdFont
    SITES.append('https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete%20Mono.ttf')

    # Stylus
    SITES.append('https://github.com/StylishThemes/GitHub-Dark')

    # CAVA
    # Ubuntu Dependencies: yes | sudo apt-get install automake libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool

    # Ubuntu Install:
    #   ./autogen.sh
    #   ./configure
    #   make
    #   sudo make install

    SITES.append('https://github.com/karlstav/cava')

    for site in SITES:
        webbrowser.open(site)

def main():
    open_webpages()

if __name__ == '__main__':
    main()
