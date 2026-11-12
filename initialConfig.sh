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
wget https://raw.githubusercontent.com/garjones/macOS-config/main/Brewfile
brew bundle install --file=Brewfile
rm Brewfile

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

# create symbolic links for iCloud folders
echo "Creating symbolic links for iCloud"
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/dev ~/dev2
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/dev/ssh ~/.ssh
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/install ~/install
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Pictures.Files ~/Pictures/Files
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Movies.Files ~/Movies/Files

# set dock preferences - size, delete default entries, add entries we want restart dock
# this command will return the dock back to its default settings
# rm ~/Library/Preferences/com.apple.dock.plist; killall Dock
# if preferences do not get loaded properly
# killall cfprefsd
echo "Setting Dock Preferences"
defaults write com.apple.dock tilesize -int 48
defaults delete com.apple.dock persistent-apps
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Utilities/Screenshot.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Claude.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Messages.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Utilities/Terminal.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
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

# see brewfile for other apps to install
