#!/usr/bin/env bash

# Install Native apps with Brew Cask
brew tap phinze/homebrew-cask
brew install brew-cask

# Programming
brew cask install iterm2
brew cask install macvim
brew cask install sublime-text
brew cask install postgres
brew cask install pgadmin3
brew cask install robomongo
brew cask install sourcetree

# Virtualization
brew cask install virtualbox
brew cask install vagrant

# Productivity
brew cask install alfred
brew cask install evernote

# Everything Else
brew cask install caffeine
brew cask install dropbox
brew cask install google-chrome
brew cask install jdownloader
brew cask install transmission
brew cask install rdio
brew cask install rescuetime
brew cask install skype
brew cask install vlc

# Games
brew cask install minecraft
brew cask install teeworlds

# Remove outdated versions from the Cellar
brew cleanup