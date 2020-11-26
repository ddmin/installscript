package main

import (
	"fmt"
	"net/http"
)

// TO_INSTALL
// Mozc - alternate language keyboard

type link struct {
	name    string
	address string
}

func index(w http.ResponseWriter, r *http.Request) {
	SOFTWARE := []link{
		{"BalenaEtcher", "https://www.balena.io/etcher/"},
		{"Brave", "https://brave.com/linux/"},
		{"CAVA", "https://github.com/karlstav/cava"},
		{"GIMP Resynthesizer", "https://github.com/bootchk/resynthesizer"},
		{"Gogh", "https://github.com/Mayccoll/Gogh"},
		{"OBS", "https://obsproject.com/download"},
		{"ProtonVPN", "https://protonvpn.com/download"},
		{"RetroArch", "https://github.com/libretro/RetroArch"},
		{"SauceCode Pro", "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete%20Mono.ttf"},
		{"Shotcut", "https://shotcut.org/download/"},
		{"VirtualBox", "https://www.virtualbox.org/wiki/Linux_Downloads"},
		{"Webcamoid", "http://webcamoid.github.io/"},
		{"youtube-dl", "https://youtube-dl.org/"},
	}

	FIREFOX := []link{
		{"Arc Dark", "https://addons.mozilla.org/en-US/firefox/addon/arc-dark-theme-we/"},
		{"Ctrl+Number", "https://addons.mozilla.org/en-US/firefox/addon/ctrl-number-to-switch-tabs/"},
		{"Custom New Tabs", "https://addons.mozilla.org/en-US/firefox/addon/custom-new-tabs/"},
		{"Duplicate Tab", "https://addons.mozilla.org/en-US/firefox/addon/duplicate-tab-shortcut/"},
		{"Stylus", "https://addons.mozilla.org/en-US/firefox/addon/styl-us/"},
		{"uBlock Origin", "https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/"},
		{"Video Download Helper", "https://addons.mozilla.org/en-US/firefox/addon/video-downloadhelper/"},
		{"Video Speed", "https://addons.mozilla.org/en-US/firefox/addon/videospeed/"},
	}

	CHROME := []link{
		{"Bypass Paywalls", "https://github.com/iamadamdev/bypass-paywalls-chrome"},
		{"Crono", "https://chrome.google.com/webstore/detail/crono/ffednpkacgekbgkcffkpoinbikhijadl?hl=en"},
		{"Enable Right Click", "https://chrome.google.com/webstore/detail/enable-right-click/hhojmcideegachlhfgfdhailpfhgknjm?hl=en"},
		{"LastPass", "https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd?hl=en-US"},
		{"Stylus", "https://chrome.google.com/webstore/detail/stylus/clngdbkpkpeebahjckkjfobafhncgmne?hl=en"},
		{"Video Speed Controller", "https://chrome.google.com/webstore/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk?hl=en"},
	}

	SOURCES := []string{"Software", "Firefox", "Chrome"}

	// software
	for i, n := range [][]link{SOFTWARE, FIREFOX, CHROME} {
		fmt.Fprintf(w, "<h1>%s</h1>\n", SOURCES[i])
		fmt.Fprintf(w, "<ul>\n")
		for _, l := range n {
			fmt.Fprintf(w, "<li><h2><a href=%q target=\"_blank\">%s</a></h2></li>\n", l.address, l.name)
		}
		fmt.Fprintf(w, "</ul>\n")
	}
}

func main() {
	http.HandleFunc("/", index)
	fmt.Println("Server is running...")
	http.ListenAndServe(":3000", nil)
}
