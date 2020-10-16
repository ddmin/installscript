package main

import (
	"fmt"
	"net/http"
)

func index(w http.ResponseWriter, r *http.Request) {
	SITES := map[string]string{
		"Homepage":              "https://addons.mozilla.org/en-US/firefox/addon/custom-new-tabs/",
		"Adblock":               "https://addons.mozilla.org/en-US/firefox/addon/adblock-plus/",
		"Video Speed":           "https://addons.mozilla.org/en-US/firefox/addon/videospeed/",
		"Ctrl+Number":           "https://addons.mozilla.org/en-US/firefox/addon/ctrl-number-to-switch-tabs/",
		"Github Dark":           "https://github.com/StylishThemes/GitHub-Dark",
		"Arc Dark":              "https://addons.mozilla.org/en-US/firefox/addon/arc-dark-theme-we/",
		"CAVA":                  "https://github.com/karlstav/cava",
		"Video Download Helper": "https://addons.mozilla.org/en-US/firefox/addon/video-downloadhelper/",
		"SauceCode Pro":         "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete%20Mono.ttf",
	}
	fmt.Fprintf(w, "<h1>Firefox Plugins</h1>\n")
	fmt.Fprintf(w, "<ul>\n")
	for i := range SITES {
		fmt.Fprintf(w, "<li><h2><a href=%q target=\"_blank\">%s</h2></li>\n", SITES[i], i)
	}
	fmt.Fprintf(w, "</ul>\n")
}

func main() {
	http.HandleFunc("/", index)
	fmt.Println("Server is running...")
	http.ListenAndServe(":3000", nil)
}
