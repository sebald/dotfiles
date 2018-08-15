#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
brew install bash
# brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install font tools.
brew install woff2

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lynx
brew install p7zip
brew install pigz

# Install Yarn!
brew install yarn --without-node # Node is installed via n (https://github.com/tj/n)

# Install AWS CLIs
brew install awscli
brew install amazon-ecs-cli

# Install GUI applications via cask
brew cask install google-chrome
brew cask install hyper
brew cask install visual-studio-code
brew cask install docker-edge
brew cask install spotify

# Install Fire Font
brew tap caskroom/fonts
brew cask install \
  font-fira-code \
  font-fira-mono \
  font-fira-mono-for-powerline \
  font-fira-sans

# Remove outdated versions from the cellar.
brew cleanup