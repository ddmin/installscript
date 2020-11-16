// RIP youtube-dl (2008-2020)
// never forgetti 🍝

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
	FIREFOX := [...]link{
		{"Arc Dark", "https://addons.mozilla.org/en-US/firefox/addon/arc-dark-theme-we/"},
		{"BalenaEtcher", "https://www.balena.io/etcher/"},
		{"Bypass Paywalls", "https://github.com/iamadamdev/bypass-paywalls-chrome"},
		{"CAVA", "https://github.com/karlstav/cava"},
		{"Ctrl+Number", "https://addons.mozilla.org/en-US/firefox/addon/ctrl-number-to-switch-tabs/"},
		{"Custom New Tabs", "https://addons.mozilla.org/en-US/firefox/addon/custom-new-tabs/"},
		{"Duplicate Tab", "https://addons.mozilla.org/en-US/firefox/addon/duplicate-tab-shortcut/"},
		{"GIMP Resynthesizer", "https://github.com/bootchk/resynthesizer"},
		{"OBS", "https://obsproject.com/download"},
		{"ProtonVPN", "https://protonvpn.com/download"},
		{"RetroArch", "https://github.com/libretro/RetroArch"},
		{"SauceCode Pro", "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete%20Mono.ttf"},
		{"Shotcut", "https://shotcut.org/download/"},
		{"Stylus", "https://addons.mozilla.org/en-US/firefox/addon/styl-us/"},
		{"Video Download Helper", "https://addons.mozilla.org/en-US/firefox/addon/video-downloadhelper/"},
		{"Video Speed", "https://addons.mozilla.org/en-US/firefox/addon/videospeed/"},
		{"VirtualBox", "https://www.virtualbox.org/wiki/Linux_Downloads"},
		{"Webcamoid", "http://webcamoid.github.io/"},
		{"uBlock Origin", "https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/"},
		{"youtube-dl", "https://youtube-dl.org/"},
	}

	CHROME := [...]link{
		{"Crono", "https://chrome.google.com/webstore/detail/crono/ffednpkacgekbgkcffkpoinbikhijadl?hl=en"},
		{"Enable Right Click", "https://chrome.google.com/webstore/detail/enable-right-click/hhojmcideegachlhfgfdhailpfhgknjm?hl=en"},
		{"LastPass", "https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd?hl=en-US"},
	}

	// firefox
	fmt.Fprintf(w, "<h1>Firefox</h1>\n")
	fmt.Fprintf(w, "<ul>\n")
	for _, l := range FIREFOX {
		fmt.Fprintf(w, "<li><h2><a href=%q target=\"_blank\">%s</a></h2></li>\n", l.address, l.name)
	}
	fmt.Fprintf(w, "</ul>\n")

	// chrome
	fmt.Fprintf(w, "<h1>Chrome</h1>\n")
	fmt.Fprintf(w, "<ul>\n")
	for _, l := range CHROME {
		fmt.Fprintf(w, "<li><h2><a href=%q target=\"_blank\">%s</h2></li>\n", l.address, l.name)
	}
	fmt.Fprintf(w, "</ul>\n")
}

func main() {
	http.HandleFunc("/", index)
	fmt.Println("Server is running...")
	http.ListenAndServe(":3000", nil)
}
