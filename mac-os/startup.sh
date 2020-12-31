#!/bin/bash

function print_start() {
  echo "=========================================================================================="
  echo "[START] $1"
  echo "=========================================================================================="
}

function print_end() {
  echo "=========================================================================================="
  echo "[END] $1"
  echo "=========================================================================================="
}

function print_line() {
  echo "------------------------------------------------------------------------------------------"
  echo
}

# ==========================================================================================
# xcode
# ==========================================================================================
print_start "xcode"
xcode-select --install
print_end "xcode"

print_line

# ==========================================================================================
# homebrew
# ==========================================================================================
print_start "homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
print_end "homebrew"

print_line

# ==========================================================================================
# zsh
# ==========================================================================================
print_start "zsh"
brew install zsh
chsh -s $(which zsh)

curl -fsSL "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
cd ~/.oh-my-zsh/plugins

# ==========================================================================================
# zsh install plugins
# ==========================================================================================
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions.git
echo "source ${(q-)PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "plugins=(git zsh-syntax-highlighting zsh-autosuggestions)" >> ~/.zshrc
print_end "zsh"

print_line

# ==========================================================================================
# brew packages
# ==========================================================================================
print_start "brew packages"
brew update
brew cask upgrade
brew tap AdoptOpenJDK/openjdk

brewPackages=(
  git
  docker
  docker-compose
  telnet
  mysql-client
  kubectl
)

for i in "${brewPackages[@]}"; do
  echo "Installing brewPackages $i"
  brew install $i
done

brewCasks=(
  adoptopenjdk8
  adoptopenjdk11
  adoptopenjdk
  intellij-idea
  datagrip
  sourcetree
  sublime-text
  karabiner-elements
  iterm2
  google-chrome
)

for i in "${brewCasks[@]}"; do
  echo "Installing brewCasks $i"
  brew install --cask $i
done
print_end "brew packages"

print_line

# ==========================================================================================
# [Other Apps]
# ==========================================================================================
echo "[Other Apps]"
echo "docker-desktop : https://docs.docker.com/docker-for-mac/install/"
echo "magnet"
echo
echo "Complete!!"
echo
