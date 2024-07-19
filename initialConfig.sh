#!/bin/zsh
echo "MacOS Configuration & Application Installation"
echo "Please enter administrator password:"
echo

# ask for the administrator password upfront.
sudo -v

# keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# set hostname
echo "Setting hostname"
myname="theKnife"
sudo scutil --set ComputerName $myname
sudo scutil --set HostName $myname
sudo scutil --set LocalHostName $myname
hostname -f
echo

# Install rosetta
sudo softwareupdate --install-rosetta

# install hombrew
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo

# add Homebrew to your PATH:
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/garjones/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
echo

# enable brew auto completion
echo 'FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"' >> ~/.zprofile

# install homebrew packages using current list stored on github
wget https://raw.githubusercontent.com/garjones/macOS-config/main/brew_programs_list.txt
xargs brew install < brew_programs_list.txt
rm brew_programs_list.txt

# install app store applications (personal to gareth)
mas install 905953485       #NordVPN               (7.0.0)
mas install 403304796       #iNet Network Scanner  (2.8.51)
mas install 1037126344      #Apple Configurator 2  (2.15)
mas install 409201541       #Pages                 (11.2)
mas install 409183694       #Keynote               (11.2)
mas install 1198176727      #Controller            (5.11.0)
mas install 494803304       #WiFi Explorer         (3.3.2)
mas install 1274495053      #Microsoft To Do       (2.59)
mas install 409203825       #Numbers               (11.2)
mas install 497799835       #Xcode                 (13.2.1)

# use font Menlo Regular for Powerline 12

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# comment out ZSH_THEME
sed -i.bak "s/ZSH_THEME=\"robbyrussell\"/#ZSH_THEME=\"robbyrussell\"/" .zshrc

# configure oh-me-zsh to use powerlevel10k theme and plugins
echo '# omz theme and plugins'                                                                      >> ~/.zshrc
echo 'source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme'                            >> ~/.zshrc
echo 'source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'            >> ~/.zshrc
echo 'source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh'  >> ~/.zshrc
echo ''                                                                                             >> ~/.zshrc

# add support for az cli command line completion
echo '# az cli completion'                                                                          >> ~/.zshrc
echo 'autoload -Uz compinit'                                                                        >> ~/.zshrc
echo 'autoload -Uz bashcompinit'                                                                    >> ~/.zshrc
echo 'compinit'                                                                                     >> ~/.zshrc
echo 'bashcompinit'                                                                                 >> ~/.zshrc
echo 'source /opt/homebrew/etc/bash_completion.d/az'                                                >> ~/.zshrc
echo ''                                                                                             >> ~/.zshrc

# create symbolic links for iCloud folders
echo "Creating symbolic links for iCloud"
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/dev ~/dev
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/dev/ssh ~/.ssh
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/install ~/install
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Pictures.Files ~/Pictures/Files
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Movies.Files ~/Movies/Files

# add microsoft teams custom backgrounds folder
rm -rf ~/Library/Containers/com.microsoft.teams2/Data/Library/Application\ Support/Microsoft/MSTeams/Backgrounds/Uploads
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Pictures.Files/teams ~/Library/Containers/com.microsoft.teams2/Data/Library/Application\ Support/Microsoft/MSTeams/Backgrounds/Uploads
echo

# set dock preferences - size, delete default entries, add entries we want restart dock
# this command will return the dock back to its default settings
# rm ~/Library/Preferences/com.apple.dock.plist; killall Dock
# if preferences do not get loaded properly
# killall cfprefsd
echo "Setting Dock Preferences"
defaults write com.apple.dock tilesize -int 48
defaults delete com.apple.dock persistent-apps
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Launchpad.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Utilities/Screenshot.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Messages.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Utilities/Terminal.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Edge.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Teams.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Outlook.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/ManyCam/ManyCam.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
killall Dock
echo

# set finder preferences
defaults write com.apple.finder ShowPathbar -boolean true
defaults write com.apple.finder ShowStatusBar -boolean true
defaults write com.apple.finder ShowTabView -boolean true
defaults write com.apple.finder ShowHardDrivesOnDesktop -boolean false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -boolean false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -boolean false
defaults write com.apple.finder ShowMountedServersOnDesktop -boolean false
defaults write com.apple.finder NewWindowTarget PfHm
defaults write com.apple.finder NewWindowTargetPath $HOME
killall Finder
echo

# set terminal preferences
wget https://raw.githubusercontent.com/garjones/macOS-config/main/GJPro.terminal
open GJPro.terminal
rm GJPro.terminal

# set the defaults and kill the terminal otherwise it will overwrite changes
read -p "Installation complete. About to kill the terminal ... "
defaults write com.apple.terminal "Default Window Settings" "GJPro"
defaults write com.apple.terminal "Startup Window Settings" "GJPro"
killall Terminal

# what other programs do I normally install?
wget https://secure.chamsys.co.uk/downloads/v1_9_5_6/magicq_mac_intel_v1_9_5_6.dmg       
wget https://www.capture.se/Portals/0/Downloads/Archive/Capture%202023.1.10.dmg
wget https://cdn.etcconnect.com/ETCnomad%20Eos%20Mac%203.2.8.25.zip
wget https://s3.bitfocus.io/builds/companion/companion-mac-arm64-3.3.1+7001-stable-ee7c3daa.dmg
wget https://github.com/docsteer/sacnview/releases/download/v2.1.3/sACNView_2.1.3.dmg
wget https://download2.manycams.com/ManyCam.dmg  

# manual downloads
open https://developer.apple.com/download/more/
open https://contour-design.co.uk/Contour-Multimedia-Controller-driver-macOS-Big-Sur-and-macOS-Monterey
