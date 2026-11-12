# Brewfile - Mac reinstall list
# Updated 2026-11-11. Built from this Mac's `brew list`, its /Applications
# listing, and `brew leaves --installed-on-request` from the old Mac.
#
# Usage on a fresh Mac:
#   1. Install Homebrew (https://brew.sh)
#   2. Sign in to the App Store (needed for the `mas` lines)
#   3. brew bundle install --file=Brewfile
#   4. Work through the MANUAL INSTALLS section at the bottom
#
# To refresh this file later:  brew bundle dump --force --file=Brewfile
# (that overwrites the comments and manual sections, so keep a copy)

# ---------------------------------------------------------------
# Command-line tools
# (from `brew leaves --installed-on-request` on the old Mac, plus
#  aria2 and xcodes)
# ---------------------------------------------------------------
# Shell
brew "powerlevel10k"
brew "zsh-history-substring-search"
brew "zsh-syntax-highlighting"
brew "powershell"
brew "coreutils"

# Git and dev
brew "git"
brew "gh"
brew "git-filter-repo"
brew "go"
brew "node"
brew "llvm"
brew "pyenv"
brew "pipx"
brew "python@3.12"
brew "libzip"

# Network and system
brew "nmap"
brew "arp-scan"
brew "iperf3"
brew "fio"
brew "rsync"
brew "sshpass"
brew "telnet"
brew "wget"

# Media
brew "ffmpeg@7"                       # keg-only: run `brew link ffmpeg@7` if ffmpeg is not found
brew "mediamtx"
brew "whisper.cpp"

# Utilities
brew "age"
brew "dos2unix"
brew "jq"
brew "pandoc"
brew "paml"
brew "mas"                            # Mac App Store CLI (needed for the mas lines)

# Xcode installer
brew "aria2"                          # parallel downloads for xcodes
brew "xcodes"                         # core formula, NOT the xcodesorg tap

# ---------------------------------------------------------------
# Apps (casks)
# ---------------------------------------------------------------
cask "1password"
cask "4k-video-downloader+"
cask "adobe-creative-cloud"
cask "arduino-ide"
cask "beyond-compare"
cask "caldigit-docking-utility"
cask "claude"
cask "claude-code"
cask "companion"
cask "firefox"
cask "gcc-arm-embedded"
cask "google-chrome"
cask "google-drive"
cask "ilok-license-manager"
cask "macwhisper"
cask "microsoft-auto-update"
cask "microsoft-office"
cask "microsoft-teams"
cask "ndi-tools"
cask "nordvpn"
cask "obs"
cask "obsidian"
cask "postman"
cask "qlab"
cask "raspberry-pi-imager"
cask "resolume-arena"
cask "sacnview"
cask "sf-symbols"
cask "soundsource"
cask "superhuman"
cask "task-manager-tmog"
cask "visual-studio-code"
cask "vlc"
cask "wifi-explorer"
cask "wifiman"
cask "wispr-flow"
cask "zoom"

# ---------------------------------------------------------------
# Fonts
# ---------------------------------------------------------------
cask "font-anonymice-powerline"
cask "font-consolas-for-powerline"
cask "font-dejavu-sans-mono-for-powerline"
cask "font-delugia-mono-powerline"
cask "font-delugia-powerline"
cask "font-droid-sans-mono-for-powerline"
cask "font-fira-mono-for-powerline"
cask "font-inconsolata-dz-for-powerline"
cask "font-inconsolata-for-powerline"
cask "font-inconsolata-for-powerline-bold"
cask "font-inconsolata-g-for-powerline"
cask "font-liberation-mono-for-powerline"
cask "font-menlo-for-powerline"
cask "font-meslo-for-powerlevel10k"
cask "font-meslo-for-powerline"
cask "font-monofur-for-powerline"
cask "font-monoton"
cask "font-montserrat"
cask "font-powerline-symbols"
cask "font-roboto-mono-for-powerline"
cask "font-sf-mono-for-powerline"
cask "font-source-code-pro"
cask "font-source-code-pro-for-powerline"
cask "font-source-sans-3"
cask "font-ubuntu-mono-derivative-powerline"

