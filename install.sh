#!/bin/bash

# install homebrew
eval '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

# homebrew install cli
CLIBREWS=(
forego
git
git-flow
heroku
rbenv
ruby-build
python
redis
postgresql
)

for CLIBREW in ${CLIBREWS[@]};
do
  brew install $CLIBREW -y
done

# homebrew cask install gui
GUIBREWS=(
iterm2
google-chrome
tower
postgres
sequel-pro
imageoptim
)

for GUIBREW in ${GUIBREWS[@]};
do
  brew cask install $GUIBREW -y --appdir=~/Applications
done

