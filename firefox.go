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
	SITES := [...]link{
		{"Arc Dark", "https://addons.mozilla.org/en-US/firefox/addon/arc-dark-theme-we/"},
		{"BalenaEtcher", "https://www.balena.io/etcher/"},
		{"Bypass Paywalls", "https://github.com/iamadamdev/bypass-paywalls-chrome"},
		{"CAVA", "https://github.com/karlstav/cava"},
		{"Ctrl+Number", "https://addons.mozilla.org/en-US/firefox/addon/ctrl-number-to-switch-tabs/"},
		{"Duplicate Tab", "https://addons.mozilla.org/en-US/firefox/addon/duplicate-tab-shortcut/"},
		{"GIMP Resynthesizer", "https://github.com/bootchk/resynthesizer"},
		{"Homepage", "https://addons.mozilla.org/en-US/firefox/addon/custom-new-tabs/"},
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

	fmt.Fprintf(w, "<h1>To Install</h1>\n")
	fmt.Fprintf(w, "<ul>\n")
	for _, l := range SITES {
		fmt.Fprintf(w, "<li><h2><a href=%q target=\"_blank\">%s</h2></li>\n", l.address, l.name)
	}
	fmt.Fprintf(w, "</ul>\n")
}

func main() {
	http.HandleFunc("/", index)
	fmt.Println("Server is running...")
	http.ListenAndServe(":3000", nil)
}