# Noto fonts. The font-noto-sans-* run stops at "devanagari", which looks
# like a partial bulk install. Trim to the ones you actually use.
cask "font-noto-color-emoji"
cask "font-noto-color-emoji-compat-test"
cask "font-noto-emoji"
cask "font-noto-kufi-arabic"
cask "font-noto-mono-for-powerline"
cask "font-noto-music"
cask "font-noto-naskh-arabic"
cask "font-noto-naskh-arabic-ui"
cask "font-noto-nastaliq-urdu"
cask "font-noto-nerd-font"
cask "font-noto-rashi-hebrew"
cask "font-noto-sans"
cask "font-noto-sans-adlam"
cask "font-noto-sans-adlam-unjoined"
cask "font-noto-sans-anatolian-hieroglyphs"
cask "font-noto-sans-arabic"
cask "font-noto-sans-arabic-ui"
cask "font-noto-sans-armenian"
cask "font-noto-sans-avestan"
cask "font-noto-sans-balinese"
cask "font-noto-sans-bamum"
cask "font-noto-sans-bassa-vah"
cask "font-noto-sans-batak"
cask "font-noto-sans-bengali"
cask "font-noto-sans-bengali-ui"
cask "font-noto-sans-bhaiksuki"
cask "font-noto-sans-brahmi"
cask "font-noto-sans-buginese"
cask "font-noto-sans-buhid"
cask "font-noto-sans-canadian-aboriginal"
cask "font-noto-sans-carian"
cask "font-noto-sans-caucasian-albanian"
cask "font-noto-sans-chakma"
cask "font-noto-sans-cham"
cask "font-noto-sans-cherokee"
cask "font-noto-sans-chorasmian"
cask "font-noto-sans-cjk"
cask "font-noto-sans-cjk-hk"
cask "font-noto-sans-cjk-jp"
cask "font-noto-sans-cjk-kr"
cask "font-noto-sans-cjk-sc"
cask "font-noto-sans-cjk-tc"
cask "font-noto-sans-coptic"
cask "font-noto-sans-cuneiform"
cask "font-noto-sans-cypriot"
cask "font-noto-sans-cypro-minoan"
cask "font-noto-sans-deseret"
cask "font-noto-sans-devanagari"

# ---------------------------------------------------------------
# Mac App Store
# ---------------------------------------------------------------
mas "ArtNetView", id: 1439166791
mas "iNet Network Scanner", id: 403304796

mas "Flighty", id: 1358823008
mas "GarageBand", id: 682658836
mas "iMovie", id: 408981434

# ---------------------------------------------------------------
# Optional casks that were on the old Mac but not carried over.
# Uncomment to install.
# ---------------------------------------------------------------
# cask "aerial"
# cask "sonos"
# cask "font-inter"
# cask "font-inter-tight"

# ===============================================================
# MANUAL INSTALLS (not in Homebrew)
# ===============================================================
#
# Xcode
#   xcodes install --latest --experimental-unxip
#   sudo xcodebuild -license accept && xcodebuild -runFirstLaunch
#   (installs as /Applications/Xcode-<version>.app)
#
# Adobe - install from the Creative Cloud app (cask above):
#   Acrobat DC
#   Illustrator (Beta)
#   Media Encoder (Beta)
#   Photoshop (Beta)
#   Premiere Pro (Beta)
#
# Blackmagic - blackmagicdesign.com/support
#   DaVinci Resolve      (check About on the old Mac: free vs Studio.
#                         Studio needs the Studio installer + licence key)
#   Desktop Video        (brings Media Express and Disk Speed Test)
#   Converters Setup
#   Camera Setup
#   Blackmagic RAW and Proxy Generator Lite come with Resolve
#
# Lighting / AV vendor downloads
#   MagicQ               (ChamSys)
#   Advatek Assistant 3  (Advatek)
#   Communicator Next
#   ProjectorManager
#
# Comes with something else / nothing to do
#   Google Docs, Sheets, Slides   - shortcuts added by google-drive
#   Excel, Word, PowerPoint, Outlook, OneNote, OneDrive - microsoft-office
#   NDI apps                      - ndi-tools
#   Resolume Alley and Wire       - resolume-arena
#   Microsoft Defender Shim       - not installed by hand; probably pushed
#                                   by Microsoft 365 / device management
#   Safari, Utilities             - macOS
#
# ===============================================================
# NOTES
# ===============================================================
# - angry-ip-scanner and zenmap casks were disabled 2026-09-01 (fail
#   Gatekeeper). Use nmap / arp-scan instead:
#     sudo arp-scan --localnet
#     sudo nmap -sn 10.0.10.0/24
# - Use 4k-video-downloader+ (native arm64). The plain 4k-video-downloader
#   cask is x64 only and needs Rosetta.
# - Ventoy2Disk on the old Mac came from a third-party Homebrew tap
#   (casks ventoy2disk, ventoy2disk-cli). Ventoy has no official Mac build.
#   Find the tap with `brew info --cask ventoy2disk` on the old Mac, or
#   run the official Ventoy2Disk.sh from a Linux machine.
# - Deliberately not carried over from the old Mac: Angry IP Scanner,
#   Apple Configurator, Contour Shuttle, ControllerForHomeKit, Copilot,
#   HP Click, Kyocera Print Panel, Sonos, Ventoy2Disk, the old
#   4K Video Downloader, Blackmagic Disk Speed Test 2 (duplicate).
# - Keyboard firmware tools (qmk/qmk/qmk, osx-cross/avr/avr-gcc@9) are left
#   out on purpose. They live in third-party taps, which Homebrew refuses
#   to load until you run `brew trust <tap>`.
# - The xcodesorg/made tap build of xcodes needs Xcode to compile; use the
#   core `xcodes` formula above instead.
