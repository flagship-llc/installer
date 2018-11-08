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
visual-studio-code
alfred
ngrok
)

for GUIBREW in ${GUIBREWS[@]};
do
  brew cask install $GUIBREW -y --appdir=~/Applications
done

# ngrok connect company account
TOKEN=$1
eval "/usr/local/bin/ngrok authtoken $TOKEN"

# rbenv install latest
echo 'export PATH="$HOME/.rbenv/bin:$PATH"\nif which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
eval "source ~/.bash_profile"

LATEST_RUBY=$(rbenv install -l | grep -v - | tail -1)
eval "rbenv install $LATEST_RUBY"
eval "rbenv global $LATEST_RUBY && rbenv rehash"

# settings postgresql
eval "ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# settings redis
eval "ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
